//
//  Message.h
//  iphone chat
//
//  Created by Anna Balytska on 3/15/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"
#import "HistoryOfMessages.h"
#import "tableCell.h"
#import "CoreDataTableViewController.h"
#import "Contact.h"

@interface Message : CoreDataTableViewController<UITextViewDelegate>
@property (retain, nonatomic) NSString* titleName;
@property (retain, nonatomic) IBOutlet UIView *subView;
//@property (retain) NSMutableArray *messages;
@property (retain, nonatomic) IBOutlet UIImageView *textBackGround;
//- (IBAction)SendMessage:(id)sender;
@property (retain, nonatomic) IBOutlet UIImageView *newMessageImage;
@property (retain, nonatomic) IBOutlet UITextView *newMes;
@property (nonatomic, strong) Contact *contact;

@end
