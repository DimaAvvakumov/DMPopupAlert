//
//  DMPopupAlertTableViewCell.h
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DMPopupItem.h"

#define DMPopupAlertTableViewCell_ID @"DMPopupAlertTableViewCell_ID"

@interface DMPopupAlertTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

- (void)updateCellWithModel:(DMPopupItem *)model;

@end
