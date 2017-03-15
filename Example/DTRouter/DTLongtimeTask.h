//
//  DTLongtimeTask.h
//  DTRouter
//
//  Created by 金秋成 on 2017/3/15.
//  Copyright © 2017年 jinqiucheng1006@live.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^handler)(long long currentNum);

@interface DTLongtimeTask : NSObject
-(void)addNumto:(long long)num handler:(handler)handler;
@end
