//
//  NSObject+DTInvoke.m
//  Pods
//
//  Created by 金秋成 on 2017/2/22.
//
//

#import "NSObject+DTInvoke.h"
#import "DTURLAnalizer.h"
@implementation NSObject (DTInvoke)
+ (id)dt_performSelector:(SEL)selector withObjects:(NSArray *)objects error:(NSError **)error{
    NSMethodSignature * signature =[self methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    if (objects.count == signature.numberOfArguments-2) {
        
        for (int i = 2; i < signature.numberOfArguments; i++) {
            
            const char *type = [signature getArgumentTypeAtIndex:i];
            id argument = objects[i-2];
            if (strcmp(type, "@") == 0) {
                
                [invocation setArgument:&argument atIndex:i];
            }
            else if(strcmp(type, "@?") == 0 ||
                    strcmp(type, "?") == 0){
                Block_copy((__bridge void *)argument);
                [invocation setArgument:&argument atIndex:i];
            }
            else if (strcmp(type, "c") == 0){//char
                
            }
            else if (strcmp(type, "i") == 0){//int
                
            }
            else if (strcmp(type, "s") == 0){//short
                
            }
            else if (strcmp(type, "q") == 0){//long long
                
            }
            else if (strcmp(type, "C") == 0){//unsigned char
                
            }
            else if (strcmp(type, "I") == 0){//unsigned int
                
            }
            else if (strcmp(type, "S") == 0){//unsigned short
                
            }
            else if (strcmp(type, "L") == 0){//unsigned long
                
            }
            else if (strcmp(type, "Q") == 0){//unsigned long long
                
            }
            else if (strcmp(type, "f") == 0){//float
                
            }
            else if (strcmp(type, "d") == 0){//double
                
            }
            else if (strcmp(type, "B") == 0){//C++ bool or a C99 _Bool
                
            }
            else if (strcmp(type, "v") == 0){//void
                
            }
            else if (strcmp(type, "*") == 0){//character string (char *)
                
            }
            else if (strcmp(type, "#") == 0){//Class
                
            }
            else if (strcmp(type, ":") == 0){//SEL
                
            }
            else if (strcmp(type, "*") == 0){//character string (char *)
                
            }
        }
        [invocation setSelector:selector];
        [invocation setTarget:self];
        [invocation retainArguments];
        [invocation invoke];
        if (signature.methodReturnLength > 0) {
            __autoreleasing id    returnValue = nil;
            [invocation getReturnValue:&returnValue];
            return returnValue;
        }
        return nil;
    }
    else{
        *error = [NSError errorWithDomain:NSStringFromSelector(selector) code:-1 userInfo:@{NSLocalizedFailureReasonErrorKey:@"Param count did not match"}];
        return nil;
    }
}
- (id)dt_performSelector:(SEL)selector withObjects:(NSArray *)objects error:(NSError **)error{
    NSMethodSignature * signature =[[self class] instanceMethodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    if (objects.count == signature.numberOfArguments-2) {
        
        for (int i = 2; i < signature.numberOfArguments; i++) {
            const char *type = [signature getArgumentTypeAtIndex:i];
            if (strcmp(type, "@") == 0) {
                id argument = objects[i-2];
                [invocation setArgument:&argument atIndex:i];
            }
            else if(strcmp(type, "@?") == 0){
                id blockargument = objects[i-2];
                Block_copy((__bridge void *)blockargument);
                
                [invocation setArgument:&blockargument atIndex:i];
            }
        }
        [invocation setSelector:selector];
        [invocation setTarget:self];
        [invocation retainArguments];
        [invocation invoke];
        if (signature.methodReturnLength > 0) {
            __autoreleasing id    returnValue = nil;
            [invocation getReturnValue:&returnValue];
            return returnValue;
        }
        return nil;
    }
    else{
        *error = [NSError errorWithDomain:NSStringFromSelector(selector) code:-1 userInfo:@{NSLocalizedFailureReasonErrorKey:@"Param count did not match"}];
        return nil;
    }
    
}
@end
