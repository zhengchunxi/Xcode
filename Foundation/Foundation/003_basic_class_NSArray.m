//
//  003_basic_class_NSArray.m
//  Foundation
//
//  Created by 郑春喜 on 15/5/3.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "003_basic_class_NSArray.h"
#import "Model.h"
#import "Crowd.h"

@implementation BasicNSArray

#pragma mark -
#pragma mark 创建NAArray。NSArray是用来存储对象的有序列表，是不可变的。NSArray不能存储C语言中的基本数据类型，如int、float、char、enum、struct。NSArray页不能存储nil元素，nil代表数组的结束。数组中可以存放任何对象。
-(void) createArray{
    // 创建一个空数组
    NSArray *array = [NSArray array ];
    // 创建一个只有一个元素的数组
    array = [NSArray arrayWithObjects:@"onlyone", nil];
    array = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
    
    NSLog(@"array = %@ , 共有 %zi 个元素",array,[array count]);
}

#pragma mark NSArray常用的方法：count、containsObject、lastObject、objectAtIndex、indexOfObject
-(void) arrayMethod{
    NSArray *array = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
    NSLog(@"array = %@ , 共有 %zi 个元素",array,[array count]);
    
    if ([array containsObject:@"c"]) {
        NSLog(@"使用containsObject判断NSArray中包含元素 c ");
    }
    
    NSLog(@"使用lastObject取出数组中最有一个元素 : %@",[array lastObject]);
    NSLog(@"使用objectAtIndex拿到对应位置的元素 : %@",[array objectAtIndex:2]);
    
    NSLog(@"使用indexOfObject 查找元素c的下标  : %zi",[array indexOfObject:@"c"]);
    NSLog(@"使用indexOfObject在指定范围内查找元素c的下标  : %zi",[array indexOfObject:@"c" inRange:NSMakeRange(0, 2)]);
    
}

#pragma mark -
#pragma mark NSArray的内存管理。将对想存入NSArray时，NSArray会自动给内部所有对象发送retain消息，NSArray释放后会自动向内部所有对象发送dealloc消息
-(void) arrayMemory{
    Model *m1 = [[ Model alloc] init ];
    Model *m2 = [[ Model alloc] init ];
    Model *m3 = [[ Model alloc] init ];
    NSArray *array = [[ NSArray alloc] initWithObjects: m1, m2, m3, nil];

    NSLog(@"Model m1 %@ 的计数器 = %zi",m1,[m1 retainCount]);
    NSLog(@"Model m2 %@ 的计数器 = %zi",m2,[m2 retainCount]);
    NSLog(@"Model m3 %@ 的计数器 = %zi",m3,[m3 retainCount]);
    
    [array release];
    
    NSLog(@"Model m1 %@ 的计数器 = %zi",m1,[m1 retainCount]);
    NSLog(@"Model m2 %@ 的计数器 = %zi",m2,[m2 retainCount]);
    NSLog(@"Model m3 %@ 的计数器 = %zi",m3,[m3 retainCount]);
    NSLog(@"array 已释放所以有的model");
    
    [m1 release];
    [m2 release];
    [m3 release];
}

#pragma mark - 
#pragma mark 让NSArray中虽有元素都执行某个方法
-(void) sendMessage{
    Model *m1 = [[[ Model alloc] init ] autorelease];
    Model *m2 = [[[ Model alloc] init ] autorelease];
    Model *m3 = [[[ Model alloc] init ] autorelease];
    NSArray *array = [ NSArray arrayWithObjects: m1, m2, m3, nil];
    [array makeObjectsPerformSelector:@selector(train)];
    [array makeObjectsPerformSelector:@selector(success:) withObject:@"训练成功"];
}

#pragma mark -
#pragma mark 遍历NSArray:使用objectAtIndex遍历
-(void) arrayTraversal01{
    NSArray *array = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
    
    NSLog(@"使用objectAtIndex遍历NSArray……");
    unsigned long count = [array count];
    for(int i=0; i<count; i++){
        NSLog(@"array[%i] = %@",i,[array objectAtIndex:i]);
    }
}

#pragma mark 遍历NSArray:快速遍历
-(void) arrayTraversal02{
    NSArray *array = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
    NSLog(@"快速遍历NSArray……");
    int i = 0;
    for(id obj in array){
        NSLog(@"array[%i] = %@",i,obj);
        i++ ;
    }
}

