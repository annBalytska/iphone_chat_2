//
//  contactController.m
//  iphone chat
//
//  Created by Anna Balytska on 3/19/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "contactController.h"

@interface contactController ()
@property NSString *category;
@property NSArray *pickerData;
@property NSString * contName;
@end

@implementation contactController

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
    [array autorelease];
    _category=[array objectAtIndex:0];
    
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc] init];
    backButton.title = @"Back";
    backButton.action = @selector(actionBackButton:);
    backButton.target = self;
    self.navigationItem.leftBarButtonItem = backButton;
    [backButton autorelease];
    self.title = @"New contact";
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

- (void)showAlertBox {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@""
                                                     message:@"Go back?"
                                                    delegate:self
                                           cancelButtonTitle:@"No"
                                           otherButtonTitles:@"Yes", nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex != [alertView cancelButtonIndex]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)actionBackButton:(id)sender {
    if (![_contactName.text isEqualToString:@""]) {
        [self showAlertBox];
    }
    else
        [self.navigationController popViewControllerAnimated:YES];
}

- (void)dealloc {
    [_contactName release];
    [_picker release];
//    [_contacts release];
    [super dealloc];
}
- (IBAction)AddContact:(id)sender {
    _contName=_contactName.text;
    if (![_contactName.text isEqualToString:@""]) {
    //    [(TableViewController*)[self.navigationController.viewControllers objectAtIndex:1]addObject:_category addKey:_contName];
        NSManagedObjectContext *context = [[(TableViewController*)[self.navigationController.viewControllers objectAtIndex:1] database]managedObjectContext];
        Contact *contact = (Contact *)[NSEntityDescription insertNewObjectForEntityForName:@"Contact" inManagedObjectContext:context];
        contact.name=_contactName.text;
        contact.category=_category;
        
    }
    _contactName.text=@"";
}

@end
