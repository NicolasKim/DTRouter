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

@protocol DTRouterObjectProtocol <NSObject>

-(void)dt_setupData:(NSDictionary *)data;

@end


@interface DTRouter : NSObject

+(instancetype)sharedInstance;
/*!
 @property
 @abstract registe module
 */
-(void)registModule:(DTRouterModel *)module error:(NSError *__autoreleasing *)error;

-(void)unregistModule:(DTRouterModel *)module error:(NSError *__autoreleasing *)error;


-(DTRouterResponse *)syncRequest:(DTRouterRequest *)request;

-(void)asyncRequest:(DTRouterRequest *)request withComplete:(DTResponseBlock)complete;

@end
