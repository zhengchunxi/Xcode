//
//  004_Protocol.h
//  ObjectC
//
//  Created by 郑春喜 on 15/4/26.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>

//使用protocol关键字定义一个协议,并实现NSObject协议(最基本的协议)
@protocol Listener <NSObject>

-(void)click;

@end

@interface Button : NSObject

@property (nonatomic,retain) id<Listener> listener;

-(void)click;

@end