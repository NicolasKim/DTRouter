//
//  DTPresentTestViewController.m
//  DTRouter
//
//  Created by 金秋成 on 2017/2/24.
//  Copyright © 2017年 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTPresentTestViewController.h"
#import <DTRouter/DTRouter.h>

typedef void(^block)();

@interface DTPresentTestViewController ()

@end

@implementation DTPresentTestViewController

+(void)load{
    NSError * error = nil;
    DTRouterModel * initModel = [[DTRouterModel alloc]initCreateModelWithURL:@"dtrouter://initTestViewController" withClass:self method:@selector(initWithInteger:selector:string:block:class:)];
    [[DTRouter sharedInstance]registModel:initModel error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
}



- (instancetype)initWithInteger:(NSInteger)i
                       selector:(SEL)selector
                         string:(NSString *)str
                          block:(block)b
                          class:(Class)c
{
    self = [super init];
    if (self) {
        
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton * closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame = CGRectMake(20, 20, 100, 100);
    [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    
    
}

-(void)close{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
