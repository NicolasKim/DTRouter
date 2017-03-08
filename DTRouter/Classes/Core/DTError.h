//
//  DTError.h
//  Pods
//
//  Created by 金秋成 on 2017/3/8.
//
//

#import <Foundation/Foundation.h>



typedef NS_ENUM(NSUInteger, DTErrorCode) {
    DTErrorCode_RouterAlreadyExist = 10000,
    DTErrorCode_RouterDoesNotExist = 10001,
    DTErrorCode_RouterURLDoesNotMatch = 10002,
};





@interface DTError : NSObject
@property (nonatomic,assign)DTErrorCode  code;
@property (nonatomic,strong)NSString   * localizedString;

+(instancetype)errorWithCode:(DTErrorCode)code andMessage:(NSString *)localizedString;

@end
