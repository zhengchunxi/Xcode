//
//  008_basic_reflect.m
//  Foundation
//
//  Created by 郑春喜 on 15/5/24.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "008_basic_reflect.h"
#import "Model.h"

@implementation Reflect

-(void) isCategory{
    Model *model = [Model initWithName:@"model"];
    NSLog(@"isKindOfClass判断对象model是不是NSObject类或者其子类 %zi",[model isKindOfClass: [NSObject class]]);
    NSLog(@"isMemberOfClass判断对象NSObject是不是类NSObject，不包含其子类 %zi",[model isMemberOfClass: [NSObject class]]);
    //NSLog(@"conformsToProtocol判断对象NSObject是否遵守NSObject协议 %zi",[model conformsToProtocol:[NSObject class]]);

    // 间接调用类的方法
    if([model respondsToSelector:@selector(train)]){
        NSLog(@"respondsToSelector判断类是否实现某个方法，performSelector可以间接调用内的方法");
        [model performSelector:@selector(train)];
        [model performSelector:@selector(success:) withObject:@"训练成功"];
        // afterDelay 延时多少秒后执行。但是这里main会直接退出,看不到效果
        //[model performSelector:@selector(success:) withObject:@"训练成功" afterDelay: 1];
    }
}

-(void) reflect{
    Class category = NSClassFromString(@"Model");
    Model *model = [[category alloc]init];
    NSLog(@"使用NSClassFromString反射获得一个Model类: %@",model);
    
    NSString *string = NSStringFromClass([Model class]);
    NSLog(@"使用NSStringFromClass反射获得类名: %@",string);
    
    
    // 方法的反射
    SEL selector = NSSelectorFromString(@"success:");
    NSString *method = NSStringFromSelector(selector);
    [model performSelector:selector withObject:[NSString stringWithFormat:@"方法=%@反射成功",method]];
    [model release];
}

@end
