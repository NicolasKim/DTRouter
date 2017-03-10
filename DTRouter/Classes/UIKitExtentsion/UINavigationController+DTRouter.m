//
//  UINavigationController+DTRouter.m
//  Pods
//
//  Created by 金秋成 on 2017/3/10.
//
//

#import "UINavigationController+DTRouter.h"
#import "UIViewController+DTRouter.h"
#import "DTRouterService.h"
@implementation UINavigationController (DTRouter)

+(instancetype)dt_navigationControllerURLString:(NSString *)URLString
                                      arguments:(NSDictionary *)arguments
                withRootViewControllerURLString:(NSString *)rootURLString
                                  rootArguments:(NSDictionary *)rootArguments{
    DTRouterResponse * resp = [[DTRouterService sharedInstance]route:URLString arguments:arguments];
    if (resp && resp.resultValue && [resp.resultValue isKindOfClass:[UINavigationController class]]){
        UINavigationController * navigationController = (UINavigationController *)resp.resultValue;
        if (rootURLString) {
            [navigationController dt_pushViewControllerURLString:rootURLString arguments:rootArguments animated:NO];
        }
        return navigationController;
    }
    return nil;
}
-(void)dt_pushViewControllerURLString:(NSString *)URLString arguments:(NSDictionary *)dict animated:(BOOL)animated{
    UIViewController * viewController = [UIViewController dt_viewControllerURLString:URLString arguments:dict];
    if (viewController) {
        [self pushViewController:viewController animated:animated];
    }
}

-(void)dt_pushViewControllerURLString:(NSString *)URLString animated:(BOOL)animated{
    [self dt_pushViewControllerURLString:URLString arguments:nil animated:animated];
}

@end
