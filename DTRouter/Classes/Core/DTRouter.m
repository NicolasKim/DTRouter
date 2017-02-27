//
//  DTRouter.m
//  Pods
//
//  Created by 金秋成 on 2017/2/21.
//
//

#import "DTRouter.h"
#import "DTRouterURLManager.h"
#import "DTURLAnalizer.h"
#import "NSObject+DTInvoke.h"
@interface DTRouter ()
{
    NSOperationQueue * _queue;
}
@end


@implementation DTRouter

static DTRouter * _instance;

+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[DTRouter alloc]init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _queue = [[NSOperationQueue alloc]init];
    }
    return self;
}


-(void)registModel:(DTRouterModel *)model error:(NSError *__autoreleasing *)error{
    [[DTRouterURLManager sharedInstance]registModel:model error:error];
}

-(void)unregistModel:(DTRouterModel *)model error:(NSError *__autoreleasing *)error{
    [[DTRouterURLManager sharedInstance]unregistModel:model error:error];
}



-(DTRouterResponse *)syncRequest:(DTRouterRequest *)request{
    DTRouterResponse * resp = [[DTRouterResponse alloc]init];
    if (request.routerType == DTRoterRequestType_GET) {
        request.params = [DTURLAnalizer paramValueOfURLString:request.URLString];
    }
    else if (request.routerType == DTRoterRequestType_POST){
        
    }
    __autoreleasing NSError * error = nil;
    DTRouterModel * model = [[DTRouterURLManager sharedInstance]modelWithRequest:request error:&error];
    if (error) {
        resp.error = error;
        return resp;
    }

    switch (model.purpose) {
        case DTRouterPurposeCreate:
        {
            __autoreleasing NSError * error = nil;
            id result = [[model.className alloc] dt_performSelector:model.selector withObjects:request.params error:&error];
            if (error) {
                resp.error = error;
            }
            else{
                resp.resultValue = result;
            }
        }
            break;
        case DTRouterPurposeInvokeClassMethod:
        {
            __autoreleasing NSError * error = nil;
            id result = [model.className dt_performSelector:model.selector withObjects:request.params error:&error];
            if (error) {
                resp.error = error;
            }
            else{
                resp.resultValue = result;
            }

        }
            break;
        case DTRouterPurposeInvokeObjectMethod:
        {
            __autoreleasing NSError * error = nil;
            id result = [model.object dt_performSelector:model.selector withObjects:request.params error:&error];
            if (error) {
                resp.error = error;
            }
            else{
                resp.resultValue = result;
            }
        }
            break;
        default:
            break;
    }
    return resp;
}

-(void)asyncRequest:(DTRouterRequest *)request withComplete:(DTResponseBlock)complete{
    [_queue addOperationWithBlock:^{
        DTRouterResponse * resp = [self syncRequest:request];
        [[NSOperationQueue mainQueue]addOperationWithBlock:^{
            complete(resp);
        }];
    }];
}

@end
