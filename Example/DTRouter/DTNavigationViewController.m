//
//  DTNavigationViewController.m
//  DTRouter
//
//  Created by 金秋成 on 2017/3/9.
//  Copyright © 2017年 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTNavigationViewController.h"
#import <DTRouter/DTRouter-umbrella.h>
@interface DTNavigationViewController ()

@end

@implementation DTNavigationViewController
+(void)load{
    DTRouterRequest * req = [[DTRouterRequest alloc] initRegistWithURLPattern:@"example://firstnavigationviewcontroller" handler:^id(NSDictionary *paths, NSDictionary *arguments) {
        
        NSData *decodedData = [[NSData alloc] initWithBase64EncodedString:[arguments objectForKey:@"initviewcontroller"] options:0];
        
        NSString *decodedString = [[NSString alloc] initWithData:decodedData encoding:NSUTF8StringEncoding];

        DTRouterRequest * req = [[DTRouterRequest alloc]initRequestWithURLString:decodedString error:nil];
        DTRouterResponse * resp = [[DTRouterService sharedInstance]request:req];
        DTNavigationViewController * viewcontroller = [[DTNavigationViewController alloc]initWithRootViewController:resp.resultValue];
        viewcontroller.title = @"first";
        return viewcontroller;
    } error:nil];
    
    [[DTRouterService sharedInstance]request:req];
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
