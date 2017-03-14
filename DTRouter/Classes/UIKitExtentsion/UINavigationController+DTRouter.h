//
//  UINavigationController+DTRouter.h
//  Pods
//
//  Created by 金秋成 on 2017/3/10.
//
//

#import <UIKit/UIKit.h>

@interface UINavigationController (DTRouter)

-(void)dt_pushViewControllerURLString:(NSString *)URLString arguments:(NSDictionary *)dict animated:(BOOL)animated;

-(void)dt_pushViewControllerURLString:(NSString *)URLString animated:(BOOL)animated;

+(instancetype)dt_navigationControllerURLString:(NSString *)URLString
                                      arguments:(NSDictionary *)arguments
                   withRootViewControllerURLString:(NSString *)rootURLString
                                    rootArguments:(NSDictionary *)rootArguments;

@end
