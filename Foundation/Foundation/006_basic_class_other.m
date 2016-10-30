//
//  006_basic_class_other.m
//  Foundation
//
//  Created by 郑春喜 on 15/5/23.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "006_basic_class_other.h"
typedef struct{
    int year;
    int month;
    int day;
} MyDate;

@implementation BasicOther

#pragma -
#pragma mark 基本数据类型(int、char、float等本身不能直接放入NSArray，但是可以通过包装后放到NSArray中)
-(void)number{
    NSMutableArray *array = [NSMutableArray array];
    
    NSNumber *number = [NSNumber numberWithInt:100];   // 将int 100 包装成NSNumber对象
    [array addObject:number];                      // 添加到NSArray中
    NSNumber *num = [array objectAtIndex:0];         // 取出来的还是一个NSNumber对象，不支持自动解包(取出来的不会自动转换int)
    NSLog(@" %i",[num intValue]);
 
    /** NSNumber常用方法
     +(NSNumber *) numberWithBool:(BOOL) value;
     +(NSNumber *) numberWithChar:(char) value;
     +(NSNumber *) numberWithFloat:(float) value;
     +(NSNumber *) numberWithLongLong:(long long) value;

     -(id) initWithBool:(BOOL) value;
     -(id) initWithChar:(char) value;
     -(id) initWithFloat:(float) value;
     -(id) initWithLongLong:(long long) value;
     
     -(int) intValue
     -(char) charValue
     -(BOOL) boolValue
     -(NSString *) stringValue
     
     -(NSComparisonResult) compare:(NSNumber *) otherNum
     -(BOOL) isEqualToNumber(NSNumber *) otherNum
     */
}

#pragma mark NSValue可以包装任何类型(int、char、结构体、对象、指针等)
-(void) value{
    CGPoint point = CGPointMake(100, 80);
    NSValue *vaule = [NSValue valueWithPoint:point];
    
    NSMutableArray *array = [NSMutableArray array];
    //[array addObject:date];
    [array addObject:vaule];
    
    NSValue *last = [array lastObject];
    NSPoint p = [last pointValue];
    
    NSLog(@"将从NSValue取出的point和之前的比较 : %i ",CGPointEqualToPoint(point,p) );
    
    //[NSValue value:<#(const void *)#> withObjCType:(const char *)];
    // 方法需要两个参数:<#(const void *)#>代表要存储的对象的指针，void * 表示任何类型的指针。(const char *)表示该对象类型的字符值
    
    MyDate date = {2015,5,23};
    char *type = @encode(MyDate);
    NSValue *nsvalue = [NSValue value:&date withObjCType:type];
    
    MyDate d ;
    [nsvalue getValue:&d];   // getValue 本身返回void，但是需要而参数是一个指针，传递一个指针，拿到指针指向地址的值
    NSLog(@"将结构体放入NSValue, 存入的结构体类型 = %zd ,year = %i, month = %i, day = %i ",[nsvalue objCType],d.year,d.month,d.day);
}

#pragma mark null的包装
-(void) nulls{
// 数组和字典中，nil有着特殊的含义，不能放入其中。有时候需要表示一个nil，需要使用其包装类
    
    
}
@end
