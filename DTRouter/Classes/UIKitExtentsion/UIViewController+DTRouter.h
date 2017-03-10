//
//  UIViewController+DTRouter.h
//  Pods
//
//  Created by 金秋成 on 2017/3/10.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (DTRouter)

-(void)dt_presentViewControllerURLString:(NSString *)URLString
                                animated:(BOOL)flag
                              completion:(void (^)(void))completion;

-(void)dt_presentViewControllerURLString:(NSString *)URLString
                               arguments:(NSDictionary *)arguments
                                animated:(BOOL)flag
                              completion:(void (^)(void))completion;


+(instancetype)dt_viewControllerURLString:(NSString *)URLString
                                arguments:(NSDictionary *)arguments;

@end
