//
//  PAJSWebViewProxyDelegate.h
//  PAWebview
//
//  Created by 班磊 on 16/1/6.
//  Copyright © 2016年 bennyban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface PAJSWebViewProxyDelegate : NSObject<UIWebViewDelegate>

@property (nonatomic, weak)   id <UIWebViewDelegate>realDelegate;

/*!
 *  @brief 注入JS对象
 *
 *  @param interface 对象实体类
 *  @param name      对象的名称
 */
- (void) addJavascriptInterfaces:(NSObject*) interface WithName:(NSString*) name;

@end
