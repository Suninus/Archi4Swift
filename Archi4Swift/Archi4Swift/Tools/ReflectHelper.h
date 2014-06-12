//
//  ReflectHelper.h
//  Archi4Swift
//
//  Created by sunyanfei on 14-6-12.
//  Copyright (c) 2014年 newstep. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface ReflectHelper : NSObject

+ (void)OC:(NSObject *)obj setValue:(id)value forKey:(NSString *)key;

@end