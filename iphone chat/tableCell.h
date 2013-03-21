//
//  tableCell.h
//  iphone chat
//
//  Created by Anna Balytska on 3/21/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableCell : UITableViewCell
@property (retain, nonatomic) IBOutlet UILabel *name;

@property (retain, nonatomic) IBOutlet UILabel *message;
@property (retain, nonatomic) IBOutlet UIImageView *backGround;

@end
