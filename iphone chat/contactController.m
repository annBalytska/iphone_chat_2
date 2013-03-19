//
//  contactController.m
//  iphone chat
//
//  Created by Anna Balytska on 3/19/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "contactController.h"

@interface contactController ()
@property NSString *name;
@property NSString *category;
@property NSArray *pickerData;
@end

@implementation contactController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationMethod:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationMethodHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    NSArray *array = [[NSArray alloc] initWithObjects:@"family", @"job", @"friends",@"neighbours",@"other", nil];
    _pickerData=[[NSArray alloc]initWithArray:array];
    [array release];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_pickerData count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_pickerData objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _category=[_pickerData objectAtIndex:row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_contactName release];
    [_picker release];
    [super dealloc];
}
- (IBAction)AddContact:(id)sender {
    _name=_contactName.text;
}

@end
