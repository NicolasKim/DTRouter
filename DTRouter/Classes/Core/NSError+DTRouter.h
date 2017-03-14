//
//  NSError+DTRouter.h
//  Pods
//
//  Created by 金秋成 on 2017/3/9.
//
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, DTErrorCode) {
    DTErrorCode_RouterAlreadyExist = 10000,
    DTErrorCode_RouterDoesNotExist = 10001,
    DTErrorCode_RouterURLDoesNotMatch = 10002,
    DTErrorCode_RouterURLEMPTY = 10003,
};


extern NSString *const DTRouterURLPatternKey;

extern NSString *const DTRouterURLStringKey;


@interface NSError (DTRouter)

+(instancetype)errorWithCode:(DTErrorCode)code andMessage:(NSString *)message;

+(instancetype)errorOfURLPattern:(NSString *)pattern withCode:(DTErrorCode)code andMessage:(NSString *)message;

+(instancetype)errorOfURLString:(NSString *)URLString withCode:(DTErrorCode)code andMessage:(NSString *)message;


@end
