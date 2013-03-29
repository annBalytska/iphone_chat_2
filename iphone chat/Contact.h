//
//  Contact.h
//  iphone chat
//
//  Created by Anna Balytska on 3/27/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class MessageHistory;

@interface Contact : NSManagedObject

@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *sendMessage;
@end

@interface Contact (CoreDataGeneratedAccessors)

- (void)addSendMessageObject:(MessageHistory *)value;
- (void)removeSendMessageObject:(MessageHistory *)value;
- (void)addSendMessage:(NSSet *)values;
- (void)removeSendMessage:(NSSet *)values;

@end
