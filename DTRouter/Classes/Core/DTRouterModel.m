//
//  DTRouterModel.m
//  Pods
//
//  Created by 金秋成 on 2017/2/21.
//
//

#import "DTRouterModel.h"

@implementation DTRouterModel

-(instancetype)initCreateModelWithURL:(NSString *)URLStr withClass:(Class)aClass method:(SEL)method{
    self = [super init];
    if (self) {
        _purpose = DTRouterPurposeCreate;
        _URLString = URLStr;
        _className = aClass;
        _selector = method;
    }
    return self;
}

-(instancetype)initInvokeModelWithURL:(NSString *)URLStr withClass:(Class)aClass method:(SEL)method{
    self = [super init];
    if (self) {
        _purpose = DTRouterPurposeInvokeClassMethod;
        _URLString = URLStr;
        _className = aClass;
        _selector = method;
    }
    return self;
}

-(instancetype)initInvokeModelWithURL:(NSString *)URLStr withObject:(id)anObject method:(SEL)method{
    self = [super init];
    if (self) {
        _purpose = DTRouterPurposeInvokeObjectMethod;
        _URLString = URLStr;
        _object = anObject;
        _selector = method;
    }
    return self;
}






-(BOOL)isEqual:(DTRouterModel *)object{
    if (self == object) {
        return YES;
    }
    
    if ([self.URLString isEqualToString:object.URLString]) {
        return YES;
    }
}

@end
