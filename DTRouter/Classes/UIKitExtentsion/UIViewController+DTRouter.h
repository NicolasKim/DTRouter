//
//  UIViewController+DTRouter.h
//  Pods
//
//  Created by 金秋成 on 2017/2/22.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (DTRouter)

-(void)dt_presentViewControllerURL:(NSString *)URLString animated:(BOOL)animated completion:(void (^ __nullable)(void))completion;
-(void)dt_presentViewControllerURL:(NSString *)URLString initParams:(NSArray *)params animated:(BOOL)animated completion:(void (^ __nullable)(void))completion;

@end
