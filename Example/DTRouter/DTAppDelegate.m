//
//  DTAppDelegate.m
//  DTRouter
//
//  Created by jinqiucheng1006@live.cn on 02/21/2017.
//  Copyright (c) 2017 jinqiucheng1006@live.cn. All rights reserved.
//

#import "DTAppDelegate.h"
#import <DTRouter/DTRouter-umbrella.h>

#import "DTViewController.h"


typedef void(^DTViewControllerTestBlock)();

@implementation DTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    DTURLPattern * p = [[DTURLPattern alloc]initWithURLPattern:@"ahhh://:host/:path1/:path2"];
//    
//    
//    BOOL result = [p isMatchWithURL:[NSURL URLWithString:@"ahhh://skjdfkajs/sdfj/asdf"]];
//    
//    if (result) {
//        NSLog(@"match !!!");
//    }
//    else{
//        NSLog(@"did not match !!!");
//    }
//    DTRouterRequest * req = [[DTRouterRequest alloc]initRegistWithURLPattern:@"ahhh://:host/:path1/:path2" handler:^NSDictionary *(NSDictionary * paths , NSDictionary * arguments) {
//        
//        NSLog(@"req callback");
//        return nil;
//    } error:nil];
//        
//    DTRouterResponse * resp = [[DTRouterService sharedInstance]request:req];
//    NSLog(@"%@",resp);
//    
//    
//    DTRouterRequest * req1 = [[DTRouterRequest alloc]initRegistWithURLPattern:@"ahhh://:host/:path1/:path2" handler:^NSDictionary *(NSDictionary * paths , NSDictionary * arguments) {
//        
//        NSLog(@"req1 callback %@   arguments : %@",paths,arguments);
//        return @{@"key1":@"value1",@"key2":@"value2"};
//    } error:nil];
//    
//    DTRouterResponse * resp1 = [[DTRouterService sharedInstance]request:req1];
//    NSLog(@"%@",resp1);
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        DTRouterRequest * route = [[DTRouterRequest alloc]initRequestWithURLString:@"ahhh://hostValue/path1value/path2value" error:nil];
//        
//        DTRouterResponse * resp = [[DTRouterService sharedInstance]request:route];
//        
//        NSLog(@"%@",resp.resultValue);
//    });
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        DTRouterRequest * route = [[DTRouterRequest alloc]
//                                   initRequestWithURLString:@"ahhh://hostValue/path1value/path2value?argument=argumentvalue&aaa=" withArguments:@{@"haha":@"hahavalue"} error:nil];
//        
//        DTRouterResponse * resp = [[DTRouterService sharedInstance]request:route];
//        NSLog(@"%@",resp.resultValue);
//    });
    
        DTRouterRequest * route = [[DTRouterRequest alloc]
                                   initRequestWithURLString:@"sdfasdfsdf?argument=argumentvalue&aaa=" withArguments:@{@"haha":@"hahavalue"} error:nil];

        DTRouterResponse * resp = [[DTRouterService sharedInstance]request:route];
        NSLog(@"%@",resp.resultValue);
    
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
-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [[DTRouterService sharedInstance]handleURL:url];
}




@end
