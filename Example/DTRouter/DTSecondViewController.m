//
//  DTSecondViewController.m
//  DTRouter
//
//  Created by 金秋成 on 2017/3/9.
//  Copyright © 2017年 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTSecondViewController.h"
#import <DTRouter/DTRouter.h>
#import <DTRouter/UIApplication+DTRouter.h>

@interface DTSecondViewController ()

@end

@implementation DTSecondViewController

+(void)load{
    DTRouterRequest * req = [[DTRouterRequest alloc] initRegistWithURLPattern:@"example://secondviewcontroller" handler:^id(NSDictionary *paths, NSDictionary *arguments) {
        DTSecondViewController * viewcontroller = [[DTSecondViewController alloc]init];
        return viewcontroller;
    } error:nil];
    [[DTRouterService sharedInstance]request:req];

    
    DTRouterRequest * req1 = [[DTRouterRequest alloc] initRegistWithURLPattern:@"showsecondviewcontroller/:desc" handler:^id(NSDictionary *paths, NSDictionary *arguments) {
        DTSecondViewController * viewcontroller = [[DTSecondViewController alloc]init];
        viewcontroller.descStr = paths[@"desc"];
        UINavigationController * nav = [UIApplication dt_topNavigationController];
        [nav pushViewController:viewcontroller animated:YES];
        return nil;
    } error:nil];
    [[DTRouterService sharedInstance]request:req1];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor brownColor];

    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.width-64)];
    label.text = self.descStr;
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    
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
