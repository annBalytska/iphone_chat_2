//
//  messageCell.m
//  iphone chat
//
//  Created by Anna Balytska on 3/18/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "messageCell.h"

@implementation messageCell

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
    [_textMessage release];
    [super dealloc];
}
@end
