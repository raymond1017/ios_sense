//
//  Request.m
//  WeWillSucceed
//
//  Created by junwen.wu on 14-8-6.
//  Copyright (c) 2014年 MakeItFun. All rights reserved.
//

#import "Request.h"
#import "NSMutableDictionary+Response.h"
#import "NSMutableDictionary+Request.h"
#import "NSMutableDictionary+Status.h"

@implementation Request


+ (NSString*) makeHttpPost:(NSMutableDictionary*)dict {
    NSMutableString* ret = [NSMutableString new];
    for (NSString* keys in dict.keyEnumerator) {
        [ret appendFormat:@"%@=%@&", keys, [dict objectForKey:keys]];
    }
    
    return ret;
}

+(void) execute:(NSMutableURLRequest*) request
    requestData:(NSMutableDictionary*) requestData
    Callback{
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"content-type"];//请求头
    [request setHTTPBody:[[self makeHttpPost:requestData] dataUsingEncoding:NSStringEncodingConversionAllowLossy]];
    //    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:requestData options:NSJSONWritingPrettyPrinted error:nil]];
    NSError* error = [[NSError alloc] init];
    [request setTimeoutInterval:5.0];
    NSData* resp = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    NSInteger errorCode = [error code];
    
    if(errorCode != 0){
        
        NSLog(@"Http Request Fail Request: %@ HttpCode: %ld Domain: %@", [request.URL absoluteString], (long)errorCode, [error domain]);
        handleFailure(nil);
        return;
    }
    
    NSMutableDictionary* responseData = [NSJSONSerialization JSONObjectWithData:resp options:NSJSONReadingMutableLeaves error:nil];
    
    NSNumber* code = [NSNumber numberWithLong:100500];
    NSString* desc = @"服务器异常返回";
    do{
        NSDictionary* status = [responseData response_status];
        if(status == nil){
            break;
        }
        
        code = [status objectForKey:@"code"];
        if(code == nil){
            break;
        }
        
        desc = [status objectForKey:@"desc"];
        
        if([code integerValue] != 200){
            break;
        }
        
        handleSucceed([responseData response_business]);
        return;
    }while (false);
    
    NSLog(@"Http Request Fail Request: %@ RespCode: %@ Desc: %@", [request.URL absoluteString], code, desc);
    
    handleFailure([responseData response_status]);
}
@end
