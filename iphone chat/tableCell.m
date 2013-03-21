//
//  tableCell.m
//  iphone chat
//
//  Created by Anna Balytska on 3/21/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "tableCell.h"

@implementation tableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_name release];
    [_message release];
    [super dealloc];
}
@end
