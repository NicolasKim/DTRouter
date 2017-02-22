//
//  DTRouterURLManager.m
//  Pods
//
//  Created by 金秋成 on 2017/2/21.
//
//

#import "DTRouterURLManager.h"
#import "DTRouterRequest.h"
#import "DTRouterModel.h"
@interface DTRouterURLManager ()
@property (nonatomic,strong)NSMutableSet<DTRouterModel *> * URLMap;
@end

@implementation DTRouterURLManager
static DTRouterURLManager * _instance;

+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[DTRouterURLManager alloc]init];
    });
    return _instance;
}

-(void)registModule:(DTRouterModel *)module error:(NSError *__autoreleasing *)error{
    [self.URLMap addObject:module];
}

-(void)unregistModule:(DTRouterModel *)module error:(NSError *__autoreleasing *)error{
    [self.URLMap removeObject:module];
}


-(DTRouterModel *)modelWithRequest:(DTRouterRequest *)request error:(NSError *__autoreleasing *)error{
    __block DTRouterModel * model = nil;
    [self.URLMap enumerateObjectsUsingBlock:^(DTRouterModel * _Nonnull obj, BOOL * _Nonnull stop) {
        NSURLComponents * mapComp = [NSURLComponents componentsWithString:obj.URLString];
        NSURLComponents * reqComp = [NSURLComponents componentsWithString:request.URLString];
        if ([mapComp.scheme isEqualToString:reqComp.scheme]&&
            [mapComp.host isEqualToString:reqComp.host] &&
            [mapComp.path isEqualToString:reqComp.path]) {
            model = obj;
            *stop = YES;
        }
    }];
    
    if (!model) {
        *error = [NSError errorWithDomain:request.URLString code:-1 userInfo:@{NSLocalizedFailureReasonErrorKey:@"url scheme don't exist"}];
    }
    return model;
}

-(NSMutableSet *)URLMap{
    if (!_URLMap) {
        _URLMap = [NSMutableSet new];
    }
    return _URLMap;
}

@end
