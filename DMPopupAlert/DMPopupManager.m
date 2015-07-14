//
//  DMPopupManager.m
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import "DMPopupManager.h"

@interface DMPopupManager()

@property (strong, nonatomic) NSMutableDictionary *sharedPops;

@end

@implementation DMPopupManager

#pragma mark - init

- (id)init{
    self = [super init];
    if (!self) return nil;
    
    self.sharedPops = [NSMutableDictionary dictionaryWithCapacity:10];
    
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

@end
