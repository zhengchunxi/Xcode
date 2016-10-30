//
//  003_Memory.m
//  ObjectC
//
//  Created by 郑春喜 on 15/4/12.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "003_Memory.h"

@implementation Memory

#pragma mark - 实现age的get/set方法
#pragma mark age
@synthesize age;

#pragma mark getTeacher
-(Teacher *) teacher{
    return teacher;
}
#pragma mark setTeacher
-(void) setTeacher:(Teacher *)_teacher{
    if(teacher != _teacher){     // 如果传过来的teacher不是当前对象中的teacher，则先释放，然后再set。
        NSLog(@"释放Memory中旧的teacher = %@，在持有新的teacher = %@",self.teacher,_teacher);
        [teacher release];
        teacher = [_teacher retain];
    }
}

#pragma mark - 其他方法
#pragma mark 记得的老师
-(void) remenberTeacher:(Teacher *)_teacher{
    NSLog(@"Memory中的Teacher = %@",_teacher);
}

#pragma mark - 生命周期方法
#pragma mark 重写dealloc方法
- (void) dealloc{
    NSLog(@"释放Memory对象teacher = %@",teacher);
    [teacher release];
    NSLog(@"调用了Memory对象的dealloc方法，%@对象被销毁",self);
    [super dealloc];     //  最后调用父类的dealloc方法， 父类的dealloc会做一些回收操作。如果不先调用，会造成内存泄露
  //  NSLog(@"Memory对象的引用计数器个数 = %zi",[self retainCount]);
}
@end
