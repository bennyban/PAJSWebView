//
//  PAJSWebView.m
//  PAFFDemo
//
//  Created by 班磊 on 16/1/7.
//  Copyright © 2016年 班磊. All rights reserved.
//

#import "PAJSWebView.h"

@interface PAJSWebView ()

@end

@implementation PAJSWebView

- (id)init
{
    self = [super init];
    if (self) {
        [self initPAJS];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initPAJS];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initPAJS];
    }
    return self;
}

- (void)initPAJS
{
    self.proxyDelegate = [PAJSWebViewProxyDelegate new];
    self.delegate = self.proxyDelegate;
}

- (void)setDelegate:(id<UIWebViewDelegate>)delegate
{
    if (delegate != self.proxyDelegate) {
        delegate = self.proxyDelegate.realDelegate;
    } else
    {
        [super setDelegate:delegate];
    }
}

- (void)addJavascriptInterfaces:(NSObject*) interface WithName:(NSString*) name{
    [self.proxyDelegate addJavascriptInterfaces:interface WithName:name];
}

@end
