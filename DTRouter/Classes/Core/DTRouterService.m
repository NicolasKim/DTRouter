//
//  DTRouterService.m
//  Pods
//
//  Created by 金秋成 on 2017/3/8.
//
//

#import "DTRouterService.h"
#import "DTURLPattern.h"

NSString * const defaultAppScheme = @"DTDefaultAppScheme";

NSString * const privateAsyncRequestQueueName = @"kPrivateAsyncRequestQueueName";

@interface DTRouterService ()
@property (nonatomic,strong)NSOperationQueue * privateAsyncRequestQueue;
/*!
 @property
 @abstract 路由映射集合
 */
@property (nonatomic,strong)NSMutableDictionary<DTURLPattern * , DTRouterRegistHandler> * routerMap;

@end


@implementation DTRouterService

static DTRouterService * _sharedInstance;


+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[DTRouterService alloc]init];
    });
    return _sharedInstance;
}

-(DTRouterResponse *)request:(DTRouterRequest *)request{
    DTRouterResponse * resp = [[DTRouterResponse alloc]init];
    if (request.requestType == DTRouterRequestType_Regist) {
        DTURLPattern * pattern = [[DTURLPattern alloc]initWithURLPattern:request.URLPattern];
        resp.pattern    =  pattern;
        [self.routerMap setObject:request.registHandler forKey:pattern];
    }
    else if (request.requestType == DTRouterRequestType_Route){
        DTURLPattern * URLPattern = [self getPatternOfURL:request.URLString];
        if (!URLPattern) {
            resp.error = [NSError errorWithCode:DTErrorCode_RouterDoesNotExist andMessage:@"DTErrorCode_RouterDoesNotExist"];
        }
        else{
            NSError * error = nil;
            NSDictionary * pathMap = [URLPattern getPathValueMapWithURLString:request.URLString error:nil];
            if (error) {
                resp.error = error;
            }
            else{
                DTRouterRegistHandler handler = self.routerMap[URLPattern];
                resp.resultValue = handler(pathMap,request.arguments);
            }
        }
    }
    return resp;
}

-(NSOperation *)asyncRequest:(DTRouterRequest *)request response:(DTResponseBlock)respBlock{
    __weak typeof(self)  weakSelf = self;
    NSOperation * operation = [NSBlockOperation blockOperationWithBlock:^{
                                    __strong typeof(weakSelf) strongSelf = weakSelf;
                                    [strongSelf request:request];
                                }];
    [self.privateAsyncRequestQueue addOperation:operation];
    return operation;
}

-(void)addRouter:(NSString *)URLPattern handler:(DTRouterRegistHandler)handler{
    DTRouterRequest * req = [[DTRouterRequest alloc] initRegistWithURLPattern:URLPattern handler:handler error:nil];
    [[DTRouterService sharedInstance]request:req];
}


-(DTRouterResponse *)route:(NSString *)URLString arguments:(NSDictionary *)arguments{
    DTRouterRequest * req = [[DTRouterRequest alloc]initRequestWithURLString:URLString error:nil];
    return [[DTRouterService sharedInstance]request:req];
}

-(NSOperation *)asyncRoute:(NSString *)URLString arguments:(NSDictionary *)arguments handler:(DTResponseBlock)handler{
    DTRouterRequest * req = [[DTRouterRequest alloc]initRequestWithURLString:URLString withArguments:arguments error:nil];
    return [[DTRouterService sharedInstance]asyncRequest:req response:handler];
}


-(BOOL)handleURL:(NSURL *)url{
    DTURLPattern * pattern = [self getPatternOfURL:url.absoluteString];
    if (pattern) {
        [self route:url.absoluteString arguments:nil];
        return YES;
    }
    return NO;
}


-(DTURLPattern *)getPatternOfURL:(NSString *)url{
    __block DTURLPattern * pattern = nil;
    [self.routerMap.allKeys enumerateObjectsUsingBlock:^(DTURLPattern * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isMatchWithURLString:url]) {
            pattern = obj;
            *stop = YES;
        }
    }];
    return pattern;
}

-(NSString *)defaultScheme{
    if (!_defaultScheme) {

        NSArray *urltypes = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleURLTypes"];
        NSString * URLSchemeInPlist = [[urltypes.firstObject objectForKey:@"CFBundleURLSchemes"] firstObject];
        //        CFBundleURLTypes
        //        CFBundleURLName
        //        CFBundleURLSchemes
        if (URLSchemeInPlist) {
            _defaultScheme = URLSchemeInPlist;
        }
        else{
            _defaultScheme = defaultAppScheme;
        }
        NSLog(@"%@",_defaultScheme);
    }
    return _defaultScheme;
}

-(NSMutableDictionary<DTURLPattern *,DTRouterRegistHandler> *)routerMap{
    if (!_routerMap) {
        _routerMap = [NSMutableDictionary dictionary];
    }
    return _routerMap;
}

-(NSOperationQueue *)privateAsyncRequestQueue{
    if (!_privateAsyncRequestQueue) {
        _privateAsyncRequestQueue = [[NSOperationQueue alloc] init];
        _privateAsyncRequestQueue.name = privateAsyncRequestQueueName;
    }
    return _privateAsyncRequestQueue;
}

@end
