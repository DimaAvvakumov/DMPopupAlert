//
//  DMPopupManager.h
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "DMPopupAlert.h"

@interface DMPopupManager : NSObject

@property (copy, nonatomic) DMPopupAlertHeightBlock heightBlock;

+(DMPopupManager *) sharedInstance;

- (DMPopupAlert *)popupAlertForView:(UIView*)view;

#pragma mark - Appereance

+ (void)setColor:(UIColor *)value forParam:(NSString *)paramName;
+ (void)setColor:(UIColor *)value forParam:(NSString *)paramName forType:(DMPopupType) popupType;

+ (UIColor*)colorForParam:(NSString *)paramName;
+ (UIColor*)colorForParam:(NSString *)paramName forType:(DMPopupType) popupType;;

+ (void)setFont:(UIFont *)value forParam:(NSString *)paramName;
+ (void)setFont:(UIFont *)value forParam:(NSString *)paramName forType:(DMPopupType) popupType;

+ (UIFont*)fontForParam:(NSString *)paramName;
+ (UIFont*)fontForParam:(NSString *)paramName forType:(DMPopupType) popupType;;

@end
