//
//  PAJSDataFunction.h
//  PAWebview
//
//  Created by 班磊 on 16/1/7.
//  Copyright © 2016年 bennyban. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAJSWebView.h"

@interface PAJSDataFunction : NSObject

@property (nonatomic, strong) NSString   *funcID;
@property (nonatomic, strong) PAJSWebView  *webView;
@property (nonatomic, assign) BOOL        removeAfterExecute;

- (id)initWithWebView:(PAJSWebView *) _webView;

- (NSString*)execute;

- (NSString*)executeWithParam: (NSString*) param;

@end
