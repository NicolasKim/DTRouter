//
//  DTRouterRequest.h
//  Pods
//  类似于POST网络请求
//  Created by 金秋成 on 2017/2/21.
//
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, DTRoterRequestType) {
    DTRoterRequestType_GET,
    DTRoterRequestType_POST,
};

@interface DTRouterRequest : NSObject
/*!
 @property
 @abstract 请求类型
 */
@property (nonatomic,assign)DTRoterRequestType  routerType;
/*!
 @property
 @abstract protocol://host/method     , protocol://host/method?param1=value1&param2=value2
 */
@property (nonatomic,strong)NSString     * URLString;
/*!
 @property
 @abstract 请求参数  参数的顺序
 */
@property (nonatomic,strong)NSArray      * params;

@end
