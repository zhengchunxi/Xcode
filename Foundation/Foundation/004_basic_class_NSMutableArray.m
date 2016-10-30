//
//  004_basic_class_MSMutableArray.m
//  Foundation
//
//  Created by 郑春喜 on 15/5/9.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "004_basic_class_NSMutableArray.h"
#import "Model.h"

@implementation MutableArray

-(void) arrayCRUD{
    NSMutableArray *arr = [NSMutableArray arrayWithObjects:@"zheng",@"chun",@"xi",@"a", nil];
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
    [array addObject:@"x"];                  // 添加一个元素
    [array addObjectsFromArray:arr];           // 追加一个数组
    
    [array removeObject:@"x"];             // 删除指定元素
    [array removeLastObject];             // 删除最后一个元素
    [array removeObjectAtIndex:4];          // 根据下标删除指定元素
    [array replaceObjectAtIndex:1 withObject:@"replaceObjectAtIndex"];
    NSLog(@"%@",array);
    [array removeObject:@"3" inRange:NSMakeRange(3, 1)];   //在指定范围内查找元素并删除
    NSLog(@"%@",array);
    [array removeAllObjects];               //删除所有元素
}

-(void) arrayMemory{
    Model *sex = [[ Model alloc ] init];
    sex.modelName = @"sex";
    Model *age = [[ Model alloc ] init];
    age.modelName = @"age";
    NSLog(@"初始化时 : sex = %zi , age = %zi",[sex retainCount],[age retainCount]);
    
    NSMutableArray *array = [[ NSMutableArray alloc] init ];
    [array addObject:sex];
    [array addObject:age];
    NSLog(@"将对象添加到数组，数组会自动给对象发送一条alloc消息，使对象的计数器 +1 : sex = %zi , age = %zi",[sex retainCount],[age retainCount]);
    
    [array removeObject:sex];
    NSLog(@"从数组中移除对象sex，数组会自动给对象发送一条alloc消息，使对象的计数器 +1 : sex = %zi , age = %zi",[sex retainCount],[age retainCount]);
    
    //[sex release];
    [age release];
    NSLog(@"release Molde 后 : sex = %zi , age = %zi",[sex retainCount],[age retainCount]);
    
    [array release];
    NSLog(@"release数组后，数组会自动对其内所有对象做一次release : sex = %zi , age = %zi",[sex retainCount],[age retainCount]);
}

-(void) dealloc{
    NSLog(@"dealloc array");
    [super dealloc];
}

@end
