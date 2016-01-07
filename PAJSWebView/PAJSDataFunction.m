//
//  PAJSDataFunction.m
//  PAWebview
//
//  Created by 班磊 on 16/1/7.
//  Copyright © 2016年 bennyban. All rights reserved.
//

#import "PAJSDataFunction.h"

@interface PAJSDataFunction ()

@end

@implementation PAJSDataFunction

@synthesize funcID, webView, removeAfterExecute;

- (id) initWithWebView:(PAJSWebView *)_webView{
    self = [super init];
    if (self) {
        self.webView = _webView;
    }
    return self;
}

- (NSString*) execute{
    return [self executeWithParams:nil];
}

- (NSString*) executeWithParam: (NSString*) param{
    NSMutableArray* params = [[NSMutableArray alloc] initWithObjects:param, nil];
    return [self executeWithParams:params];
}

- (NSString*) executeWithParams: (NSArray*) params{
    NSMutableString* injection = [[NSMutableString alloc] init];
    
    [injection appendFormat:@"PAJS.invokeCallback(\"%@\", %@", self.funcID, self.removeAfterExecute ? @"true" : @"false"];
    
    if (params && !(params.count == 1 && [params[0] isEqualToString:@""])){
        for (int i = 0, l = (int)params.count; i < l; i++){
            NSString* arg = [params objectAtIndex:i];
            [injection appendFormat:@",'%@'", arg];
        }
    }else
    {
        [injection appendFormat:@",%@",@"null"];
    }
    
    [injection appendString:@");"];
    
    if (self.webView){
        return [self.webView stringByEvaluatingJavaScriptFromString:injection];
    }else{
        return nil;
    }
}

@end
