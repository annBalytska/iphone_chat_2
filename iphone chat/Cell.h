//
//  Cell.h
//  iphone chat
//
//  Created by Anna Balytska on 3/14/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UITableViewCell
@property (retain, nonatomic) IBOutlet UIImageView *img;

@property (retain, nonatomic) IBOutlet UILabel *nameOfContact;

@property (retain, nonatomic) IBOutlet UILabel *group;

@property (retain, nonatomic) IBOutlet UIImageView *backGround;


@end
