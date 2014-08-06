//
//  Request.h
//  WeWillSucceed
//
//  Created by junwen.wu on 14-8-6.
//  Copyright (c) 2014年 MakeItFun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Request : NSObject

#define Callback \
handleSucceed:(void(^) (NSMutableDictionary* business)) handleSucceed \
handleFailure:(void(^) (NSMutableDictionary* status)) handleFailure

+(void) execute:(NSMutableURLRequest*) request
    requestData:(NSMutableDictionary*) requestData
    Callback;

@end
