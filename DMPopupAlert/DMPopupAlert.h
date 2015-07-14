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

@end
