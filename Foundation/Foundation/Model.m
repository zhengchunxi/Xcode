//
//  Model.m
//  Foundation
//
//  Created by 郑春喜 on 15/5/3.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "Model.h"

@implementation Model

+(id)initWithName:(NSString *) modelName{
    Model *model = [[[Model alloc]init]autorelease];
    model.modelName = modelName;
    return model;
}

-(void) train{
    NSLog(@"Model %@ start trainning……",self);
}

-(void) success:(NSString  *)msg{
    NSLog(@"Model %@ %@ ",self, msg);
}

-(NSComparisonResult) compareModel:(Model *)model{
    NSComparisonResult result = [_modelName compare:model.modelName];
    return result;
}

-(NSString *) description{
    return [NSString stringWithFormat:@"Model<%@> ",_modelName ];
}

-(void) dealloc{
    NSLog(@"Model对象 %@ 被释放",_modelName);
    [_modelName release];
    [super dealloc];
}

@end
