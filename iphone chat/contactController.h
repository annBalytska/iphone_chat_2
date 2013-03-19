//
//  contactController.h
//  iphone chat
//
//  Created by Anna Balytska on 3/19/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "ViewController.h"

@interface contactController : ViewController

@property (retain, nonatomic) IBOutlet UITextField *contactName;
- (IBAction)AddContact:(id)sender;

@property (retain, nonatomic) IBOutlet UIPickerView *picker;

@end
