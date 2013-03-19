//
//  HistoryOfMessages.m
//  iphone chat
//
//  Created by Anna Balytska on 3/18/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "HistoryOfMessages.h"


@interface HistoryOfMessages ()
@end

@implementation HistoryOfMessages


- (id)init
{
    self = [super init];
    if (self) {
        self.history=[[NSMutableDictionary alloc]init];
    }
    return self;
}


-(NSMutableArray*)messagesForKey:(NSString*)key
{
    if (![_history objectForKey:key]) {
        NSMutableArray *messages=[[[NSMutableArray alloc]init]autorelease];
        [self.history setObject:messages forKey:key];
    }
    return [_history objectForKey:key];
}

- (void)dealloc
{
    [_history release];
    [super dealloc];
}
@end
