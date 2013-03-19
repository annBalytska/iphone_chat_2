//
//  ViewController.m
//  iphone chat
//
//  Created by Anna Balytska on 2/21/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"

@interface ViewController ()
@property float f;
@end

@implementation ViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:NO];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    email = [[NSMutableString alloc] init];
    password = [[NSMutableString alloc] init];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationMethod:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationMethodHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [email release];
    [password release];
    // Dispose of any resources that can be recreated.
}

- (void)myNotificationMethod:(NSNotification*)notification
{
    NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue]  ;
    keyboardFrameBeginRect = [[_mySubview superview] convertRect:keyboardFrameBeginRect fromView:nil];
    
    NSTimeInterval animationDuration;
    [[keyboardInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    if(keyboardFrameBeginRect.origin.y < _mySubview.frame.origin.y+_mySubview.frame.size.height){
        _f = _mySubview.frame.origin.y+_mySubview.frame.size.height-keyboardFrameBeginRect.origin.y ;
        CGRect frame =_mySubview.frame;
        frame.origin.y-=_f;
        [UIView beginAnimations:@"moveSubview" context:nil];
        [UIView setAnimationDuration:animationDuration];
        _mySubview.frame=frame;
        [UIView commitAnimations];
    }
}


- (void)myNotificationMethodHide:(NSNotification*)notification
{
    NSDictionary* keyboardInfo = [notification userInfo];
    NSTimeInterval animationDuration;
    [[keyboardInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    CGRect frame =_mySubview.frame;
    frame.origin.y+=_f;
    [UIView beginAnimations:@"moveSubview" context:nil];
    [UIView setAnimationDuration:animationDuration];
    _mySubview.frame=frame;
    [UIView commitAnimations];
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
   // [email setString:@"email"];
  //  [password setString:@"1111"];
  //  if([_emailTextField.text isEqualToString:email]&&[_passwordTextField.text isEqualToString:password])
        return YES;
//    else
//    {
//        [self showAlertBox];
//        return NO;
//    }
}

- (void)showAlertBox {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@""
                                                     message:@"Wrong email or password"
                                                    delegate:nil
                                           cancelButtonTitle:@"cancel"
                                           otherButtonTitles:nil];
    [alert show];
}


- (void)dealloc {
   [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_emailTextField release];
    [_passwordTextField release];
    [_button release];
    [_mySubview release];
    [super dealloc];
}


@end





