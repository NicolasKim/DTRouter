//
//  DTViewController.h
//  DTRouter
//
//  Created by jinqiucheng1006@live.cn on 02/21/2017.
//  Copyright (c) 2017 jinqiucheng1006@live.cn. All rights reserved.
//

#import <DTRouter/DTRouter.h>


@import UIKit;

@interface DTViewController : UIViewController<DTRouterObjectProtocol>
-(void)hahah:(NSString *)str haha:(NSString *)str1;
+(NSDictionary *)test:(NSString *)str1 andTest:(NSString *)str2;
@end
