//
//  001_Stuednt.m
//  ObjectC
//
//  Created by 郑春喜 on 15/4/6.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "001_Student.h"

@implementation Student

- (int) Sno{
    return _Sno;
}
- (NSString *)Sname{
    return _Sname;
}
- (NSString *)sex{
    return _sex;
}
- (int) age{
    return _age;
}
- (float) height{
    return _height;
}
- (float) weight{
    return _weight;
}

- (void) setSno:(int)Sno{
    _Sno = Sno;
}
- (void) setSname:(NSString *)Sname{
    _Sname= Sname;
}
- (void) setSex:(NSString *)sex{
    _sex = sex;
}
- (void) setAge:(int)age{
    _age = age;
}

- (void)setHeight:(float) height{
    _height = height;
}
- (void)setWeight:(float) weight{
    _weight = weight;
}
- (void)setAge:(int)age :(id)Sname{
    _age = age;
    _Sname = Sname;
}


- (id)initStudent:(int)Sno :(NSString *)Sname :(NSString *)sex :(int)age :(float)height :(float)weight{
    /*
    // 首先调用super的构造方法
    self = [super init];   //父类的init返回的可能是空 nil，因此如果[super init]返回nil,则不需要给属性赋值
    if(self){             // if(self != nil)
         _Sno = Sno;_Sname  = Sname;_age = age;_Sex = sex ; _height = height;_weight = weight;
    }
     */
    
    if (self = [super init]) {
        self.Sno = Sno;
        _Sname = Sname;
        _sex = sex ;
        self.age = age;
        self.height = height;
        self.weight = weight;
    }
    return self;
}

-(NSString *)description{
    //  stringWithFormat 创建对象后会自动调用 autorelease 方法自动释放
    NSString *Sname = self.Sname;
    NSString *desc = [NSString stringWithFormat:@"Sno = %i \t Sname = %@ \t age = %i \t height = %.2f \t weight = %.2f",
                                           self.Sno,    Sname,        self.age,    self.height,      self.weight];
    return desc;
}

- (void) privateMethod{
    // 在 .h 中没有声明的方法即私有方法。
    NSLog(@"在 .h 中没有声明的方法即私有方法。");
}
@end
