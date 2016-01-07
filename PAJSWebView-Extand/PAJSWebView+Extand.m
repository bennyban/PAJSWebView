//
//  PAJSWebView+Extand.m
//  PAFFDemo
//
//  Created by 班磊 on 16/1/7.
//  Copyright © 2016年 班磊. All rights reserved.
//

#import "PAJSWebView+Extand.h"
#import "PAJSDataFunction.h"
#import "PAJSDataFunction+Extand.h"

@implementation PAJSWebView (Extand)

- (void)callBack:(NSString *)callbackFun params:(NSArray *)params err:(ErrorType)errtype
{
    PAJSDataFunction * jsFunction = [[PAJSDataFunction alloc] init];
    jsFunction.funcID = callbackFun;
    jsFunction.webView = self;
    
    [jsFunction executeWithExtendParams:params err:errtype];
}

-(void)callBack_Json:(NSString *)callbackFun params:(NSArray *)params err:(ErrorType)errtype
{
    PAJSDataFunction *jsFunction = [[PAJSDataFunction alloc] init];
    jsFunction.funcID = callbackFun;
    jsFunction.webView = self;
    [jsFunction executeWithJsonParams:params err:errtype];
    
}

- (void)nativeCallJSOnforward:(NSString *)url :(NSString *)title :(NSString *)data
{
    if ([title rangeOfString:@"\n"].length>0) {
        title = [title stringByReplacingOccurrencesOfString:@"\n" withString:@"\\\n"];
    }
    
    NSString *function = [NSString stringWithFormat:def_JSWebView_OnForward,url,title,data];
    
    NSLog(@"nativeCallJSOnforward:\n%@",function);
    
    [self stringByEvaluatingJavaScriptFromString:function];
}

- (void)nativeCallJSOnback:(NSString *)url :(NSString *)data
{
    NSString *function = [NSString stringWithFormat:def_JSWebView_OnBack,url,data];
    
    NSLog(@"nativeCallJSOnback:\n%@",function);
    
    [self stringByEvaluatingJavaScriptFromString:function];
}


- (void)nativeCallJSOnChange:(NSString *)moduleId
{
    NSString *function = [NSString stringWithFormat:def_JSWebView_OnChange,moduleId];
    NSLog(@"nativeCallJSOnChange:\n%@",function);
    [self stringByEvaluatingJavaScriptFromString:function];
}

- (void)nativeCallJSOnClosePage:(NSArray *)jsonArr
{
    NSString *jsonStr = [jsonArr JSONString];
    NSString *function = [NSString stringWithFormat:def_JSWebView_OnClosePage,jsonStr];
    NSLog(@"def_JSWebView_OnClosePage:\n%@",function);
    [self stringByEvaluatingJavaScriptFromString:function];
}

- (void)nativeCallJSFunction:(NSString *)function
{
    if (function) {
        [self stringByEvaluatingJavaScriptFromString:function];
    }
}

@end