#pragma mark 遍历NSArray:使用block遍历
-(void) arrayTraversal03{
    NSLog(@"使用block遍历NSArray……");
    NSArray *array = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if(idx == 1){
            *stop = YES;   // 利用指针修改外部变量stop的值
        }
        NSLog(@"array[%zi] = %@",idx,obj);
    }];
}

#pragma mark 遍历NSArray:使用数组的迭代器遍历
-(void) arrayTraversal04{
    NSLog(@"使用迭代器遍历NSArray……");
    NSArray *array = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
    NSEnumerator *enumerator = [array objectEnumerator];
    int i = 0;
    id obj = nil;
    while (obj = [ enumerator nextObject ]) {
        NSLog(@"array[%zi] = %@",i,obj);
        i++ ;
    }
}

#pragma mark -
#pragma mark 利用NSArray派生出新的NSArray，原数组没有改变。
-(void) derive{
    NSArray *arr = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
    NSArray *arr1 = [arr arrayByAddingObject:@"e"];
    NSArray *arr2 = [arr arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:@"c",@"e",@"f", nil]];  // 数组中的元素可以重复
    NSLog(@"原数组 : %@",arr);
    NSLog(@"arrayByAddingObject派生数组 : %@",arr1);
    NSLog(@"arrayByAddingObjectsFromArray数组 : %@",arr2);
    
    NSArray *arr3 = [arr2 subarrayWithRange:NSMakeRange(2, 4)];
    NSLog(@"subarrayWithRange截取数组中的部分形成新数组 : %@",arr3);
}

#pragma mark -
#pragma mark 利用分隔符拼接数组的所有元素成一个字符串
-(void) join{
    NSArray *array = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
    NSString *join = [array componentsJoinedByString:@"->"] ;
    NSLog(@"使用 -> 链接NSArray : %@",join);
}

#pragma mark -
#pragma mark 将数组写入到文件，生成的是xml格式的文件。或者从文件读取，生成array(文件格式要符合要求)
-(void) writeAndRead{
    NSString *path = @"/Users/zhengchunxi/Xcode/Foundation/Foundation/array.xml";
    
    NSArray *array = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
    
    BOOL flag =  [array writeToFile:path atomically:YES];
    if (flag) {
        NSLog(@"将数组 (%@) 写入到文件path = %@ 成功",[array componentsJoinedByString:@","], path);
    }else{
        NSLog(@"数组写入到文件失败");
    }
    
    NSArray *arr  = [NSArray arrayWithContentsOfFile:path];
    NSLog(@"读取文件path = %@ ,生成数组 : \n%@",path ,arr);
}

#pragma mark - 排序
#pragma mark - 基本数据类型的排序：直接调用compare方法排序。排序后原数组没有发生变化
-(void) sortBySelector{
    NSArray *array = [NSArray arrayWithObjects:@"5",@"3",@"7",@"1",@"2",@"4",@"9",@"8",@"6", nil];
    NSLog(@"排序前的数组 : %@",[array componentsJoinedByString:@" , "]);
    
    NSArray *sorted = [array sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"排序后的数组 : %@",[sorted componentsJoinedByString:@" , "]);
}

#pragma mark - 复杂类型的排序：自定义Comparator
-(void) sortByComparator{
    Model *sex = [Model initWithName:@"sex"];
    Model *age = [Model initWithName:@"age"];
    Model *income = [Model initWithName:@"imcome"];
    
    Crowd *c1 = [Crowd initWithCrowdName:@"female" Version:@"20150505" Model:sex];
    Crowd *c2 = [Crowd initWithCrowdName:@"minor" Version:@"20150505" Model:age];
    Crowd *c3 = [Crowd initWithCrowdName:@"10k+" Version:@"20150505" Model:income];
    Crowd *c4 = [Crowd initWithCrowdName:@"adult" Version:@"20150505" Model:age];
    Crowd *c5 = [Crowd initWithCrowdName:@"male" Version:@"20150505" Model:sex];
    Crowd *c6 = [Crowd initWithCrowdName:@"10k-" Version:@"20150505" Model:income];
    
    NSArray *array = [NSArray arrayWithObjects: c1, c2, c3, c4, c5, c6, nil];
    NSLog(@"排序前的数组 : %@",array);
    NSArray *sorted = [array sortedArrayUsingSelector:@selector(comparaCrowd:)];
    NSLog(@"排序后的数组 : %@",sorted);
}

