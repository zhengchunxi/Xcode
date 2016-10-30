//
//  002_basci_class.m
//  Foundation
//
//  Created by 郑春喜 on 15/5/2.
//  Copyright (c) 2015年 郑春喜. All rights reserved.
//

#import "002_basic_class_NSString.h"

@implementation BasicNSString

#pragma mark - NSString类字符串的创建
#pragma mark 利用NSString对象创建string常用的方法
-(void) stringCreate{
    NSString *string = [[[ NSString alloc] init] autorelease];
    string = @"创建一个NSString对象，调用init()初始化创建字符串。由于调用了alloc，因此需要release";
    NSLog(@"string计数器 = %zi 。 %@",[string retainCount],string);
    //[string release];
    
    string = [[[ NSString alloc] initWithString:@"创建一个NSString对象,调用initWithString()初始化创建字符串。由于调用了alloc，因此需要release" ] autorelease];
    NSLog(@"string计数器 = %zi 。 %@",[string retainCount],string);
    
    string = [[[ NSString alloc] initWithFormat:@"创建一个NSString对象,调用创建initWithFormat()初始化创建字符串。由于调用了alloc，因此需要release"] autorelease];
    NSLog(@"string计数器 = %zi 。 %@",[string retainCount],string);
    
    string = [[[ NSString alloc] initWithUTF8String:"创建一个NSString对象,调用initWithUTF8String()初始化创建字符串。由于调用了alloc，因此需要release"]autorelease];
    NSLog(@"string计数器 = %zi 。 %@",[string retainCount],string);
    
    string = @"直接赋值。因为没有alloc，因此不需要retain";
    NSLog(@"%@",string);
    
    // 新版的sdk已不推荐这样创建一个NSSting，而是采用直接赋值
//    string = [ NSString stringWithString:@"利用NSSting的静态方法stringWithString创建一个字符串。因为没有alloc，因此不需要retain"];
//    NSLog(@"%@",string);
    
    string = [ NSString stringWithFormat:@"利用NSSting的静态方法stringWithFormat创建一个字符串。因为没有alloc，因此不需要retain"];
    NSLog(@"%@",string);
    
    string = [ NSString stringWithUTF8String:"利用NSSting的静态方法stringWithString创建一个字符串。因为没有alloc，因此不需要retain"];
    NSLog(@"%@",string);
    
}

#pragma mark stringWithContentsOfFile:只带path参数的方法已过期，处理中文会出问题。带path、encoding、error的方法可处理中文,参数中error需要的是一个指向指针的指针**error ,因为出异常时需要返回对应的异常信息(需要在方法内修改变量的值，因此方法需要的参数是变量的指针)。
-(void) stringCreateFormFile{
    NSError *error ;
    NSURL *url = [NSURL URLWithString:@"file:///Users/zhengchunxi/python/pycommon/command.py"];
    
    NSString *path = @"/Users/zhengchunxi/python/pycommon/command.py";
//    path = @"/Users/zhengchunxi/python/pycommon/sendemail.py";
//    NSString *content = [NSString  stringWithContentsOfFile:path];          // 这个方法已过期，读取中文文件时会出错
    NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    url = [NSURL URLWithString:[NSString stringWithFormat:@"file://%@",path]];
    content = [NSString stringWithContentsOfURL:url encoding:(NSUTF8StringEncoding) error:&error];
    
    if (error) {
        NSLog(@"读取失败,msg = %@",error);
    }else{
        NSLog(@"%@",content);
    }
}

#pragma mark - NSString类字符串的导出到文件
#pragma mark string输出到文件
-(void) stringExport{
    NSError *error ;
    
    NSString *path = @"/Users/zhengchunxi/Xcode/Foundation/Foundation/string_export.txt";
    NSString *content = @"string 导出到文件。\n如果输出文件不存在，会自动创建，但是如果是目录不存在，会报错。\nNSError的方法localizedDescription可以返回主要的错误信息";
    
    [content writeToFile:path atomically:YES encoding:(NSUTF8StringEncoding) error:&error];
    
    if (error) {
        NSLog(@"写入失败,msg = %@",[error localizedDescription]);
    }else{
        NSLog(@"写入成功。文件内容是：\n%@",content);
    }

}

#pragma mark -
#pragma mark 字符串大小写转化
-(void) caseChange{
    NSString *string = @"I Love Object-C";
    NSLog(@"uppercaseString全部转成大写字母：%@",[string uppercaseString]);
    NSLog(@"lowercaseString全部转成小写字母：%@",[string lowercaseString]);
    NSLog(@"capitalizedString首字母转成大写：%@",[string capitalizedString]);
}

#pragma mark -
#pragma mark 字符串比较
-(void) compare{
    NSString *str1 = @"I Love Object-C";
    NSString *str2 = @"I love object-c";
    NSLog(@"isEqualToString 比较两个字符串内容是否相同(0-否,1-是) : %i\n\n", [str1 isEqualToString:str2]);
    
    NSComparisonResult result = [str1 compare:str2];
    NSLog(@"NSComparisonResult类型取值：NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending");
    NSLog(@"compare逐个字符比较,，返回NSComparisonResult类型：%zi\n\n",result);
    
    //result = [str1 compare:NSStringFromRange({3,4}) options:(NSBackwardsSearch)];
    //NSLog(@"compare逐个字符比较,，返回NSComparisonResult类型：%zi",result);
    
    result = [str1 caseInsensitiveCompare:str2];
    NSLog(@"caseInsensitiveCompare忽略大小写逐个字符比较,，返回NSComparisonResult类型：%zi\n\n",result);
}

