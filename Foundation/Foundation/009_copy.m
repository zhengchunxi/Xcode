//
//  009_copy.m
//  Foundation
//
//  Created by 郑春喜 on 15/5/24.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "009_copy.h"

/**
 1、对象使用copy或者mutableCopy方法可以创建该对象的副本。
 2、copy : 需要先实现NSCopying协议,创建的副本是不可变的
 3、mutableCopy : 需要先实现NSMutableCopying协议，创建的副本是可变的对象
 4、深复制:内容拷贝，原对象和副本指向的是两个不同的对象。原对象的引用计数器不变，副本的计数器设为1
 5、浅复制：指针拷贝，原对象和副本指向同一个对象，对象的引用计数器+1，相当于做了一次retain操作
 6、只有不可变对象创建不可变副本副本(copy)才是浅复制，其他都是深复制.不可变对象进行copy，返回一个不可变对象，两个对象内容一样。为了性能，OC语言采用直接将两个对象指向相同指针
 */
@implementation BasicCopy


@end
