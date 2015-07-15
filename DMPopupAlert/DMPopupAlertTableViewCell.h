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

typedef void (^DMPopupAlertTableViewCellCloseBlock)(id sender);

@interface DMPopupAlertTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@property (copy, nonatomic) DMPopupAlertTableViewCellCloseBlock closeBlock;

- (void)updateCellWithModel:(DMPopupItem *)model;

@end
