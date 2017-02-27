//
//  DTModularContext.m
//  Pods
//
//  Created by 金秋成 on 2017/2/27.
//
//

#import "DTModularContext.h"

@interface DTModularContext ()
@property (nonatomic,strong)NSMutableArray * modules;
@end

@implementation DTModularContext
static DTModularContext * _instance;
+(instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[DTModularContext alloc]init];
    });
    return _instance;
}

-(void)registModule:(Class)moduleClass{
    id<DTModularProtocol> moduleEntry = [moduleClass new];
    if ([moduleEntry conformsToProtocol:@protocol(DTModularProtocol)]) {
        if ([moduleEntry respondsToSelector:@selector(moduleSetUp)]) {
            [moduleEntry moduleSetUp];
        }
    }
    [self.modules addObject:moduleEntry];
}

-(NSMutableArray *)modules{
    if (!_modules) {
        _modules = [NSMutableArray new];
    }
    return _modules;
}
@end
