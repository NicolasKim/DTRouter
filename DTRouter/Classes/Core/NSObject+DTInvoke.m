//
//  NSObject+DTInvoke.m
//  Pods
//
//  Created by 金秋成 on 2017/2/22.
//
//

#import "NSObject+DTInvoke.h"
//#import "DTURLAnalizer.h"
//#import "DTRouterCenter.h"
@implementation NSObject (DTInvoke)
+ (id)dt_performSelector:(SEL)selector withObjects:(NSArray *)objects error:(NSError **)error{
    NSMethodSignature * signature =[self methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    if (objects.count == signature.numberOfArguments-2) {
        for (int i = 2; i < signature.numberOfArguments; i++) {
            const char *type = [signature getArgumentTypeAtIndex:i];
            id argument = objects[i-2];
            [self convertArgument:argument argumentIndex:i type:type invoke:invocation];
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
            id argument = objects[i-2];
            [[self class] convertArgument:argument argumentIndex:i type:type invoke:invocation];
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

+ (id)dt_performSelector:(SEL)selector
           withArguments:(NSDictionary<NSString *,id> *)arguments
       andArgumentMapper:(NSDictionary<NSString *,NSNumber *> *)argumentMapper
                   error:(NSError **)error{
    NSMethodSignature * signature =[[self class] methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    if (arguments.count == signature.numberOfArguments-2) {
        
        
        [argumentMapper enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSNumber * _Nonnull obj, BOOL * _Nonnull stop) {
            
            const char *type = [signature getArgumentTypeAtIndex:[obj integerValue]-1];
            
            [self  convertArgument:arguments[key] argumentIndex:[obj integerValue]-1 type:type invoke:invocation];
            
        }];
        
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



- (id)dt_performSelector:(SEL)selector
           withArguments:(NSDictionary<NSString *,id> *)arguments
       andArgumentMapper:(NSDictionary<NSString *,NSNumber *> *)argumentMapper
                   error:(NSError **)error{

    NSMethodSignature * signature =[[self class] instanceMethodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    if (arguments.count == signature.numberOfArguments-2) {
        
        
        [argumentMapper enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSNumber * _Nonnull obj, BOOL * _Nonnull stop) {
           
            const char *type = [signature getArgumentTypeAtIndex:[obj integerValue]-1];
            
            [[self class] convertArgument:arguments[key] argumentIndex:[obj integerValue]-1 type:type invoke:invocation];
            
        }];

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






+(void)convertArgument:(id)argument argumentIndex:(NSInteger)i type:(char *)type invoke:(NSInvocation *)invocation{
    if (strcmp(type, "@") == 0) {
        [invocation setArgument:&argument atIndex:i];
    }
    else if(strcmp(type, "@?") == 0 ||
            strcmp(type, "?") == 0){
        Block_copy((__bridge void *)argument);
        [invocation setArgument:&argument atIndex:i];
    }
    else if (strcmp(type, "c") == 0){//char
        if ([argument isKindOfClass:[NSNumber class]]) {
            char c = [argument charValue];
            [invocation setArgument:&c atIndex:i];
        }
    }
    else if (strcmp(type, "i") == 0){//int
        int c = [argument intValue];
        [invocation setArgument:&c atIndex:i];
    }
    else if (strcmp(type, "s") == 0){//short
        short c = [argument shortValue];
        [invocation setArgument:&c atIndex:i];
    }
    else if (strcmp(type, "q") == 0){//long long
        long long l = [argument longLongValue];
        [invocation setArgument:&l atIndex:i];
    }
    else if (strcmp(type, "C") == 0){//unsigned char
        unsigned char c = [argument unsignedCharValue];
        [invocation setArgument:&c atIndex:i];
    }
    else if (strcmp(type, "I") == 0){//unsigned int
        unsigned int c = [argument unsignedIntValue];
        [invocation setArgument:&c atIndex:i];
    }
    else if (strcmp(type, "S") == 0){//unsigned short
        unsigned short c = [argument unsignedShortValue];
        [invocation setArgument:&c atIndex:i];
    }
    else if (strcmp(type, "L") == 0){//unsigned long
        unsigned long l = [argument unsignedLongValue];
        [invocation setArgument:&l atIndex:i];
    }
    else if (strcmp(type, "Q") == 0){//unsigned long long
        unsigned long long l = [argument unsignedLongLongValue];
        [invocation setArgument:&l atIndex:i];
    }
    else if (strcmp(type, "f") == 0){//float
        float f = [argument floatValue];
        [invocation setArgument:&f atIndex:i];
    }
    else if (strcmp(type, "d") == 0){//double
        double f = [argument doubleValue];
        [invocation setArgument:&f atIndex:i];
    }
    else if (strcmp(type, "B") == 0){//C++ bool or a C99 _Bool
        BOOL b = [argument boolValue];
        [invocation setArgument:&b atIndex:i];
    }
    else if (strcmp(type, "v") == 0){//void
        NSLog(@"Does not support 'void' parameter types");
    }
    else if (strcmp(type, "*") == 0){//character string (char *)
        if ([argument isKindOfClass:[NSString class]]) {
            char * string = [(NSString *)argument cStringUsingEncoding:NSUTF8StringEncoding];
            [invocation setArgument:&string atIndex:i];
        }
    }
    else if (strcmp(type, "#") == 0){//Class
        Class c = argument;
        if ([argument isKindOfClass:[NSString class]]) {
            c = NSClassFromString(argument);
        }
        [invocation setArgument:&c atIndex:i];
    }
    else if (strcmp(type, ":") == 0){//SEL
        if ([argument isKindOfClass:[NSString class]]) {
            SEL s = NSSelectorFromString(argument);
            [invocation setArgument:&s atIndex:i];
        }
    }
}








@end
