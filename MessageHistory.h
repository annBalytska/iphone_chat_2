//
//  MessageHistory.h
//  iphone chat
//
//  Created by Anna Balytska on 3/27/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Contact;

@interface MessageHistory : NSManagedObject

@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) Contact *whoSend;

@end
