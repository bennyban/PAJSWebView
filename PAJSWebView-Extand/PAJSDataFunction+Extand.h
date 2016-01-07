//
//  PAJSDataFunction+Extand.h
//  PAFFDemo
//
//  Created by 班磊 on 16/1/7.
//  Copyright © 2016年 班磊. All rights reserved.
//

#import "PAJSDataFunction.h"

@interface PAJSDataFunction (Extand)

- (NSString*)executeWithExtendParams:(NSArray*)params err:(ErrorType)errType;

- (NSString*)executeWithJsonParams:(NSArray *)params err:(ErrorType)errType;

@end
