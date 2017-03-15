//
//  DTLongtimeTask.m
//  DTRouter
//
//  Created by 金秋成 on 2017/3/15.
//  Copyright © 2017年 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTLongtimeTask.h"
#import <DTRouter/DTRouter.h>



@implementation DTLongtimeTask
{
    long long _num;
    long long _currentNum;
    handler  _handler;
}

+(void)load{
    
    [[DTRouterService sharedInstance]addRouter:@"addnumber/:num" handler:^id(NSDictionary *paths, NSDictionary *arguments) {
        DTLongtimeTask * task = [[DTLongtimeTask alloc]init];
        [task addNumto:[paths[@"num"] longLongValue] handler:^(long long currentNum) {
            handler a = arguments[@"taskkey"];
            a(currentNum);
        }];
        return nil;
    }];

}



-(void)addNumto:(long long)num handler:(handler)handler{
    _currentNum = 0;
    _num        = num;
    _handler    = [handler copy];

    while (_currentNum < num) {
        _currentNum++;
        _handler(_currentNum);
        [NSThread sleepForTimeInterval:0.03];
    }
}
-(void)dealloc{
    NSLog(@"任务被释放");
}
@end
