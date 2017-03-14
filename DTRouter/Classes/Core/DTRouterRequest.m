//
//  DTRouterRequest.m
//  Pods
//
//  Created by 金秋成 on 2017/2/21.
//
//

#import "DTRouterRequest.h"
#import "DTRouterService.h"
@interface DTRouterRequest()

@end

@implementation DTRouterRequest

-(instancetype)initRequestWithURLString:(NSString *)URLString
                          withArguments:(NSDictionary *)arguments
                                  error:(NSError *__autoreleasing *)error{
    self = [super init];
    if (self) {

        NSAssert(URLString && URLString.length > 0, @"the 'URLString' can not be nil or empty");

        if (!URLString || URLString.length <= 0) {
            if (error) {
                *error = [NSError errorWithCode:DTErrorCode_RouterURLEMPTY andMessage:@"the 'URLString' can not be nil or empty"];
            }
            return nil;
        }
        
        
        //remove percent if need
        NSString * percentRemovedURLString = [URLString stringByRemovingPercentEncoding];
        //create argument map
        NSMutableDictionary * dict = [NSMutableDictionary new];
        
        NSRange range = [percentRemovedURLString rangeOfString:@"://"];
        if (range.length <=0) {
            percentRemovedURLString = [NSString stringWithFormat:@"%@://%@",[DTRouterService sharedInstance].defaultScheme,percentRemovedURLString];
        }
//        else{
//            //exchange the scheme with service scheme
//            NSString * oldScheme = [percentRemovedURLString substringToIndex:range.location+3];
//            NSString * newScheme = [NSString stringWithFormat:@"%@://",[DTRouterService sharedInstance].appScheme];
//            percentRemovedURLString = [percentRemovedURLString stringByReplacingOccurrencesOfString:oldScheme withString:newScheme];
//        }
        
        //analize the url string
        NSURLComponents * components = [NSURLComponents componentsWithString:percentRemovedURLString];
       
        //set arguments in url string to the argument map
        [components.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [dict setObject:obj.value forKey:obj.name];
        }];
        //merge aruments to the map
        [arguments enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [dict setObject:obj forKey:key];
        }];
        _URLString = percentRemovedURLString;
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
        
        NSAssert(URLPattern && URLPattern.length > 0, @"the 'URLString' can not be nil or empty");
        
        if (!URLPattern || URLPattern.length <= 0) {
            if (error) {
                *error = [NSError errorWithCode:DTErrorCode_RouterURLEMPTY andMessage:@"the 'URLString' can not be nil or empty"];
            }
            return nil;
        } 
        
        NSString * percentRemovedURLPattern = [URLPattern stringByRemovingPercentEncoding];
        NSRange range = [percentRemovedURLPattern rangeOfString:@"://"];
        if (range.length <=0) {
            percentRemovedURLPattern = [NSString stringWithFormat:@"%@://%@",[DTRouterService sharedInstance].defaultScheme,percentRemovedURLPattern];
        }
        
        _URLPattern = percentRemovedURLPattern;
        _requestType = DTRouterRequestType_Regist;
        _registHandler = [handler copy];
    }
    return self;
}

@end
