//
//  DTSecondNavigationController.m
//  DTRouter
//
//  Created by 金秋成 on 2017/3/9.
//  Copyright © 2017年 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTSecondNavigationController.h"
#import <DTRouter/DTRouter-umbrella.h>
@interface DTSecondNavigationController ()

@end

@implementation DTSecondNavigationController

+(void)load{
    [[DTRouterService sharedInstance]addRouter:@"example://secondnavigationviewcontroller" handler:^id(NSDictionary *paths, NSDictionary *arguments) {
        NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:[arguments objectForKey:@"initviewcontroller"] options:0];
        NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];
        DTRouterRequest * req = [[DTRouterRequest alloc]initRequestWithURLString:decodedString error:nil];
        DTRouterResponse * resp = [[DTRouterService sharedInstance]request:req];
        DTSecondNavigationController * viewcontroller = [[DTSecondNavigationController alloc]initWithRootViewController:resp.resultValue];
        viewcontroller.title = @"second";
        return viewcontroller;
    }];

}


- (void)viewDidLoad {
    [super viewDidLoad];
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
