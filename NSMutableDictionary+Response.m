//
//  NSMutableDictionary+Response.m
//  Horde
//
//  Created by junwen.wu on 14-7-19.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NSMutableDictionary+Response.h"

@implementation NSMutableDictionary(Response)

-(NSMutableDictionary*) response_status {
    NSMutableDictionary* status = [self objectForKey:@"s"];
    return status;
}

-(NSMutableDictionary*) response_business {
    NSMutableDictionary* status = [self objectForKey:@"b"];
    return status;
}
@end
