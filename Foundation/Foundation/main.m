//
//  main.m
//  Foundation
//
//  Created by 郑春喜 on 15/5/2.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "001_basic_struct.h"
#import "002_basic_class_NSString.h"
#import "003_basic_class_NSArray.h"
#import "004_basic_class_NSMutableArray.h"
#import "005_basic_class_NSDictionary.h"
#import "006_basic_class_other.h"
#import "007_basic_class_NSDate.h"
#import "008_basic_reflect.h"

void basicStruct();
void basicClassString();
void basicClassNSArray();
void mutableArray();
void dictionary();
void other();
void date();
void reflect();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        reflect();
    }
    return 0;
}

void basicStruct(){
    BasicStruct *basicStruct = [[[ BasicStruct alloc] init] autorelease];
    [basicStruct range];
    [basicStruct point];
    [basicStruct size];
    [basicStruct rect];
}

void basicClassString(){
    BasicNSString *basicNSString = [[[ BasicNSString alloc] init] autorelease];
    //[ basicNSString stringCreate];
    //[ basicNSString stringCreateFormFile];
    //[basicNSString stringExport];
    //[basicNSString compare];
    [basicNSString search];
    //[basicNSString substring];
    //[basicNSString separate];
    //[basicNSString path];
    //[basicNSString others];
    //[basicNSString mutableString];
}

void basicClassNSArray(){
    BasicNSArray *array = [[[ BasicNSArray alloc ] init] autorelease];
    //[array arrayMemory];
    //[array sendMessage];
    //[array arrayTraversal01 ];
    //[array arrayTraversal02 ];
    //[array arrayTraversal03 ];
    //[array arrayTraversal04 ];
    //[array derive];
    //[array join];
    //[array writeAndRead];
//    [array sortBySelector];
//    [array sortByComparator];
//    [array sortByBlock];
    [array sortByDescriptors];
}

void mutableArray(){
    MutableArray *arrry = [[[MutableArray alloc]init ] autorelease];
    [arrry arrayCRUD];
//    [arrry arrayMemory];
}

void dictionary(){
    Dictonary *dict = [[[Dictonary alloc]init]autorelease];
    //[dict createDict];
//    [dict useDict];
//    [dict scanDictByFor];
//    [dict scanDictByEnmu];
//    [ dict scanDictByBlock];
//    [dict sort];
    [dict usdMutableDict];
}

void other(){
    BasicOther *other = [[[BasicOther alloc]init]autorelease];
    [other number];
    [other value];
}

void date(){
    BasicNSDate *date = [[[BasicNSDate alloc]init]autorelease];
//    [date createDate];
//    [date useDate];
    [date dateFormat];
}

void reflect(){
    Reflect *reflect = [[[Reflect alloc]init]autorelease];
    [reflect isCategory];
    [reflect reflect];
}
