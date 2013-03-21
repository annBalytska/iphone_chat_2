//
//  TableViewController.h
//  iphone chat
//
//  Created by Anna Balytska on 3/13/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewSection.h"
#import "HistoryOfMessages.h"
#import "Cell.h"
#import "MessageController.h"
#import "contactController.h"

@interface TableViewController : UITableViewController
@property (assign) HistoryOfMessages* his;
@property (assign) NSMutableDictionary* people;
- (void)addObject:(NSString*)object addKey:(NSString*)key;
@end
