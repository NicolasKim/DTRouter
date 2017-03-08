//
//  DTViewController.m
//  DTRouter
//
//  Created by jinqiucheng1006@live.cn on 02/21/2017.
//  Copyright (c) 2017 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTViewController.h"
#import <DTRouter/DTRouter.h>


typedef void(^DTViewControllerTestBlock)();


@interface DTViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray * _dictArr;
}
@end

@implementation DTViewController

+(void)load{
    DTRouterRequest * req = [[DTRouterRequest alloc] initRegistWithURLPattern:@"example://firstviewcontroller" handler:^id(NSDictionary *paths, NSDictionary *arguments) {
        DTViewController * viewcontroller = [[DTViewController alloc]init];
        viewcontroller.viewTitle = arguments[@"title"];
        return viewcontroller;
    } error:nil];

    [[DTRouterService sharedInstance]request:req];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _dictArr = @[@"present",@"push"];
//    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//    self.tableview.delegate = self;
//    self.tableview.dataSource = self;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _dictArr[indexPath.row];
    
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dictArr.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            
        }
            break;
        case 1:
        {
            
        }
            break;
        default:
            break;
    }
}

+(void)printHahaha{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
