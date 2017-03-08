//
//  DTRouterRequest.m
//  Pods
//
//  Created by 金秋成 on 2017/2/21.
//
//

#import "DTRouterRequest.h"

@interface DTRouterRequest()

@end

@implementation DTRouterRequest

-(instancetype)initRequestWithURLString:(NSString *)URLString
                          withArguments:(NSDictionary *)arguments
                                  error:(NSError *__autoreleasing *)error{
    self = [super init];
    if (self) {
        
        
        NSURL * url = [NSURL URLWithString:URLString];
        NSString * query = url.query;
        
        NSMutableDictionary * dict = [NSMutableDictionary new];
        NSArray * keyValuePair = [query componentsSeparatedByString:@"&"];
        [keyValuePair enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSArray * keyValue = [obj componentsSeparatedByString:@"="];
            [dict setObject:keyValue[1] forKey:keyValue[0]];
        }];
        
        [arguments enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [dict setObject:obj forKey:key];
        }];
        
        
        
        _URLString = URLString;
        _requestType = DTRouterRequestType_Route;
        _arguments = dict;
    }
    return self;
}

-(instancetype)initRequestWithURLString:(NSString *)URLString
                                  error:(NSError *__autoreleasing *)error{
    return [self initRequestWithURLString:URLString withArguments:nil error:error];
}

-(instancetype)initRegistWithURLPattern:(NSString *)URLPattern
                                handler:(DTRouterRegistHandler)handler
                                  error:(NSError *__autoreleasing *)error{

    self = [super init];
    if (self) {
        _URLPattern = URLPattern;
        _requestType = DTRouterRequestType_Regist;
        _registHandler = [handler copy];
    }
    return self;
}

@end
