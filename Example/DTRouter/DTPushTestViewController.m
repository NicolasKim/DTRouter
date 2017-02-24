//
//  DTPushTestViewController.m
//  DTRouter
//
//  Created by 金秋成 on 2017/2/24.
//  Copyright © 2017年 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTPushTestViewController.h"
#import <DTRouter/DTRouter.h>
@interface DTPushTestViewController ()

@end

@implementation DTPushTestViewController
+(void)load{
    NSError * error = nil;
    DTRouterModel * initModel = [[DTRouterModel alloc]initCreateModelWithURL:@"dtrouter://initPushTestViewController" withClass:self method:@selector(init)];
    [[DTRouter sharedInstance]registModule:initModel error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
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
