//
//  TableViewController.h
//  iphone chat
//
//  Created by Anna Balytska on 3/13/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewSection.h"
#import "Cell.h"
#import "MessageController.h"
#import "contactController.h"
#import "CoreDataTableViewController.h"

@interface TableViewController : CoreDataTableViewController
@property (nonatomic, strong) UIManagedDocument *database;
@end
