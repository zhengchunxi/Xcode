//
//  007_basic_class_NSDate.m
//  Foundation
//
//  Created by 郑春喜 on 15/5/24.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "007_basic_class_NSDate.h"

@implementation BasicNSDate

-(void)createDate{
    NSDate *date = [NSDate date];
    NSLog(@"当前时间 : %@",date);
    date = [NSDate dateWithTimeIntervalSinceNow:100];
    NSLog(@"当前时间的100s后 : %@ dateWithTimeIntervalSinceNow返回比当前时间快n秒的时间",date);
    date = [NSDate dateWithTimeIntervalSince1970:10000];
    NSLog(@"dateWithTimeIntervalSince1970从格林时间开始10000s后 : %@",date);
    date = [NSDate distantFuture];
    NSLog(@"distantFuture随即返回一个遥远的未来时间 : %@",date);
    date = [NSDate distantPast];
    NSLog(@"distantPast随即返回一个遥远的过去时间 : %@",date);
    
    date = [NSDate dateWithTimeInterval:10000 sinceDate:date];
    NSLog(@"返回指定时间1000s后的时间 : %@",date);
}

-(void) useDate{
    NSDate *date = [NSDate date];
    NSTimeInterval interval = [date timeIntervalSince1970];
    NSLog(@"返回时间戳：%zi",interval);

    NSDate *d = [NSDate date];
    NSLog(@"timeIntervalSinceDate过去了多少秒：%zi",[d timeIntervalSinceDate:date]);
    NSLog(@"earlierDate返回较早的时间：%@",[date earlierDate:d]);
    NSLog(@"laterDate返回较晚的时间：%@",[date laterDate:d]);
    NSLog(@"isEqualToDate比较两个时间是否相等:%zi",[date isEqualToDate:d]);
    NSLog(@"compare比较两个时间 : %zi",[date compare:d]);
}

-(void)dateFormat{
    NSDate *date = [NSDate date];
    NSDateFormatter *format = [[[NSDateFormatter alloc]init]autorelease];
    format.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    format.locale = [[[NSLocale alloc ] initWithLocaleIdentifier:@"zh_CN"]autorelease];   //设置时区
    
    NSString *timeZone = [[format timeZone]abbreviation];
    NSLog(@"当前的时区是 : %@", timeZone);
    NSString *string = [format stringFromDate:date];
    NSLog(@"格式化后的当前时间 : %@",string);
    
    NSLog(@"string格式化成时间 : %@",[format dateFromString:string]);
}

@end
