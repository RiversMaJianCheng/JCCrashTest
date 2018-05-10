//
//  AppDelegate.m
//  JCCrashDemo
//
//  Created by 建承 马  on 2018/5/2.
//  Copyright © 2018年 建承 马 . All rights reserved.
//

#import "AppDelegate.h"
#import "JCCrashTest.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //发送邮箱
    [self sendEmail];
    [JCCrashTest jcCrashTest];
    return YES;
}
- (void)sendEmail{
    
    //判断是否发送后台消息
    NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"JCOCCrash"];
    if (string) {
        //上传邮件或者服务器
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSString *urlStr = [NSString stringWithFormat:@"mailto://ma_jcheng@126.com?subject=OCCrash-bug报告&body=感谢您的配合!" "错误详情:%@",string];
            NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            [[UIApplication sharedApplication] openURL:url];
            //删除数据
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"JCOCCrash"];
        });
    }
    
    //判断是否发送后台消息
    NSString *stringSig = [[NSUserDefaults standardUserDefaults] objectForKey:@"JCSigCrashLog"];
    if (stringSig) {
        //上传邮件或者服务器
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSString *urlStr = [NSString stringWithFormat:@"mailto://ma_jcheng@126.com?subject=SigCrash-bug报告&body=感谢您的配合!" "错误详情:%@",stringSig];
            NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            [[UIApplication sharedApplication] openURL:url];
            
            //删除数据
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"JCSigCrashLog"];
        });
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
