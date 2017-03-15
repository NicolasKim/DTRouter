//
//  DTViewController.m
//  DTRouter
//
//  Created by jinqiucheng1006@live.cn on 02/21/2017.
//  Copyright (c) 2017 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTViewController.h"
#import <DTRouter/DTRouter-umbrella.h>
#import "DTLongtimeTask.h"

typedef void(^handler)(long long currentNum);

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
    _dictArr = @[@"present",@"push",@"openurl",@"longtimetask"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
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
            [self dt_presentViewControllerURLString:@"example://firstviewcontroller" animated:YES completion:nil];
        }
            break;
        case 1:
        {
            [self.navigationController dt_pushViewControllerURLString:@"example://firstviewcontroller" animated:YES];
        }
            break;
        case 2:
        {
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"dtrouter://showsecondviewcontroller/openinapp"]];
        }
            break;
        case 3:
        {
            
            handler  h = ^(long long num){
                NSLog(@"current num : %lld",num);
            };
            [[DTRouterService sharedInstance]asyncRoute:@"addnumber/100" arguments:@{@"taskkey":h} handler:^(DTRouterResponse *response) {
                NSLog(@"result : %@",response.resultValue);
            }];
            
            
//            __autoreleasing DTLongtimeTask * task = [[DTLongtimeTask alloc]init];
//            
//            [task addNumto:1000000 handler:^(long long currentNum) {
//                NSLog(@"current num : %lld",currentNum);
//            }];
            
            
            
        }
            break;
        default:
            break;
    }
}



-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
