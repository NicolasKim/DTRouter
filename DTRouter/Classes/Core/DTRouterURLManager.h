//
//  DTRouterURLManager.h
//  Pods
//
//  Created by 金秋成 on 2017/2/21.
//
//

#import <Foundation/Foundation.h>

@class DTRouterModel;
@class DTRouterRequest;

@interface DTRouterURLManager : NSObject

+(instancetype)sharedInstance;

-(void)registModule:(DTRouterModel *)module error:(NSError *__autoreleasing *)error;

-(void)unregistModule:(DTRouterModel *)module error:(NSError *__autoreleasing *)error;

-(DTRouterModel *)modelWithRequest:(DTRouterRequest *)request error:(NSError *__autoreleasing *)error;


@end
