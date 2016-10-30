//
//  001_basic_struct.h
//  Foundation
//
//  Created by 郑春喜 on 15/5/2.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicStruct : NSObject

@property NSRange *r;
@property NSPoint *p;
@property NSSize *s;
@property NSRect *t;

-(void) range;
-(void) point;
-(void) size;
-(void) rect;

@end
