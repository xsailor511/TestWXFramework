//
//  NSBundle+YourFrameworkBundle.m
//  TestWXFramework
//
//  Created by richard on 2016/10/9.
//  Copyright © 2016年 richard. All rights reserved.
//

#import "NSBundle+YourFrameworkBundle.h"

@implementation NSBundle (YourFrameworkBundle)

+ (NSBundle *)yourFrameworkBundle
{
    static NSBundle *frameworkBundle = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        //NSString *mainBundlePath = [[NSBundle mainBundle] resourcePath];
        //frameworkBundle = [NSBundle bundleWithPath:[mainBundlePath stringByAppendingPathComponent:@"WXFramework.bundle"]];
        frameworkBundle = [NSBundle bundleWithIdentifier:@"com.richard.WXFramework"] ;
    });
    
    return frameworkBundle;
}

@end
