//
//  JCCrashFile.m
//  JCCrashDemo
//
//  Created by 建承 马  on 2018/5/10.
//  Copyright © 2018年 建承 马 . All rights reserved.
//

#import "JCCrashFile.h"

@implementation JCCrashFile
/**
 *  定义一个能够向plist 文件中写入数据
 */
+ (BOOL)writeObjectDataToPlist:(id)objectData name: (NSString *)myName{
    
    //根据传入的名称创建文件路径
    NSString *stringNamePath = [self pathForName:myName];
    //写入文件
    return [objectData writeToFile: stringNamePath atomically:YES];
}

/**
 *  定义一个能够根据名字读取字典数据
 */
+ (id)readObjectFromePlist: (NSString *)myName{
    //根据传入的名称获取文件路径
    NSString *stringNamePath = [self pathForName:myName];
    //从文件读取字典数据
    NSString *string = [NSString stringWithContentsOfFile:stringNamePath encoding:NSUTF8StringEncoding error:nil];
    return string;
}

/**
 *  定义一个能够根据名字删除数据
 */
+ (BOOL)removeObjectDataFromePlist: (NSString *)myName{
    
    //根据传入的名称获取文件路径
    NSString *stringNamePath = [self pathForName:myName];
    
    //定义文件管理者
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //删除文件
    return  [fileManager removeItemAtPath:stringNamePath error:nil];
}


//文件路径
+ (NSString *)pathForName:(NSString *)name{
    
    //创建文件路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,  NSUserDomainMask, YES) lastObject];
    
    //根据传入的名称拼接路径
    NSString *savePath = [documentPath stringByAppendingPathComponent:name];
    
    return savePath;
}
@end
