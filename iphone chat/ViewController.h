//
//  ViewController.h
//  iphone chat
//
//  Created by Anna Balytska on 2/21/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableString *email;
    NSMutableString *password;
    BOOL login;
}

@property (retain, nonatomic) IBOutlet UILabel *display;
@property (retain, nonatomic) IBOutlet UITextField *emailTextField;
@property (retain, nonatomic) IBOutlet UITextField *passwordTextField;
@property (retain, nonatomic) IBOutlet UIButton *button;
@property (retain, nonatomic) IBOutlet UIView *mySubview;

- (void)showAlertBox;

@end

