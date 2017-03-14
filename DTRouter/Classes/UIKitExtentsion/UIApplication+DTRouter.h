//
//  UIApplication+DTRouter.h
//  Pods
//
//  Created by 金秋成 on 2017/3/14.
//
//

#import <UIKit/UIKit.h>

@interface UIApplication (DTRouter)
+(UIViewController *)dt_topViewController;
+(UINavigationController *)dt_topNavigationController;
+(UITabBarController *)dt_topTabbarController;
@end
