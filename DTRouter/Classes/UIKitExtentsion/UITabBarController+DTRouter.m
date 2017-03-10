//
//  UITabBarController+DTRouter.m
//  Pods
//
//  Created by 金秋成 on 2017/3/10.
//
//

#import "UITabBarController+DTRouter.h"
#import "DTRouterService.h"
#import "UIViewController+DTRouter.h"
@implementation UITabBarController (DTRouter)

-(void)dt_setViewControllersWithURLStrings:(NSArray<NSString *> *)viewControllerURLStrings{

    NSMutableArray * arr = nil;
    for (NSString * URLString in viewControllerURLStrings) {
        if (!arr) {
            arr = [NSMutableArray new];
        }
        [arr addObject: [UIViewController dt_viewControllerURLString:URLString arguments:nil]];
    }
    [self setViewControllers:arr];
    
}
@end
