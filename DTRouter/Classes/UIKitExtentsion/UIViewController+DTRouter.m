//
//  UIViewController+DTRouter.m
//  Pods
//
//  Created by 金秋成 on 2017/2/22.
//
//

#import "UIViewController+DTRouter.h"
#import "DTRouter.h"
@implementation UIViewController (DTRouter)
-(void)dt_presentViewControllerURL:(NSString *)URLString animated:(BOOL)animated completion:(void (^ _Nullable)(void))completion{
    [self dt_presentViewControllerURL:URLString initParams:nil animated:YES completion:^{
        completion();
    }];
}
-(void)dt_presentViewControllerURL:(NSString *)URLString initParams:(NSArray *)params animated:(BOOL)animated completion:(void (^ _Nullable)(void))completion{
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
        [self presentViewController:resp.resultValue animated:animated completion:^{
            completion();
        }];
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
