//
//  JCSignalHandler.m
//  JCCrashDemo
//
//  Created by 建承 马  on 2018/5/10.
//  Copyright © 2018年 建承 马 . All rights reserved.
//

#import "JCSignalHandler.h"
#include <execinfo.h>
#import "JCCrashFile.h"
#import "AppDelegate.h"

@implementation JCSignalHandler
+(void)saveCreash:(NSString *)exceptionInfo
{

    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[dat timeIntervalSince1970];
    NSString *timeString = [NSString stringWithFormat:@"%f", a];
    NSString * savePath = [NSString stringWithFormat:@"JCSigCrash%@.log",timeString];
    
    //写日志保存本地log
    BOOL sucess = [JCCrashFile writeObjectDataToPlist:exceptionInfo name:savePath];
    //保存日志需要上传邮件或者服务器
    [[NSUserDefaults standardUserDefaults] setObject:exceptionInfo forKey:@"JCSigCrashLog"];
    NSLog(@"YES sucess:%d",sucess);
}
@end
void SignalExceptionHandler(int signal)
{
    NSMutableString *mstr = [[NSMutableString alloc] init];
    [mstr appendString:@"Stack:\n"];
    void* callstack[128];
    int i, frames = backtrace(callstack, 128);
    char** strs = backtrace_symbols(callstack, frames);
    for (i = 0; i <frames; ++i) {
        [mstr appendFormat:@"%s\n", strs[i]];
    }
    [JCSignalHandler saveCreash:mstr];
}


void InstallSignalHandler(void)
{
    
    //判断是否发送后台消息
  NSString *string = [[NSUserDefaults standardUserDefaults] objectForKey:@"JCSigCrashLog"];
    if (string) {
        //上传邮件或者服务器
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSString *urlStr = [NSString stringWithFormat:@"mailto://ma_jcheng@126.com?subject=SigCrash-bug报告&body=感谢您的配合!" "错误详情:%@",string];
            NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
            [[UIApplication sharedApplication] openURL:url];
            
            //删除数据
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"JCSigCrashLog"];
        });
        }
    signal(SIGHUP, SignalExceptionHandler);
    signal(SIGINT, SignalExceptionHandler);
    signal(SIGQUIT, SignalExceptionHandler);
    
    signal(SIGABRT, SignalExceptionHandler);
    signal(SIGILL, SignalExceptionHandler);
    signal(SIGSEGV, SignalExceptionHandler);
    signal(SIGFPE, SignalExceptionHandler);
    signal(SIGBUS, SignalExceptionHandler);
    signal(SIGPIPE, SignalExceptionHandler);
}


