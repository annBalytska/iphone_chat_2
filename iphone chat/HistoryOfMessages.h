//
//  HistoryOfMessages.h
//  iphone chat
//
//  Created by Anna Balytska on 3/18/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HistoryOfMessages : NSObject
@property (assign) NSMutableDictionary *history;

-(NSMutableArray*)messagesForKey:(NSString*)key;

@end
