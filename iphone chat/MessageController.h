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

@interface Message : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) NSString* titleName;
@property (retain, nonatomic) IBOutlet UIView *subView;
@property (retain) NSMutableArray *messages;
@property (retain, nonatomic) IBOutlet UITextView *newMessage;
@property (retain, nonatomic) IBOutlet UIImageView *textBackGround;
- (IBAction)Send:(id)sender;
@end
