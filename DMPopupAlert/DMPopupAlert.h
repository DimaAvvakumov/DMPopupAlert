//
//  DMPopupAlert.h
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "DMPopupItem.h"

@interface DMPopupAlert : NSObject

- (DMPopupAlert*)initWithView:(UIView*)view;

+ (void)show:(DMPopupItem *)item inView:(UIView *)view;

+ (void)setCalculateHeightBlock:(DMPopupAlertHeightBlock)block;

#pragma mark - Appereance

+ (void)setColor:(UIColor *)value forParam:(NSString *)paramName;
+ (void)setColor:(UIColor *)value forParam:(NSString *)paramName forType:(DMPopupType) popupType;

+ (void)setFont:(UIFont *)value forParam:(NSString *)paramName;
+ (void)setFont:(UIFont *)value forParam:(NSString *)paramName forType:(DMPopupType) popupType;


@end
