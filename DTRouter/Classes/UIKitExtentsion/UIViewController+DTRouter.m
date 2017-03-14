//
//  UIViewController+DTRouter.m
//  Pods
//
//  Created by 金秋成 on 2017/3/10.
//
//

#import "UIViewController+DTRouter.h"
#import "DTRouterService.h"
@implementation UIViewController (DTRouter)
-(void)dt_presentViewControllerURLString:(NSString *)URLString animated:(BOOL)flag completion:(void (^)(void))completion{
    [self dt_presentViewControllerURLString:URLString arguments:nil animated:flag completion:completion];
}


-(void)dt_presentViewControllerURLString:(NSString *)URLString arguments:(NSDictionary *)arguments animated:(BOOL)flag completion:(void (^)(void))completion{
    UIViewController * viewController = [UIViewController dt_viewControllerURLString:URLString arguments:arguments];
    if (viewController) {
        [self presentViewController:viewController animated:flag completion:completion];
    }
}

+(instancetype)dt_viewControllerURLString:(NSString *)URLString arguments:(NSDictionary *)dict{
    DTRouterResponse * resp = [[DTRouterService sharedInstance]route:URLString arguments:dict];
    if (resp &&
        resp.resultValue &&
        [resp.resultValue isKindOfClass:[UIViewController class]]) {
        return resp.resultValue;
    }
    return nil;
}

@end
