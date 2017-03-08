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

@property (nonatomic,assign)DTRouterRequestType requestType;

@property (nonatomic,strong)NSString * URLString;//use for route

@property (nonatomic,strong)NSDictionary * arguments;

@property (nonatomic,strong)NSString * URLPattern;//use for regist

@property (nonatomic,copy)DTRouterRegistHandler  registHandler;//use for regist

-(instancetype)initRequestWithURLString:(NSString *)URLString
                      withArguments:(NSDictionary *)arguments
                              error:(NSError *__autoreleasing *)error;

-(instancetype)initRequestWithURLString:(NSString *)URLString
                              error:(NSError *__autoreleasing *)error;

-(instancetype)initRegistWithURLPattern:(NSString *)URLPattern
                            handler:(DTRouterRegistHandler)handler
                              error:(NSError *__autoreleasing *)error;


@end
