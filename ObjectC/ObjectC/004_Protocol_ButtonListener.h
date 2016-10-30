//
//  004_Protocol_ButtonListener.h
//  ObjectC
//
//  Created by 郑春喜 on 15/4/26.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "004_Protocol_Button.h"

@interface ButtonListener : NSObject<Listener>

-(void)click;

@end