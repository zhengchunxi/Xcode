//
//  main.m
//  ObjectC
//
//  Created by 郑春喜 on 15/4/6.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "001_Student.h"
#import "002_Teacher.h"
#import "003_Memory.h"
#import "003_Memory+Category.h"
#import "004_Protocol_Button.h"
#import "004_Protocol_ButtonListener.h"
typedef int (^MyBlock) (int,int);
#import "005_Block_Button.h"

void testStudent();
void testMemory();
void testMemoryCatetory();
void testProtocol();
void testBlock();
void testBlockButton();
void testBlockPointMethod();

int main(int argc, const char * argv[]) {
    @autoreleasepool {       //  创建一个自动释放池,括号结束后才会释放资源池中的内容。
        testProtocol();
        testBlockButton();
        testBlockPointMethod();
    }
    return 0;
}

void testStudent(){
    /*
     Student *stu = [Student alloc] ;    // 调用对象的静态方法 alloc 分配内存空间
     stu = [stu init] ;                  // 调用 动态方法 init 初始化对象，这个时候对象stu才创建
     
     也可以写成Stuednt *stu = [Student new ] ，但是使用new 不能调用自已写的构造方法。new 关键字的作用是分配内存并返回一个已经初始化的对象
     */
    Student *stu = [[Student alloc] initStudent:7 :@"郑春喜" :@"男" :26 :168.0 :67.5]; // 调用重写的initinitStudent方法
    // 访问@public公有属性
    (*stu)._Sno = 10 ;
    int Sno = (*stu)._Sno;
    //stu->_Sname = @"郑春喜";
    stu.age = 27;
    Sno = stu->_Sno;
    
    NSLog(@"%@",stu);           // 打印这个对象，会调用对象的 description方法.相当于Java中的toString()方法
    NSLog(@"Sno = %i \t age = %i",Sno,stu.age);
    
    [stu release];
}

void testMemory(){
    Memory *memory = [[Memory alloc] init];
    [memory retain];
    NSLog(@"Memory对象的引用计数器个数 = %zi",[memory retainCount]);
    [memory release];
    NSLog(@"Memory对象的引用计数器个数 = %zi",[memory retainCount]);
    
    Teacher *teacher = [[Teacher alloc] init];
    memory.teacher = teacher;
    Teacher *t2 = [[Teacher alloc] init];
    memory.teacher = t2;
    [memory remenberTeacher:memory.teacher];
    
    [t2 release];
    [memory release];
}

void testMemoryCatetory(){
    Memory *memory = [[[Memory alloc] init]autorelease];
    
    Teacher *teacher = [[[Teacher alloc] init ] autorelease];
    teacher.name = @"吴国民";
    teacher.age = 35;
    teacher.title = @"高级教师";
    [ memory setTeacher:teacher];
    
    [ memory expand01 ];
    NSLog(@"%@",[ memory json]);
}

void testProtocol(){
    Button *button = [[[ Button alloc ] init] autorelease];
    ButtonListener *listener = [[[ ButtonListener alloc ] init] autorelease];
    button.listener = listener;  // 给按钮添加监听器
    
    if( [listener conformsToProtocol:@protocol(Listener)]){
        NSLog(@"ButtonListener %@ 遵守 Listener 协议",listener);
    }
    if([button respondsToSelector:@selector(click)]){
        NSLog(@"Button %@实现了 click 方法",button);
        [ button click ];
    }
}

void testBlock(){
    int a=5,b=6,c=15;
    __block int d = 20;
    // 定义一个block
    int (^Sum) (int,int) = ^(int a ,int b){
        return a + b;
    };
    NSLog(@"使用block语法计算 a + b  = %i + %i = %i",a,b,Sum(5,6));
    
    MyBlock block = ^(int a,int b){
        NSLog(@"block访问局部变量 c = %i , d= %i ", c, d);
        NSLog(@"使用block语法计算 a * b  = %i * %i = %i",a,b, a*b );
        // block只能访问局部变量，不能修改，否则会报错。
        // 如果局部变量用 __block 关键字修饰，就可以在block内部修改。
       // c = a - b;
        d = a / b ;
        return d ;
    };
    NSLog(@"调用MyBlock计算 c / a = %i * %i = %i",c,a,block(c,a));
    NSLog(@"调用block后局部变量 c = %i , d= %i ", c, d);
}

void testBlockButton(){
    BlockButton *btn = [[[ BlockButton alloc] init] autorelease];
    btn.blockBtnLister = ^(BlockButton *btn){
        NSLog(@"回调，BlockButtonLister 监听到button = %@ 被点击。。。。", btn);
    };
    [ btn click];
}

int Sum(int a,int b){
    return a + b ;
}

void testBlockPointMethod(){
    // 定义一个block和一个指向函数的指针
    typedef int (^BlockSum)(int,int);
    typedef int (*PointSum)(int,int);
    
    BlockSum bs = ^(int x,int y){
        return x + y ;
    };
    PointSum ps = Sum;
    
    int t1 = 7,t2 = 8 ;
    NSLog(@"使用block计算 t1 + t2 = %i + %i = %i" , t1, t2 ,bs(t1,t2));
    NSLog(@"使用指向函数的指针计算 t1 + t2 = %i + %i = %i" , t1, t2 ,ps(t1,t2));
    //NSLog(@"使用指向函数的指针计算 t1 + t2 = %i + %i = %i" , t1, t2 ,(*ps)(t1,t2));
}