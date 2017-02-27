//
//  DTTestModule.m
//  DTRouter
//
//  Created by 金秋成 on 2017/2/27.
//  Copyright © 2017年 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTTestModule.h"

@implementation DTTestModule
DT_EXPORT_MODULE()
-(void)moduleSetUp{
    NSLog(@"%@ setup",NSStringFromClass([self class]));
}
@end
