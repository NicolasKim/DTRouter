//
//  DTRouterService.h
//  Pods
//
//  Created by 金秋成 on 2017/3/8.
//
//

#import <Foundation/Foundation.h>
#import "DTRouterRequest.h"
#import "DTRouterResponse.h"
@interface DTRouterService : NSObject


@property (nonatomic,strong)NSString * defaultScheme;

+(instancetype)sharedInstance;

-(DTRouterResponse *)request:(DTRouterRequest *)request;

-(void)asyncRequest:(DTRouterRequest *)request response:(DTResponseBlock)respBlock;


-(void)addRouter:(NSString *)URLPattern handler:(DTRouterRegistHandler)handler;


-(DTRouterResponse *)route:(NSString *)URLString arguments:(NSDictionary *)arguments;

-(void)asyncRoute:(NSString *)URLString arguments:(NSDictionary *)arguments handler:(DTResponseBlock)handler;

-(BOOL)handleURL:(NSURL *)url;


@end
