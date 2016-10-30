//
//  001_Stuednt.h
//  ObjectC
//
//  Created by 郑春喜 on 15/4/6.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>

// @interface 声明一个类，相当于Java中的class关键字
// : 冒号表示继承。Object中一定要制定父类
// @end 类的结束标识

@interface Student : NSObject{
    @public     //
    int _Sno;
    NSString *_Sname;
    
    @protected  //这个可以不写，默认的作用于就是 @protected  即可以在类内部和子类中访问
    int _age;
    NSString *_sex;
    
    @private
    float _height;
    float _weight;
}

// - 表示动态方法， + 表示静态方法。方法的返回值和参数类型都需要用()括起来。
//  ObjectC中的建议是get方法名称和变量名一致。为了区别，变量名都以 _ 开头
- (int) Sno;
- (NSString *) Sname;
- (NSString *) sex;
- (int) age;
- (float) height;
- (float) weight;

- (void)setSno:(int)Sno;
- (void)setSname:(NSString *) Sname;
- (void)setSex:(NSString *) sex;
- (void)setAge:(int) age;  // 方法名称成是 setAge:  。冒号也是方法名的一部分
- (void)setAge:(int) age :sname;  // 方法名称是 setAge::
- (void)setHeight:(float) height;
- (void)setWeight:(float) weight;

//  自定义构造方法
- (id) initStudent:(int)Sno :(NSString *)Sname :(NSString *)sex :(int)age :(float)height :(float)weight;

// 重写父类的description，父类的description默认返回的是内存地址
-(NSString *)description;

@end