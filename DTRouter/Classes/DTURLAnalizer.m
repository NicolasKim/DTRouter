//
//  DTURLAnalizer.m
//  Pods
//
//  Created by 金秋成 on 2017/2/21.
//
//

#import "DTURLAnalizer.h"

@implementation DTURLAnalizer
+(NSDictionary *)paramDictOfURL:(NSURL *)URL{
    __block NSMutableDictionary * dict = nil;
    NSURLComponents * components = [[NSURLComponents alloc]initWithURL:URL resolvingAgainstBaseURL:YES];
    [components.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!dict) {
            dict = [NSMutableDictionary new];
        }
        [dict setObject:obj.value forKey:obj.name];
    }];
    return dict;
}

+(NSDictionary *)paramDictOfURLString:(NSString *)URLString{
    __block NSMutableDictionary * dict = nil;
    NSURLComponents * components = [[NSURLComponents alloc]initWithString:URLString];
    [components.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!dict) {
            dict = [NSMutableDictionary new];
        }
        [dict setObject:obj.value forKey:obj.name];
    }];
    return dict;
}

+(NSArray *)paramValueOfURLString:(NSString *)URLString{
    __block NSMutableArray * arr = nil;
    NSURLComponents * components = [[NSURLComponents alloc]initWithString:URLString];
    [components.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!arr) {
            arr = [NSMutableArray new];
        }
        [arr addObject:obj.value];
    }];
    return arr;
}


@end
