//
//  DTViewController.m
//  DTRouter
//
//  Created by jinqiucheng1006@live.cn on 02/21/2017.
//  Copyright (c) 2017 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTViewController.h"

typedef void(^DTViewControllerTestBlock)();


@interface DTViewController ()
@property (nonatomic,strong)NSDictionary * dict;
@end

@implementation DTViewController

+(void)load{
//    DTRouterModel * model = [[DTRouterModel alloc]initInvokeModelWithURL:@"dtrouter://invokeclassmethod" withClass:[DTViewController class] method:@selector(test:andTest:)];
//    [[DTRouter sharedInstance]registModule:model error:nil];
    
    DTRouterModel * model = [[DTRouterModel alloc]initCreateModelWithURL:@"dtrouter://initViewController" withClass:[DTViewController class] method:@selector(initWithDict:)];
    [[DTRouter sharedInstance]registModule:model error:nil];

}



- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.dict = dict;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
//    DTRouterModel * model1 = [[DTRouterModel alloc]initInvokeModelWithURL:@"dtrouter://invokeinstancemethod" withObject:self method:@selector(dt_setupData:)];
//    [[DTRouter sharedInstance]registModule:model1 error:nil];
    
    
    
    
    DTRouterModel * model2 = [[DTRouterModel alloc]initInvokeModelWithURL:@"dtrouter://invokeinstancemethod" withObject:self method:@selector(dt_setupData:block:)];
    [[DTRouter sharedInstance]registModule:model2 error:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


+(NSDictionary *)test:(NSString *)str1 andTest:(NSString *)str2 {
    return @{@"key1":str1,@"key2":str2};
}

-(void)dt_setupData:(NSDictionary *)data{
    NSLog(@"%@",data);
}


-(void)dt_setupData:(NSDictionary *)data block:(DTViewControllerTestBlock)block{
    block();
    NSLog(@"%@",data);
}









-(void)hahah:(NSString *)str haha:(NSString *)str1{
    NSLog(@"%@  %@",str,str1 );
}


@end
