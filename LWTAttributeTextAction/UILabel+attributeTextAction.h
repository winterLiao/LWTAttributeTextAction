//
//  UILabel+attributeTextAction.h
//  LWTAttributeTextAction
//
//  Created by liaowentao on 17/6/19.
//  Copyright © 2017年 Haochuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextModel : NSObject

@property (nonatomic, copy) NSString *str;

@property (nonatomic, assign) NSRange range;

@end


@interface UILabel (attributeTextAction)


/**
 给文本添加点击事件（使用字符串标记）

 @param strings 需要添加点击事件的字符串数组
 @param tapClick 点击的回调block
 */
- (void)addAttributeActionWithStrings:(NSArray *)strings
                                 tapTargetAction:(void (^) (NSString *string ,                                                               NSRange range ,
                                    NSInteger index))tapClick;

/**
 给文本添加点击事件（使用范围标记）

 @param tapRange 需要添加点击事件的范围数组
 @param tapClick 点击的回调block
 */
- (void)addAttributeActionWithRange:(NSArray*)tapRange
                         tapTargetAction:(void (^)
                                          (NSString *string , NSRange range , NSInteger index))tapClick;


@end
