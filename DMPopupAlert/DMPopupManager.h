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

+(DMPopupManager *) sharedInstance;

- (DMPopupAlert *)popupAlertForView:(UIView*)view;

@end
