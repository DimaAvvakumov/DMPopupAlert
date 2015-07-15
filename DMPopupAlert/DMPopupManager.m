//
//  DMPopupManager.m
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import "DMPopupManager.h"

#define DMPopupManager_FreeType -1

@interface DMPopupManager()

@property (strong, nonatomic) NSMutableDictionary *sharedPops;
@property (strong, nonatomic) NSMutableDictionary *sharedAppereance;

@end

@implementation DMPopupManager

#pragma mark - init

- (id)init{
    self = [super init];
    if (!self) return nil;
    
    self.sharedPops = [NSMutableDictionary dictionaryWithCapacity:10];
    self.sharedAppereance = [NSMutableDictionary dictionaryWithCapacity:10];
    
    return self;
}

#pragma mark - Shared instance

+(DMPopupManager*)sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (DMPopupAlert *)popupAlertForView:(UIView*)view {
    NSString *viewKey = [NSString stringWithFormat:@"%p",view];
    
    // DMPopupAlert
    DMPopupAlert *popupAlert = [self.sharedPops objectForKey:viewKey];
    
    if (popupAlert == nil) {
        // create
        popupAlert = [[DMPopupAlert alloc] initWithView:view];
        
        // store
        [self.sharedPops setObject:popupAlert forKey:viewKey];
    }
    
    return popupAlert;
}

#pragma mark - Appereance

+ (NSString *)keyForParam:(NSString *)paramName andType:(DMPopupType)popupType {
    return [NSString stringWithFormat:@"%@-%d", paramName, (int)popupType];
}

+ (BOOL)paramCanBeColor:(NSString *)paramName {
    if ([paramName isEqualToString:DMPopupCell_BackgroundColor]) return YES;
    if ([paramName isEqualToString:DMPopupCell_TitleColor]) return YES;
    if ([paramName isEqualToString:DMPopupCell_BodyColor]) return YES;
        
    return NO;
}

+ (BOOL)paramCanBeFont:(NSString *)paramName {
    if ([paramName isEqualToString:DMPopupCell_TitleFont]) return YES;
    if ([paramName isEqualToString:DMPopupCell_BodyFont]) return YES;
    
    return NO;
}

+ (void)setColor:(UIColor *)value forParam:(NSString *)paramName {
    [self setColor:value forParam:paramName forType:DMPopupManager_FreeType];
}

+ (void)setColor:(UIColor *)value forParam:(NSString *)paramName forType:(DMPopupType) popupType {
    // check value for proper type
    if (value == nil) return;
    if (![value isKindOfClass:[UIColor class]]) return;
    
    // check param name for proper value type
    if ([self paramCanBeColor:paramName] == NO) return;
    
    NSString *key;
    if ((int)popupType == DMPopupManager_FreeType) {
        key = paramName;
    } else {
        key = [self keyForParam:paramName andType:popupType];
    }
    
    DMPopupManager *sharedInstance = [DMPopupManager sharedInstance];
    [sharedInstance.sharedAppereance setObject:value forKey:key];
}

+ (UIColor*)colorForParam:(NSString *)paramName {
    return [self colorForParam:paramName forType:DMPopupManager_FreeType];
}

+ (UIColor*)colorForParam:(NSString *)paramName forType:(DMPopupType) popupType {
    DMPopupManager *sharedInstance = [DMPopupManager sharedInstance];
    
    if ((int)popupType != DMPopupManager_FreeType) {
        NSString *key = [self keyForParam:paramName andType:popupType];
        
        UIColor *value = [sharedInstance.sharedAppereance objectForKey:key];
        if (value && [value isKindOfClass:[UIColor class]]) return value;
    }
    
    UIColor *value = [sharedInstance.sharedAppereance objectForKey:paramName];
    if (value && [value isKindOfClass:[UIColor class]]) return value;
    
    return nil;
}

+ (void)setFont:(UIFont *)value forParam:(NSString *)paramName {
    return [self setFont:value forParam:paramName forType:DMPopupManager_FreeType];
}

+ (void)setFont:(UIFont *)value forParam:(NSString *)paramName forType:(DMPopupType) popupType {
    // check value for proper type
    if (value == nil) return;
    if (![value isKindOfClass:[UIFont class]]) return;
    
    // check param name for proper value type
    if ([self paramCanBeFont:paramName] == NO) return;
    
    NSString *key;
    if ((int)popupType == DMPopupManager_FreeType) {
        key = paramName;
    } else {
        key = [self keyForParam:paramName andType:popupType];
    }
    
    DMPopupManager *sharedInstance = [DMPopupManager sharedInstance];
    [sharedInstance.sharedAppereance setObject:value forKey:key];
}

+ (UIFont*)fontForParam:(NSString *)paramName {
    return [self fontForParam:paramName forType:DMPopupManager_FreeType];
}

+ (UIFont*)fontForParam:(NSString *)paramName forType:(DMPopupType) popupType {
    DMPopupManager *sharedInstance = [DMPopupManager sharedInstance];
    
    if ((int)popupType != DMPopupManager_FreeType) {
        NSString *key = [self keyForParam:paramName andType:popupType];
        
        UIFont *value = [sharedInstance.sharedAppereance objectForKey:key];
        if (value && [value isKindOfClass:[UIFont class]]) return value;
    }
    
    UIFont *value = [sharedInstance.sharedAppereance objectForKey:paramName];
    if (value && [value isKindOfClass:[UIFont class]]) return value;
    
    return nil;
}


@end
