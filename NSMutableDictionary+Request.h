//
//  NSMutableDictionary+Request.h
//  Horde
//
//  Created by junwen.wu on 14-7-21.
//  Copyright (c) 2014年 Bwl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary(Request)

-(void) build_common_requestWithDeviceID:(NSString*)deviceID
                            andChannelID:(NSString*)cid
                            andVersionID:(NSString*)vid;

-(void) build_business_requestWithPackage:(NSMutableDictionary*) businessData;
@end
