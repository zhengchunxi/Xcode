//
//  Model.h
//  Foundation
//
//  Created by 郑春喜 on 15/5/3.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic,retain) NSString *modelName;

+(id)initWithName:(NSString *) modelName;

-(void) train;

-(void) success:(NSString *)msg;

-(NSComparisonResult) compareModel:(Model *)model;

-(NSString *) description;
-(void) dealloc;

@end
