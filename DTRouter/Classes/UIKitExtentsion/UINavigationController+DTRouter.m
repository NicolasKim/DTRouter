//
//  UINavigationController+DTRouter.m
//  Pods
//
//  Created by 金秋成 on 2017/2/24.
//
//

#import "UINavigationController+DTRouter.h"
#import "DTRouter.h"
@implementation UINavigationController (DTRouter)
-(void)dt_pushViewControllerURL:(NSString *)URLString animated:(BOOL)animated{
    [self dt_pushViewControllerURL:URLString initParams:nil animated:YES];

}
-(void)dt_pushViewControllerURL:(NSString *)URLString initParams:(NSArray *)params animated:(BOOL)animated{
    DTRouterRequest * request = [[DTRouterRequest alloc]init];
    if (params) {
        request.routerType = DTRoterRequestType_POST;
        request.params     = params;
    }
    else{
        request.routerType = DTRoterRequestType_GET;
    }
    request.URLString = URLString;
    DTRouterResponse * resp = [[DTRouter sharedInstance]syncRequest:request];
    if (!resp.error && [resp.resultValue isKindOfClass:[UIViewController class]]) {
        [self pushViewController:resp.resultValue animated:animated];
    }
    else if (resp.error){
#if DEBUG
        NSLog(@"%@",resp.error);
#endif
    }
    else if (![resp.resultValue isKindOfClass:[UIViewController class]]){
#if DEBUG
        NSLog(@"%@ is not kind of UIViewController Class",resp.resultValue);
#endif
    }
}
@end
