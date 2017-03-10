//
//  DTTabberViewController.m
//  DTRouter
//
//  Created by 金秋成 on 2017/3/8.
//  Copyright © 2017年 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTTabberViewController.h"
#import <DTRouter/DTRouter.h>
#import <DTRouter/UITabBarController+DTRouter.h>
@interface DTTabberViewController ()

@end

@implementation DTTabberViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSData *plainData = [@"example://firstviewcontroller?title=hahahah" dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String = [plainData base64EncodedStringWithOptions:0];
    NSString * URLString = [NSString stringWithFormat:@"example://firstnavigationviewcontroller?initviewcontroller=%@",base64String];


    NSData *plainData1 = [@"example://secondviewcontroller?title=hahahah" dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String1 = [plainData1 base64EncodedStringWithOptions:0];
    NSString * URLString1 = [NSString stringWithFormat:@"example://secondnavigationviewcontroller?initviewcontroller=%@",base64String1];

    [self dt_setViewControllersWithURLStrings:@[URLString,URLString1]];
    
    
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
