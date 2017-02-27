//
//  DTModularContext.h
//  Pods
//
//  Created by 金秋成 on 2017/2/27.
//
//

#import <Foundation/Foundation.h>
#import "DTModularProtocol.h"

#define DT_EXPORT_MODULE(isAsync) \
+ (void)load { [[DTModularContext sharedInstance] registModule:[self class]]; } \
-(BOOL)async { return [[NSString stringWithUTF8String:#isAsync] boolValue];}

@interface DTModularContext : NSObject

+(instancetype)sharedInstance;

-(void)registModule:(Class)moduleClass;

@end
