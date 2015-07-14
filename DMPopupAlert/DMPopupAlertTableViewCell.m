//
//  DMPopupAlertTableViewCell.m
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import "DMPopupAlertTableViewCell.h"

@interface DMPopupAlertTableViewCell()

@end

@implementation DMPopupAlertTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)updateCellWithModel:(DMPopupItem *)model {
    self.titleLabel.text = model.title;
    self.bodyLabel.text = model.body;
}

- (IBAction)closeAction:(UIButton*)sender {
    if (_closeBlock) {
        _closeBlock(sender);
    }
}

@end
