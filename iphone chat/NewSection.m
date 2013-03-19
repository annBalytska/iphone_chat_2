//
//  NewSection.m
//  iphone chat
//
//  Created by Anna Balytska on 3/13/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "NewSection.h"

@implementation NewSection
- (id)init
{
    self = [super init];
    if (self) {
        [self setNumberOfContacts:0];
        [self setNameOfSection:@""];
    }
    return self;
}
@end
