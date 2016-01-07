//
//  PAJSWebView+Extand.h
//  PAFFDemo
//
//  Created by 班磊 on 16/1/7.
//  Copyright © 2016年 班磊. All rights reserved.
//

#import "PAJSWebView.h"

@interface PAJSWebView (Extand)

/*!
 *  @brief  字符回调
 *
 *  @param callbackFun 回调方法
 *  @param params      回调参数
 */
- (void)callBack:(NSString *)callbackFun params:(NSArray *)params err:(ErrorType)errtype;

/*!
 *  @brief  JSON回调
 *
 *  @param callbackFun 回调方法
 *  @param params      回调参数
 */
-(void)callBack_Json:(NSString *)callbackFun params:(NSArray *)params err:(ErrorType)errtype;

/*!
 *  @brief  回调OnForward
 *
 *  @param url   页面URL
 *  @param title 标题
 *  @param data  数据Data
 */
- (void)nativeCallJSOnforward:(NSString *)url :(NSString *)title :(NSString *)data;

/*!
 *  @brief  回调OnBack
 *
 *  @param url  页面URL
 *  @param data 数据Data
 */
- (void)nativeCallJSOnback:(NSString *)url :(NSString *)data;

/*!
 *  @brief  回调OnChange
 *
 *  @param moduleId 当前ModuleID
 */
- (void)nativeCallJSOnChange:(NSString *)moduleId;

/*!
 *  @brief  回调JS方法
 *
 *  @param function JS方法
 */
- (void)nativeCallJSFunction:(NSString *)function;

@end
