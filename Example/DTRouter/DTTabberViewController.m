//
//  DTTabberViewController.m
//  DTRouter
//
//  Created by 金秋成 on 2017/3/8.
//  Copyright © 2017年 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTTabberViewController.h"
#import <DTRouter/DTRouter.h>
@interface DTTabberViewController ()

@end

@implementation DTTabberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    DTRouterRequest * req = [[DTRouterRequest alloc]initRequestWithURLString:@"example://firstviewcontroller?title=hahaha" error:nil];
    DTRouterResponse * resp = [[DTRouterService sharedInstance]request:req];
    [self setViewControllers:@[resp.resultValue]];

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
