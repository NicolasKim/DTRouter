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

@property (nonatomic,strong)NSString * appScheme;

+(instancetype)sharedInstance;

-(DTRouterResponse *)request:(DTRouterRequest *)request;

-(void)request:(DTRouterRequest *)request response:(DTResponseBlock)respBlock;


-(BOOL)handleURL:(NSURL *)url;

@end
