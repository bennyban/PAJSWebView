//
//  PAJSDataFunction+Extand.m
//  PAFFDemo
//
//  Created by 班磊 on 16/1/7.
//  Copyright © 2016年 班磊. All rights reserved.
//

#import "PAJSDataFunction+Extand.h"

@implementation PAJSDataFunction (Extand)

- (NSString*)executeWithExtendParams:(NSArray*)params err:(ErrorType)errType
{
    NSMutableString* injection = [[NSMutableString alloc] init];
    
    [injection appendFormat:@"%@('%@'",def_JSWebView_Callback, self.funcID];
    //    // 增加 ErrorType
    NSString* errString = (errType == Err_None) ?@"null":[ErrorTypeManage returnErrorName:errType];
    [injection appendFormat:@",%@",errString];
    
    
    if (params && !(params.count == 1 && [params[0] isEqualToString:@""])){
        for (int i = 0, l = (int)params.count; i < l; i++){
            NSString* arg = [params objectAtIndex:i];
            [injection appendFormat:@",'%@'", arg];
        }
    }else
    {
        [injection appendFormat:@",%@",@"null"];
    }
    
    [injection appendString:@")"];
    
    NSLog(@"function-string:%@",injection);
    //    NSString *function = [injection transformationSpecialCharacters];
    
    if (self.webView){
        return [self.webView stringByEvaluatingJavaScriptFromString:injection];
    }else{
        return nil;
    }
}

- (NSString*)executeWithJsonParams:(NSArray *)params err:(ErrorType)errType
{
    NSMutableString* injection = [[NSMutableString alloc] init];
    
    [injection appendFormat:@"%@('%@'",def_JSWebView_Callback, self.funcID];
    
    // 增加 ErrorType
    NSString* errString = (errType == Err_None) ?@"null":[ErrorTypeManage returnErrorName:errType];
    [injection appendFormat:@",%@",errString];
    
    if (params && !(params.count == 1 && [params[0] isEqualToString:@""])){
        for (int i = 0; i < params.count; i++)
        {
            id arg = [params objectAtIndex:i];
            if ([arg isKindOfClass:[NSDictionary class]] || [arg isKindOfClass:[NSArray class]])
            {
                arg = [arg JSONString];
                [injection appendFormat:@", %@",arg];
            }
            else
            {
                [injection appendFormat:@", %@", arg];
            }
        }
    }else
    {
        [injection appendFormat:@",%@",@"null"];
    }
    
    [injection appendString:@")"];
    NSLog(@"function-json:%@",injection);
    
    if (self.webView){
        
        return [self.webView stringByEvaluatingJavaScriptFromString:injection];
    }else{
        
        return nil;
    }
}

@end
