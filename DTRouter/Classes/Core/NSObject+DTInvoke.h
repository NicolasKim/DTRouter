//
//  NSObject+DTInvoke.h
//  Pods
//
//  Created by 金秋成 on 2017/2/22.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (DTInvoke)

+ (id)dt_performSelector:(SEL)selector withObjects:(NSArray *)objects error:(NSError **)error;

- (id)dt_performSelector:(SEL)selector withObjects:(NSArray *)objects error:(NSError **)error;

+ (id)dt_performSelector:(SEL)selector
           withArguments:(NSDictionary<NSString *,id> *)arguments
       andArgumentMapper:(NSDictionary<NSString *,NSNumber *> *)argumentMapper
                   error:(NSError **)error;

- (id)dt_performSelector:(SEL)selector
           withArguments:(NSDictionary<NSString *,id> *)arguments
       andArgumentMapper:(NSDictionary<NSString *,NSNumber *> *)argumentMapper
                   error:(NSError **)error;

@end
