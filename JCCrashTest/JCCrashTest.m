//
//  JCCrashTest.m
//  JCCrashDemo
//
//  Created by 建承 马  on 2018/5/10.
//  Copyright © 2018年 建承 马 . All rights reserved.
//

#import "JCCrashTest.h"
#import "JCSignalHandler.h"
#import "JCUncaughtExceptionHandler.h"

@implementation JCCrashTest

+ (void)jcCrashTest{
    // 将下面C函数的函数地址当做参数
    InstallSignalHandler();
    InstallUncaughtExceptionHandler();
}
@end
