//
//  002_Teacher.h
//  ObjectC
//
//  Created by 郑春喜 on 15/4/11.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject{
    int _age;
}
@property int tid;  // 编译器遇到@property，会自动转成声明了tid的get和set方法
@property (atomic,retain) NSString *name;
@property int age;

// 读写属性：readonly(只会生成get方法)，readwrite(会生成get和set方法)，默认是readwrite
// set处理：加上retain ，代表会自动管理内存。它会自动在set方法时先release，再retain。不加默认是assign(set方法直接复制，不进行retain)，还有copy
/**
    原子属性：默认是atomic，加上后set和get是一个原子操作，多线程安全，相当于函数头部和尾部加锁。
            多线程时，不会出现一个线程在执行完set方法之前，另一个线程也执行set方法。保证在完成写入完成时，另一个线程读取。
        nonatomic表示禁止多线程变量保护，会提高性能
 */
@property (atomic, retain) NSString *Tname;
@property (nonatomic, retain) NSString *title;

// 指定get/set方法名
@property (getter=isGood,setter=isGood:) BOOL good;

@end
