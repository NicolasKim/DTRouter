//
//  UINavigationController+DTRouter.h
//  Pods
//
//  Created by 金秋成 on 2017/2/24.
//
//

#import <UIKit/UIKit.h>

@interface UINavigationController (DTRouter)
-(void)dt_pushViewControllerURL:(NSString * __nonnull)URLString animated:(BOOL)animated;
-(void)dt_pushViewControllerURL:(NSString * __nonnull)URLString initParams:(NSArray *)params animated:(BOOL)animated;
@end
