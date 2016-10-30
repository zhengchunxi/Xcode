//
//  005_basic_class_NSDictonary.h
//  Foundation
//
//  Created by 郑春喜 on 15/5/10.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dictonary : NSObject

-(void) createDict;
-(void) useDict;

-(void) scanDictByFor;
-(void) scanDictByEnmu;
-(void) scanDictByBlock;

-(void) sort;

-(void) memory;

-(void)usdMutableDict;

@end
