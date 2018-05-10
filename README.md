# JCCrashTest

JCCrashTest是一个简单的测试crash的小 demo。
## 安装
### CocoaPods
1. 在Podfile文件中添加 pod 'JCCrashTest' , '~> 0.0.2'
2. 命令行执行 pod install 或 pod update
3. 导入 #import <JCCrashTest.h>
### 手动安装
1. 下载文件后找到JCCrashTest文件
2. 把JCCrashTest文件拖到你先有项目
3.  在AppDelegate.m 导入 #import "JCCrashTest.h"

## 相关代码如下
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    //发送邮箱
    [self sendEmail];
    [JCCrashTest jcCrashTest];
    return YES;
}
```
```
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
```
## 许可证
JCDrawSpiderChart 使用MIT许可证，详情见LICENSE文件
