//
//  JCCrashFile.h
//  JCCrashDemo
//
//  Created by 建承 马  on 2018/5/10.
//  Copyright © 2018年 建承 马 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JCCrashFile : NSObject
/**
 *  定义一个能够向plist 文件中写入数据
 */
+ (BOOL)writeObjectDataToPlist:(id)objectData name: (NSString *)myName;

/**
 *  定义一个能够根据名字读取字典数据
 */
+ (id)readObjectFromePlist: (NSString *)myName;

/**
 *  定义一个能够根据名字删除数据
 */
+ (BOOL)removeObjectDataFromePlist: (NSString *)myName;

@end
