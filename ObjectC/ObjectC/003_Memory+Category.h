//
//  NSObject+_03_Memory_Category.h
//  ObjectC
//
//  Created by 郑春喜 on 15/4/26.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "003_Memory.h"

// ()中的即为一个分类器的名称
// 这里引用类不能用@class，因为是扩充方法，需要知道类已有哪些方法
@interface Memory (Category)

- (void) expand01;
-(NSString *) json;
@end
