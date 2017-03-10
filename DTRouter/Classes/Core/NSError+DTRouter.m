//
//  NSError+DTRouter.m
//  Pods
//
//  Created by 金秋成 on 2017/3/9.
//
//

#import "NSError+DTRouter.h"

NSString *const DTRouterURLPatternKey = @"kDTRouterURLPatternKey";

NSString *const DTRouterURLStringKey  = @"kDTRouterURLStringKey";


@implementation NSError (DTRouter)
+(instancetype)errorWithCode:(DTErrorCode)code andMessage:(NSString *)message{
    NSString * bundleID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    return [NSError errorWithDomain:bundleID code:code userInfo:@{NSLocalizedFailureReasonErrorKey:message}];
}

+(instancetype)errorOfURLPattern:(NSString *)pattern withCode:(DTErrorCode)code andMessage:(NSString *)message{
    NSString * bundleID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    return [NSError errorWithDomain:bundleID code:code userInfo:@{NSLocalizedFailureReasonErrorKey:message,DTRouterURLPatternKey:pattern}];
}

+(instancetype)errorOfURLString:(NSString *)URLString withCode:(DTErrorCode)code andMessage:(NSString *)message{
    NSString * bundleID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    return [NSError errorWithDomain:bundleID code:code userInfo:@{NSLocalizedFailureReasonErrorKey:message,DTRouterURLStringKey:URLString}];
}

@end
