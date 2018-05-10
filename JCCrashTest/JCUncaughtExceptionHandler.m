//
//  JCUncaughtExceptionHandler.m
//  JCCrashDemo
//
//  Created by 建承 马  on 2018/5/10.
//  Copyright © 2018年 建承 马 . All rights reserved.
//

#import "JCUncaughtExceptionHandler.h"
#import "JCCrashFile.h"
#import "AppDelegate.h"

@implementation JCUncaughtExceptionHandler

+(void)saveCreash:(NSString *)exceptionInfo
{
    
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    NSString * savePath = [NSString stringWithFormat:@"JCOCCrash%@.log",timeString];
    
    //写日志保存本地log
    BOOL sucess = [JCCrashFile writeObjectDataToPlist:exceptionInfo name:savePath];
    //保存日志需要上传邮件或者服务器
    [[NSUserDefaults standardUserDefaults] setObject:exceptionInfo forKey:@"JCOCCrash"];
    NSLog(@"YES sucess:%d",sucess);
}
@end


void HandleException(NSException *exception)
{
    // 异常的堆栈信息
    NSArray *stackArray = [exception callStackSymbols];
    
    // 出现异常的原因
    NSString *reason = [exception reason];
    
    // 异常名称
    NSString *name = [exception name];
    
    NSString *exceptionInfo = [NSString stringWithFormat:@"Exception reason：%@\nException name：%@\nException stack：%@",name, reason, stackArray];
    
    NSLog(@"%@", exceptionInfo);
    
    [JCUncaughtExceptionHandler saveCreash:exceptionInfo];
}

void InstallUncaughtExceptionHandler(void)
{
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
    NSSetUncaughtExceptionHandler(&HandleException);
}

