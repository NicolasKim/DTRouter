//
//  UIApplication+DTRouter.m
//  Pods
//
//  Created by 金秋成 on 2017/3/14.
//
//

#import "UIApplication+DTRouter.h"

typedef NS_ENUM(NSUInteger, _dtrouter_topviewcontrollertype) {
    _dtrouter_topviewcontrollertype_viewcontroller,
    _dtrouter_topviewcontrollertype_navigationcontroller,
    _dtrouter_topviewcontrollertype_tabbarcontroller,
};


@implementation UIApplication (DTRouter)

+(UIViewController *)dt_topViewController{
    return [self findTopViewControllerWithType:_dtrouter_topviewcontrollertype_viewcontroller];
}
+(UINavigationController *)dt_topNavigationController{
    return [self findTopViewControllerWithType:_dtrouter_topviewcontrollertype_navigationcontroller];
}
+(UITabBarController *)dt_topTabbarController{
    return [self findTopViewControllerWithType:_dtrouter_topviewcontrollertype_tabbarcontroller];
}


+ (UIViewController *)findTopViewControllerWithType:(_dtrouter_topviewcontrollertype)type{
    __block UIWindow *normalWindow = [[UIApplication sharedApplication].delegate window];
    if (normalWindow.windowLevel != UIWindowLevelNormal) {
        [[UIApplication sharedApplication].windows enumerateObjectsUsingBlock:^(__kindof UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.windowLevel == UIWindowLevelNormal) {
                normalWindow = obj;
                *stop        = YES;
            }
        }];
    }
    return  [self p_nextTopForViewController:normalWindow.rootViewController type:type];
}


+ (UIViewController *)p_nextTopForViewController:(UIViewController *)inViewController
                                            type:(_dtrouter_topviewcontrollertype)type {
    while (inViewController.presentedViewController) {
        inViewController = inViewController.presentedViewController;
    }
    
    if ([inViewController isKindOfClass:[UITabBarController class]]) {
        
        if (type == _dtrouter_topviewcontrollertype_tabbarcontroller) {
            return inViewController;
        }
        UIViewController *selectedVC = [self p_nextTopForViewController:((UITabBarController *)inViewController).selectedViewController type:type];
        return selectedVC;
    } else if ([inViewController isKindOfClass:[UINavigationController class]]) {
        if (type == _dtrouter_topviewcontrollertype_navigationcontroller) {
            return inViewController;
        }
        UIViewController *selectedVC = [self p_nextTopForViewController:((UINavigationController *)inViewController).visibleViewController type:type];
        return selectedVC;
    } else {
        return inViewController;
    }
}
@end
