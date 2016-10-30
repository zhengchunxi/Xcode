//
//  Crowd.m
//  Foundation
//
//  Created by 郑春喜 on 15/5/4.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "Crowd.h"
#import "Model.h"

@implementation Crowd

+(id)initWithCrowdName:(NSString *)crowdName Model:(Model *)model{
    Crowd *crowd = [[[Crowd alloc]init]autorelease];
    crowd.crowdName = crowdName;
    crowd.model = model;
    return crowd;
}

+(id)initWithCrowdName:(NSString *)crowdName Version:(NSString *)version Model:(Model *)model{
    Crowd *crowd = [[[Crowd alloc]init]autorelease];
    crowd.crowdName = crowdName;
    crowd.version = version;
    crowd.model = model;
    return crowd;
}

#pragma mark 人群排序：先按模型，然后按人群名称，最后按人群版本
-(NSComparisonResult) comparaCrowd:(Crowd *)crowd{
    NSComparisonResult result = [self.model.modelName compare: crowd.model.modelName];
    if (result == NSOrderedSame) {
        result = [self.crowdName compare: crowd.crowdName];
        if (result == NSOrderedSame) {
            result = [self.version compare: crowd.version];
        }
    }
    return result;
}

-(NSString *) description{
    return [NSString stringWithFormat:@"Model = %@, CrowdName = %@, version = %@",self.model.modelName,self.crowdName,self.version ];
}

-(void) dealloc{
    NSLog(@"Crowd对象 %@ 被释放",self);
    [self.crowdName release];
    [self.version release];
    [self.model release];
    [super dealloc];
}


@end
