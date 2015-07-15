//
//  ViewController.m
//  testPopup
//
//  Created by Avvakumov Dmitry on 14.07.15.
//  Copyright (c) 2015 Avvakumov Dmitry. All rights reserved.
//

#import "ViewController.h"

#import "DMPopupAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)errorAction:(id)sender {
    NSDate *date = [NSDate date];
    
    DMPopupItem *item = [DMPopupItem popupItemWithTitle:@"Test" andBody:[date description]];
    item.type = DMPopupTypeError;
    
    [DMPopupAlert show:item inView:self.view];
}

- (IBAction)warningAction:(id)sender {
    NSDate *date = [NSDate date];
    
    DMPopupItem *item = [DMPopupItem popupItemWithTitle:@"Test" andBody:[date description]];
    item.type = DMPopupTypeWarning;
    
    [DMPopupAlert show:item inView:self.view];
}

- (IBAction)successAction:(id)sender {
    NSDate *date = [NSDate date];
    
    DMPopupItem *item = [DMPopupItem popupItemWithTitle:@"Test" andBody:[date description]];
    item.type = DMPopupTypeInfo;
    
    [DMPopupAlert show:item inView:self.view];
}

@end
