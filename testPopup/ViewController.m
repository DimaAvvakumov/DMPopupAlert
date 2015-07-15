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
    
    DMPopupItem *item = [DMPopupItem popupItemWithTitle:@"Ошибка" body:@"In the Block-specific code above, you might wonder what the “stop” variabl is. This is simply a variable that can be set to YES from within the block to stop further processing. This parameter is specified as part of the block to be used by the enumerateObjectsUsingBlock method. \nThe above is a pretty trivial example and it might be admittedly difficult to see the advantage of Blocks in this case. But there are two things I want to point out about the Blocks approach:" type:DMPopupTypeError duration:10.0];
    
    [DMPopupAlert show:item inView:self.view];
}

- (IBAction)warningAction:(id)sender {
    NSDate *date = [NSDate date];
    
    DMPopupItem *item = [DMPopupItem popupItemWithTitle:@"Внимание!" body:[date description]];
    item.type = DMPopupTypeWarning;
    
    [DMPopupAlert show:item inView:self.view];
}

- (IBAction)successAction:(id)sender {
    NSDate *date = [NSDate date];
    
    DMPopupItem *item = [DMPopupItem popupItemWithTitle:@"Вы авторизовались" body:[date description]];
    item.type = DMPopupTypeSuccess;
    
    [DMPopupAlert show:item inView:self.view];
}

@end
