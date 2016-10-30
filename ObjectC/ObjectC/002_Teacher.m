//
//  002_Teacher.m
//  ObjectC
//
//  Created by 郑春喜 on 15/4/11.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "002_Teacher.h"

@implementation Teacher

//使用@synthesize，如果在.h 文件中找不到变量，会自动在.h文件中生成名称一样的私有成员变量，且自动实现了set和get方法
@synthesize tid, name,title;
@synthesize age=_age;  // 让age 指向 _age，不然会又生成一个变量age.

- (void) dealloc{
    NSLog(@"调用了Teacher对象的dealloc方法，%@对象被销毁",self);
    [super dealloc];
    //  最后调用父类的dealloc方法， 父类的dealloc会做一些回收操作。如果不先调用，会造成内存泄露
}

@end
