//
//  DTError.m
//  Pods
//
//  Created by 金秋成 on 2017/3/8.
//
//

#import "DTError.h"

@implementation DTError
+(instancetype)errorWithCode:(DTErrorCode)code andMessage:(NSString *)localizedString{
    DTError * error = [[DTError alloc]init];
    error.code            = code;
    error.localizedString = localizedString;
    return error;
}
@end
