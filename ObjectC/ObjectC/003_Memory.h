//
//  003_Memory.h
//  ObjectC
//
//  Created by 郑春喜 on 15/4/12.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "002_Teacher.h"

@interface Memory : NSObject{
    Teacher *teacher;
}

@property int age;

-(Teacher *) teacher;
-(void) setTeacher:(Teacher *)_teacher;

-(void) remenberTeacher:(Teacher *)_teacher;

@end
