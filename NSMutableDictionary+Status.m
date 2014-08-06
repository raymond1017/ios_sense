//
//  NSMutableDictionary+Status.m
//  Horde
//
//  Created by junwen.wu on 14-7-19.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NSMutableDictionary+Status.h"

@implementation NSMutableDictionary(Status)

-(NSNumber*) status_code {
    return [self objectForKey:@"code"];
}

-(NSString*) status_desc {
    return [self objectForKey:@"desc"];
}

@end
