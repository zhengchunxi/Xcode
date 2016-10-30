//
//  004_Protocol.m
//  ObjectC
//
//  Created by 郑春喜 on 15/4/26.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "004_Protocol_Button.h"

@implementation Button

-(void)click{
    // 告诉监听器按钮被点击
    [ _listener click ];
}

-(void)dealloc{

    [ _listener release ];
    [ super dealloc ];
}

@end
