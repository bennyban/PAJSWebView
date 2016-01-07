//
//  PAJSWebView.h
//  PAFFDemo
//
//  Created by 班磊 on 16/1/7.
//  Copyright © 2016年 班磊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAJSWebViewProxyDelegate.h"

@interface PAJSWebView : UIWebView

@property (nonatomic, strong) PAJSWebViewProxyDelegate *proxyDelegate;  /**< 代理协议 */

/*!
 *  @brief 初始化JS
 */
- (void)initPAJS;

/*!
 *  @brief 添加对象于JS
 *
 *  @param interface 实体对象
 *  @param name      JS的类型
 */
- (void)addJavascriptInterfaces:(NSObject*) interface WithName:(NSString*) name;

@end