#pragma mark - 复杂类型的排序：利用block排序
-(void) sortByBlock{
    Model *sex = [Model initWithName:@"sex"];
    Model *age = [Model initWithName:@"age"];
    Model *income = [Model initWithName:@"imcome"];
    
    Crowd *c1 = [Crowd initWithCrowdName:@"female" Version:@"20150505" Model:sex];
    Crowd *c2 = [Crowd initWithCrowdName:@"minor" Version:@"20150505" Model:age];
    Crowd *c3 = [Crowd initWithCrowdName:@"10k+" Version:@"20150505" Model:income];
    Crowd *c4 = [Crowd initWithCrowdName:@"adult" Version:@"20150505" Model:age];
    Crowd *c5 = [Crowd initWithCrowdName:@"male" Version:@"20150505" Model:sex];
    Crowd *c6 = [Crowd initWithCrowdName:@"10k-" Version:@"20150505" Model:income];
    
    NSArray *array = [NSArray arrayWithObjects: c1, c2, c3, c4, c5, c6, nil];
    NSLog(@"排序前的数组 : %@",array);
    
    //pragma mark 人群排序：先按模型，然后按人群名称，最后按人群版本
    NSArray *sorted = [array sortedArrayUsingComparator:^NSComparisonResult(Crowd *obj1, Crowd *obj2) {
        NSComparisonResult result = [obj1.model.modelName compare: obj2.model.modelName];
        if (result == NSOrderedSame) {
            result = [obj1.crowdName compare: obj2.crowdName];
            if (result == NSOrderedSame) {
                result = [obj1.version compare: obj2.version];
            }
        }
        return result;
    }];
    NSLog(@"排序后的数组 : %@",sorted);
}

#pragma mark - 复杂排序：利用Descriptors排序描述器排序。首先根据要排序的字段逐个创建排序描述器，指定字段名(和@property后的变量名保持一致，引用对象需要用obj.xxx)。然后将排序描述器按照顺序放入Descriptors。
-(void) sortByDescriptors{
    Model *sex = [Model initWithName:@"sex"];
    Model *age = [Model initWithName:@"age"];
    Model *income = [Model initWithName:@"imcome"];
    
    Crowd *c1 = [Crowd initWithCrowdName:@"female" Version:@"20150505" Model:sex];
    Crowd *c2 = [Crowd initWithCrowdName:@"minor" Version:@"20150505" Model:age];
    Crowd *c3 = [Crowd initWithCrowdName:@"10k+" Version:@"20150505" Model:income];
    Crowd *c4 = [Crowd initWithCrowdName:@"adult" Version:@"20150505" Model:age];
    Crowd *c5 = [Crowd initWithCrowdName:@"male" Version:@"20150505" Model:sex];
    Crowd *c6 = [Crowd initWithCrowdName:@"10k-" Version:@"20150505" Model:income];
    
    //pragma mark 人群排序：先按模型，然后按人群名称，最后按人群版本
    NSArray *array = [NSArray arrayWithObjects: c1, c2, c3, c4, c5, c6, nil];
    NSLog(@"排序前的数组 : %@",array);
    
    //模型排序器
    NSSortDescriptor *modelDesc = [NSSortDescriptor sortDescriptorWithKey:@"model.modelName" ascending:YES];
    //人群名称排序器
    NSSortDescriptor *nameDesc = [NSSortDescriptor sortDescriptorWithKey:@"crowdName" ascending:YES];
    //人群版本排序器
    NSSortDescriptor *versionDesc = [NSSortDescriptor sortDescriptorWithKey:@"version" ascending:YES];
    
    // 将排序器按顺序添加进去
    NSArray *descs = [NSArray arrayWithObjects:modelDesc,nameDesc,versionDesc, nil];
    NSArray *sorted = [array sortedArrayUsingDescriptors:descs];
    NSLog(@"排序后的数组 : %@",sorted);
}


@end
