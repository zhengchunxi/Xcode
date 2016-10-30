//
//  005_Block_Button.h
//  ObjectC
//
//  Created by 郑春喜 on 15/5/2.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BlockButton;

typedef void (^BlockButtonLister) (BlockButton *);

@interface BlockButton : NSObject

// block变量不需要用*
@property (atomic,assign) BlockButtonLister blockBtnLister;

-(void) click;

@end