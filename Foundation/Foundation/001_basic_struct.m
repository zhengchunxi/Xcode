//
//  001_basic_struct.m
//  Foundation
//
//  Created by 郑春喜 on 15/5/2.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "001_basic_struct.h"

@implementation BasicStruct

@synthesize r,s,p,t;

#pragma mark -
#pragma mark NSRange 结构体用来表示事物的一个范围，比如字符串中的字符范围会这集合中元素的范围
-(void) range{
    NSRange range;
    range.location = 5 ;
    range.length = 3 ;
    //NSRange range = {.location = 5, .length = 4};
    
    NSRange crange = {3, 2};    // 利用C语言聚合结构复制。
    range = NSMakeRange(4,2);  // 利用Foundation框架提供的函数
    
    NSLog(@"NSRange : %@" , NSStringFromRange(range));
    NSLog(@"NSRange : %@" , NSStringFromRange(crange));
}

#pragma mark  NSPoint 结构体用来表示一个点的坐标
-(void) point{
    NSPoint point;
    point.x = 2;
    point.y = 3;
    
    NSPoint cpoint = {8, 6};       // 利用C语言聚合结构复制。
    point = NSMakePoint(10,8);      // 利用Foundation框架提供的函数
    point = CGPointMake(40, 30);    // 利用CoreFoundation框架提供的函数
    
    NSLog(@"NSPoint : %@" , NSStringFromPoint(point));
    NSLog(@"NSPoint : %@" , NSStringFromPoint(cpoint));
}

#pragma mark NSSize 结构体用来表示一个图标的长宽
-(void) size{
    NSSize size;
    size.width = 100;
    size.height = 80 ;
    
    NSSize csize = {120, 90};        // 利用C语言聚合结构复制。
    size = NSMakeSize(160,120);       // 利用Foundation框架提供的函数
    size = CGSizeMake(200, 150);      // 利用CoreFoundation框架提供的函数
    
    NSLog(@"NSSize : %@" , NSStringFromSize(size));
    NSLog(@"NSSize : %@" , NSStringFromSize(csize));
}

#pragma mark -
#pragma mark NSRect 结构体用来表示一个图标的坐标和长宽
-(void) rect{
    NSRect rect;
    rect.origin.x = 100;
    rect.origin.y = 80;
    rect.size.width = 120;
    rect.size.height = 100;
    
    NSRect crect = {40,30,120,80};         // 利用C语言聚合结构复制。
    rect = NSMakeRect(60, 45, 100, 80);     // 利用Foundation框架提供的函数
    rect = CGRectMake(80, 75, 160, 120);    // 利用CoreFoundation框架提供的函数
    
    NSLog(@"NSRect : %@" , NSStringFromRect(rect));
    NSLog(@"NSRect : %@" , NSStringFromRect(crect));
}


@end
