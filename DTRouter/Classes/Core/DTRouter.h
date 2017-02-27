//
//  DTRouter.h
//  Pods
//
//  Created by 金秋成 on 2017/2/21.
//
//

#import <Foundation/Foundation.h>
#import "DTRouterModel.h"
#import "DTRouterRequest.h"
#import "DTRouterResponse.h"

typedef void(^DTResponseBlock)(DTRouterResponse * response);

@interface DTRouter : NSObject

+(instancetype)sharedInstance;
/*!
 @property
 @abstract registe module
 */
-(void)registModel:(DTRouterModel *)model error:(NSError *__autoreleasing *)error;

/*!
 @property
 @abstract unregiste module
 */
-(void)unregistModel:(DTRouterModel *)model error:(NSError *__autoreleasing *)error;

/*!
 @property
 @abstract invoke syncronize
 */
-(DTRouterResponse *)syncRequest:(DTRouterRequest *)request;

/*!
 @property
 @abstract invoke asyncronize
 */
-(void)asyncRequest:(DTRouterRequest *)request withComplete:(DTResponseBlock)complete;

@end
