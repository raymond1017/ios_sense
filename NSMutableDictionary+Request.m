//
//  NSMutableDictionary+Request.m
//  Horde
//
//  Created by junwen.wu on 14-7-21.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import "NSMutableDictionary+Request.h"

@implementation NSMutableDictionary(Request)

-(void) build_common_requestWithDeviceID:(NSString*)deviceID
                            andChannelID:(NSString*)cid
                            andVersionID:(NSString*)vid {
    NSMutableDictionary* dict = [NSMutableDictionary new];
    [dict setObject:deviceID forKey:@"did"];
    [dict setObject:cid forKey:@"cid"];
    [dict setObject:vid forKey:@"vid"];
    
    [self setObject:dict forKey:@"c"];
}

-(void) build_business_requestWithPackage:(NSMutableDictionary*) businessData {
    [self setObject:businessData forKey:@"b"];
}
@end
