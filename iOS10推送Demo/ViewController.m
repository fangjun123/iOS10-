//
//  ViewController.m
//  iOS10推送Demo
//
//  Created by bocai on 16/9/21.
//  Copyright © 2016年 bocai. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //iOS10之前
    /**
     1.注册通知权限
     2.创建本地通知
     3.设置本地通知属性
     4.调度本地通知
     */
    
    //1.注册通知权限
    //新的替代类，目前没有可用属性来设置，暂时用旧的类即可
//    UNNotificationSettings
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
}


- (IBAction)sendNotificationClick:(id)sender {
    
    //iOS10之前
    /*
    UILocalNotification *notification = [UILocalNotification new];
    
    
    //设置本地通知属性
    
    //调度本地通知
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
    */
    
    //用UNNotificationContent的子类来进行设定
    UNMutableNotificationContent *content = [UNMutableNotificationContent new];
    //设置应用程序的数字角标
    content.badge = @1;
    
    //设置声音
    content.sound = [UNNotificationSound defaultSound];
    
    //设置内容
    content.body = @"世事无常，精进不已";
    //设置标题和子标题
    content.title = @"英雄联盟";
    content.subtitle = @"亚索-来去如风";
    
    //设置触发时间以及重复，用UNNotificationTrigger的子类实现
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:3 repeats:NO];
    
    
    
    /**
             Identifier: 通知的标示符，用于区分不同的本地通知

      UNNotificationTrigger  设置触发时间以及重复的类

      content:  相当于以前的设置本地通知属性的步骤
     */
    UNNotificationRequest *requset = [UNNotificationRequest requestWithIdentifier:@"local" content:content trigger:trigger];
    
    //4.通过通知中心来添加一个本地通知的请求
    [[UNUserNotificationCenter currentNotificationCenter]addNotificationRequest:requset withCompletionHandler:^(NSError * _Nullable error) {
//        NSLog(@"我被点击了");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
