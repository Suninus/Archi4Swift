//
//  ReflectHelper.m
//  Archi4Swift
//
//  Created by sunyanfei on 14-6-12.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

#import "ReflectHelper.h"

@implementation ReflectHelper

+ (void)OC:(NSObject *)obj setValue:(id)value forKey:(NSString *)key
{
    [obj setValue:value forKey:key];
}

@end
