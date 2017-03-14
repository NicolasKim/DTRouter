//
//  DTRouterRequest.h
//  Pods
//  类似于POST网络请求
//  Created by 金秋成 on 2017/2/21.
//
//

#import <Foundation/Foundation.h>
#import "DTRouterResponse.h"

typedef void(^DTResponseBlock)(DTRouterResponse * response);

typedef NS_ENUM(NSUInteger, DTRouterRequestType) {
    DTRouterRequestType_Regist,//注册路由
    DTRouterRequestType_Route, //使用路由
};

typedef  id(^DTRouterRegistHandler)(NSDictionary * paths , NSDictionary * arguments);

@interface DTRouterRequest : NSObject

@property (nonatomic,assign,readonly)DTRouterRequestType requestType;

@property (nonatomic,strong,readonly)NSString * URLString;//use for route

@property (nonatomic,strong,readonly)NSDictionary * arguments;

@property (nonatomic,strong,readonly)NSString * URLPattern;//use for regist

@property (nonatomic,copy,readonly)DTRouterRegistHandler  registHandler;//use for regist



/*!
 @method
 @abstract   this function can route with any type of arguments
 @discussion if you want to set a type of NSData,NSArray,NSDictionary... you can use the arguments param
 */
-(instancetype)initRequestWithURLString:(NSString *)URLString
                      withArguments:(NSDictionary *)arguments
                              error:(NSError *__autoreleasing *)error;
/*!
 @method
 @abstract   this function can just route with string type of arguments
 @discussion set the argument like  example://exhost/path?ar1=value1&ar2=value2
             the ar1=value1&ar2=value2 will convert to keyvalue pair dictionary like {@"ar1":@"value1",@"ar2":@"value2"}
 */
-(instancetype)initRequestWithURLString:(NSString *)URLString
                              error:(NSError *__autoreleasing *)error;

/*!
 @method
 @abstract   this function use for regist router
 @URLPattern eg:
                example://host/path
                example://:host/path
                example://:host/:path/:path
                example://host/path/:path/path/path/path
 */
-(instancetype)initRegistWithURLPattern:(NSString *)URLPattern
                            handler:(DTRouterRegistHandler)handler
                              error:(NSError *__autoreleasing *)error;


@end