#pragma mark -
#pragma mark 字符串搜索
-(void) search{
    NSString *string = @"http://blog.csdn.net/spring292713";
    NSLog(@"string  hasPrefix [http://] = %i",[string hasPrefix:@"http://"]);
    NSLog(@"string  hasSuffix [spring] = %i",[string hasSuffix:@"spring"]);
    
    NSRange range = [string rangeOfString:@"csdn"];
    NSLog(@"rangeOfString : %@", NSStringFromRange(range));
    
    range = [string rangeOfString:@"chunxi" options:NSBackwardsSearch];
    NSLog(@"rangeOfString倒序搜索 : %@", NSStringFromRange(range));
    
    range = [string rangeOfString:@"csdn" options:NSBackwardsSearch range:NSMakeRange(7, 20)];
    NSLog(@"rangeOfString倒序搜索并指定搜索范围{7，20} : %@", NSStringFromRange(range));
}

#pragma mark -
#pragma mark 字符串截取
-(void) substring{
    NSString *string = @"http://blog.csdn.net/spring292713";
    NSLog(@"从指定位置开始，截取到结尾,返回值包含开始位置的字符 > substringFromIndex=7 : %@",[string substringFromIndex:7]);
    NSLog(@"从0开始，截取到指定位置，返回值不包含结束位置的字符 > substringToIndex=20 : %@",[string substringToIndex:20]);
    NSLog(@"指定开始位置和要截取的长度 > substringWithRange={7,13} : %@",[string substringWithRange:NSMakeRange(7, 13)]);
}

#pragma mark -
#pragma mark 字符串切分
-(void) separate{
    NSString *string = @"http://blog.csdn.net/spring292713";
    NSLog(@"componentsSeparatedByString: %@", [string componentsSeparatedByString:@"/"]);
  // split
}

#pragma mark -
#pragma mark 字符串与路径
-(void) path{
    NSString *path = @"/Users/zhengchunxi/Xcode/Foundation/Foundation/string_export.txt";
    NSArray *array = [path pathComponents];
    NSLog(@"pathComponents将string根据文件分隔符切分成NSArray数组 : %@",array);
    
    path = [NSString pathWithComponents:array];
    NSLog(@"静态调用[NSString pathWithComponents:array],将NSArray数组拼接成路径 : \n\t%@",path);
    
    NSLog(@"isAbsolutePath判断是否是绝对路径（依据是是否以 / 开头） : %i",[path isAbsolutePath]);
    
    [path stringByAppendingString:@".tar.gz"];
    NSLog(@"lastPathComponent获取最后一级目录 : %@",[path lastPathComponent]);
    path = [path stringByDeletingLastPathComponent];
    NSLog(@"stringByDeletingLastPathComponent删除最后一级目录 : \n\t%@",path);
    
    NSLog(@"stringByAppendingString拼接一级目录,不会自动加 / : \n\t%@",[path stringByAppendingString:@"/string_export.txt"]);
    path = [path stringByAppendingPathComponent:@"string_export.tar.gz"];
    NSLog(@"stringByAppendingPathComponent拼接一级目录,会自动加 / : \n\t%@",path);
    
    NSLog(@"pathExtension 获取扩展名, 根据最后一个.切分获取: %@", [path pathExtension]);
    path = [path stringByDeletingPathExtension];
    NSLog(@"stringByDeletingPathExtension 删除扩展名 : \n\t%@", path);
    NSLog(@"stringByAppendingString 添加扩展名 : \n\t%@", [path stringByAppendingString:@".txt"]);
    
    path = [path stringByAppendingPathExtension:@".txt"];
    NSLog(@"stringByAppendingPathExtension 添加扩展名 : \n\t%@", path);
}

#pragma mark -
#pragma mark 字符串转换成其他类型
-(void) others{
    NSString *string = @"123456789a";
    NSLog(@"string[%@] length = %zi",string , [string length]);
    NSLog(@"string[%@] to intValue      =  %i", string, [string intValue]);
    NSLog(@"string[%@] to doubleValue   =  %zd",string, [string doubleValue]);
    NSLog(@"string[%@] to floatValue    =  %f", string, [string floatValue]);
    NSLog(@"string[%@] to longLongValue =  %zd",string, [string longLongValue]);
    NSLog(@"string[%@] to C语言字符串[UTF8String] =  %s",string, [string UTF8String]);
  // 长度  转int double等 、转C语言中的char *
}

#pragma mark -
#pragma mark 创建一个可变字符串，可以进行append、replace、insert、delete等操作，类似于java中的StringBuffer等。
-(void) mutableString{
    // 预分配10个字节的存储空间
    NSMutableString *mstr = [[NSMutableString alloc] initWithCapacity:10];
    [mstr setString:@"select (id,name) from user"];
    
    // append
    [mstr appendString:@" and id = 1"];  // appendString没有返回值，但是执行后字符串的值已修改
    [mstr appendFormat:@" and name = '%@' and age = %i",@"admin",25];
    [mstr appendString:@";"];
    NSLog(@"%@",mstr);
    
    // replace第一个
    //[mstr replaceCharactersInRange:NSMakeRange(22, 4) withString:@"_user"];
    NSRange range = [mstr rangeOfString:@"and"];
    [mstr replaceCharactersInRange:range withString:@"where"];
     NSLog(@"%@",mstr);
    
    // insert
    range = [mstr rangeOfString:@"name"];
    [mstr insertString:@",email" atIndex:(range.location + range.length)];
    NSLog(@"%@",mstr);

    
    // delete
    range = [mstr rangeOfString:@",email"];
    [mstr deleteCharactersInRange:range];
    NSLog(@"%@",mstr);
}

@end
