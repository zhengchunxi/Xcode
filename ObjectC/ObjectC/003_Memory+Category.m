//
//  NSObject+_03_Memory_Category.m
//  ObjectC
//
//  Created by 郑春喜 on 15/4/26.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "003_Memory+Category.h"

@implementation Memory (Category)

- (void)expand01{
    NSLog(@"使用Category语法，对Memory进行扩充\n");
}

-(NSString *)json{
    return  [NSString stringWithFormat:@"{'teacher':'%@','age':%i,'title':'%@'}",self.teacher.name,self.teacher.age,self.teacher.title];
}

@end
