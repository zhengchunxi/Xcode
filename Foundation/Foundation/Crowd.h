//
//  Crowd.h
//  Foundation
//
//  Created by 郑春喜 on 15/5/4.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Model;

@interface Crowd : NSObject

@property (nonatomic,retain) NSString *crowdName;
@property (nonatomic,retain) NSString *version;
@property (nonatomic,retain) Model *model;

+(id)initWithCrowdName:(NSString *)crowdName Model:(Model *)model;
+(id)initWithCrowdName:(NSString *)crowdName Version:(NSString *)version Model:(Model *)model;

-(NSComparisonResult) comparaCrowd:(Crowd *)crowd;

-(NSString *) description;
-(void) dealloc;

@end
