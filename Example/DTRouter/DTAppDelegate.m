//
//  DTAppDelegate.m
//  DTRouter
//
//  Created by jinqiucheng1006@live.cn on 02/21/2017.
//  Copyright (c) 2017 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTAppDelegate.h"
#import <DTRouter/DTRouter.h>
#import "DTViewController.h"

typedef void(^DTViewControllerTestBlock)();

@implementation DTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

//    DTRouterRequest * request = [[DTRouterRequest alloc]init];
//    request.routerType = DTRoterRequestType_GET;
//    request.URLString = @"dtrouter://invokeclassmethod?aa=haha&bb=heihei";
//    DTRouterResponse * resp = [[DTRouter sharedInstance]syncRequest:request];
//    NSLog(@"%@",resp.resultValue);
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        DTViewControllerTestBlock block = ^(){
//            
//            NSLog(@"52sdlkjfklajsdlkfjkasjdfkljlk");
//        };
//        
//        
//        DTRouterRequest * request1 = [[DTRouterRequest alloc]init];
//        request1.routerType = DTRoterRequestType_POST;
//        request1.URLString = @"dtrouter://invokeinstancemethod";
//        request1.params    = @[@{@"key1":@"value1",@"key2":@"value2"},[block copy]];
//        DTRouterResponse * resp1 = [[DTRouter sharedInstance]syncRequest:request1];
//        NSLog(@"%@----error:%@",resp1.resultValue,resp1.error);
//    });
    
    
    
//    DTRouterRequest * request1 = [[DTRouterRequest alloc]init];
//    request1.routerType = DTRoterRequestType_POST;
//    request1.URLString = @"dtrouter://initViewController";
//    request1.params    = @[@{@"key1":@"value1",@"key2":@"value2"}];
//    DTRouterResponse * resp1 = [[DTRouter sharedInstance]syncRequest:request1];
//    NSLog(@"%@----error:%@",resp1.resultValue,resp1.error);
    
    
 
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
