//
//  005_basic_class_NSDictonary.m
//  Foundation
//
//  Created by 郑春喜 on 15/5/10.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "005_basic_class_NSDictionary.h"
#import "Model.h"

@implementation Dictonary

-(void) createDict{
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
    NSLog(@"dictionaryWithObject创建dictionary : %@",dict);
    
    dict = [NSDictionary dictionaryWithObjectsAndKeys:
            @"firstName",@"chunxi",
            @"secondName",@"zheng",
            @"sex",@"male",nil];
    NSLog(@"dictionaryWithObjectsAndKeys创建dictionary : %@",dict);
    
    NSArray *keys = [NSArray arrayWithObjects:@"Sno",@"Sname",@"sex",@"brithday",@"email", nil];
    NSArray *values = [NSArray arrayWithObjects:@"0207",@"郑春喜",@"男",@"1988-12-29",@"zhengchunxi@foxmail.com", nil];
    dict = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    NSLog(@"dictionaryWithObjects创建dictionary : %@",dict);
    
    dict = [NSDictionary dictionaryWithContentsOfFile:@"/Users/zhengchunxi/Xcode/Foundation/Foundation/dict.xml"];
    NSLog(@"dictionaryWithContentsOfFile创建dictionary : %@",dict);
}

-(void)useDict{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
            @"chunxi", @"firstName",
            @"chunxi", @"name",
            @"zheng",  @"secondName",
            @"male",   @"sex",
            nil];
    
    NSLog(@"返回键值对个数 : %zi",dict.count);
    NSLog(@"objectForKey根据key获取value : %@",[dict objectForKey:@"sex"]);
    
    [dict writeToFile:@"/Users/zhengchunxi/Xcode/Foundation/Foundation/dict.xml" atomically:YES];
    NSLog(@"write dictinary to file dict.xml");
    
    NSLog(@"allKeys 拿到字典所有的key : %@",[dict allKeys]);
    NSLog(@"allValues 拿到字典所有的value : %@",[dict allValues]);
    NSLog(@"allKeysForObject 拿到字典中value=obj的所有的key : %@",[dict allKeysForObject:@"chunxi"]);
    
    NSArray *keys = [NSArray arrayWithObjects:@"name",@"sex",@"email", nil];
    NSArray *values = [dict objectsForKeys:keys notFoundMarker:@"not found"];
    NSLog(@"使用objectsForKeys根据给的key数组获取元素，找不到key时用notFoundMarker指定返回值。%@",values);
}

-(void) scanDictByFor{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"chunxi", @"firstName",
                          @"chunxi", @"name",
                          @"zheng",  @"secondName",
                          @"male",   @"sex",
                          nil];
    NSLog(@"############ 使用for循环遍历dict ############");
    for (id key in dict) {
        NSLog(@"%@ = %@",key,[dict objectForKey:key]);
    }
}

-(void) scanDictByEnmu{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"chunxi", @"firstName",
                          @"zheng",  @"secondName",
                          @"male",   @"sex",
                          nil];
    NSLog(@"############ 使用key迭代器循环遍历dict ############");
    NSEnumerator *eumu = [dict keyEnumerator];
    id key = nil;
    while (key = [ eumu nextObject]) {
        NSLog(@"%@ = %@",key,[dict objectForKey:key]);
    }
    /*
    NSLog(@"############ 使用对象迭代器循环遍历dict ############");
    eumu = [dict objectEnumerator];
    id value = nil;
    while (value = [ eumu nextObject]) {
        [dict ];
        NSLog(@"%@ = %@",[dict ],value);
    }
    */
}

-(void) scanDictByBlock{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"chunxi", @"firstName",
                          @"zheng",  @"secondName",
                          @"male",   @"sex",
                          nil];
    // 每遍历一次都会调用一次block
    [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSLog(@"%@ = %@" ,key,obj);
    }];
}

-(void) sort{
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"chunxi", @"firstName",
                          @"zheng",  @"secondName",
                          @"male",   @"sex",
                          nil];
    NSArray *keys = [dict keysSortedByValueUsingSelector:@selector(compare:)];
    [keys enumerateObjectsUsingBlock:^(id key, NSUInteger keyids, BOOL *stop) {
        NSLog(@" %@ = %@",key,[dict objectForKey:key]);
    }];
}

#pragma mark 一个对象成为字典的key或者value时，字典会对这个对象进行一次retain.当字典被销毁时，里面的key和value都会进行一次release
-(void) memory{
    Model *m1 = [Model initWithName:@"性别"];
    Model *m2 = [Model initWithName:@"年龄"];
    Model *m3 = [Model initWithName:@"个人月收入"];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          m1,@"sex",
                          m2,@"age",
                          m3,@"income",
                          nil];
    NSLog(@"m1 计数器 = %zi",[m1 retainCount]);
    NSLog(@"%@",dict);
}

-(void) usdMutableDict{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"value" forKey:@"key"];
    [dict setValue:@"zhengchunxi" forKey:@"name"];
    [dict setValue:@"sprng292713@gmail.com" forKey:@"email"];
    NSLog(@"%@",dict);
    [dict setValue:@"update" forKey:@"key"];
    NSLog(@"%@",dict);
    [dict removeObjectForKey:@"key"];
    NSLog(@"%@",dict);
}

@end
