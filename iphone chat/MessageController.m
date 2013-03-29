//
//  Message.m
//  iphone chat
//
//  Created by Anna Balytska on 3/15/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "MessageController.h"
#import "MessageHistory.h"

@interface Message ()
@property float f;

@end

@implementation Message
@synthesize contact = _contact;

- (void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationMethod:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(myNotificationMethodHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
//    self.title = _titleName;
    [super viewDidLoad];
    UITapGestureRecognizer *tappedGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    [self.tableView addGestureRecognizer:tappedGesture];
    [tappedGesture autorelease];
    _newMessageImage.image= [UIImage imageNamed:@"rect7824.png"];
    _newMes.delegate=self;
}


- (void)textViewDidChange:(UITextView *)textView{
    CGRect frame;
    float fl;
    frame = self.newMes.frame;
    frame.size.height = [self.newMes contentSize].height;
    fl=frame.size.height-self.newMes.frame.size.height;
    self.newMes.frame = frame;
    CGRect frameSubView;
    frameSubView = self.subView.frame;
    frameSubView.size.height+=fl;
    frameSubView.origin.y-=fl;
    _subView.frame=frameSubView;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSString *newString = [self.newMes.text stringByReplacingCharactersInRange:range withString:text];
    return !([newString length] > 57);
}

- (void)myNotificationMethod:(NSNotification*)notification
{
    NSDictionary* keyboardInfo = [notification userInfo];
    NSValue* keyboardFrameBegin = [keyboardInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrameBeginRect = [keyboardFrameBegin CGRectValue]  ;
    keyboardFrameBeginRect = [[_subView superview] convertRect:keyboardFrameBeginRect fromView:nil];
    
    NSTimeInterval animationDuration;
    [[keyboardInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    if(keyboardFrameBeginRect.origin.y < _subView.frame.origin.y+_subView.frame.size.height){
        _f = _subView.frame.origin.y+_subView.frame.size.height-keyboardFrameBeginRect.origin.y ;
        CGRect frame =_subView.frame;
        frame.origin.y-=_f;
        [UIView beginAnimations:@"moveSubview" context:nil];
        [UIView setAnimationDuration:animationDuration];
        _subView.frame=frame;
        [UIView commitAnimations];
    }
    CGRect tableFrame =self.tableView.frame;
    tableFrame.size.height-=_f;
    self.tableView.frame=tableFrame;
}

- (void)myNotificationMethodHide:(NSNotification*)notification
{
    NSDictionary* keyboardInfo = [notification userInfo];
    NSTimeInterval animationDuration;
    [[keyboardInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    CGRect frame =_subView.frame;
    frame.origin.y+=_f;
    [UIView beginAnimations:@"moveSubview" context:nil];
    [UIView setAnimationDuration:animationDuration];
    _subView.frame=frame;
    [UIView commitAnimations];
    CGRect tableFrame =self.tableView.frame;
    tableFrame.size.height+=_f;
    self.tableView.frame=tableFrame;
}


//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return [_messages count];
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    MessageHistory *messageHistory = [self.fetchedResultsController objectAtIndexPath:indexPath];
//    NSString* theString=messageHistory.message;
//    CGSize textSize = [theString sizeWithFont:[UIFont systemFontOfSize:13.0]
//                            constrainedToSize:CGSizeMake(300.0f, CGFLOAT_MAX)
//                                lineBreakMode:NSLineBreakByClipping];
//    
//    return textSize.height+21;
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"mesCellIdentifier";
//    tableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if ([_messages count]!=0) {
//        cell.name.text=@"me";
//        cell.message.text=[_messages objectAtIndex:indexPath.row];
//        cell.message.numberOfLines = 0;
//        cell.backGround.image = [UIImage imageNamed:@"rect7824.png"];
//    }
//    return cell;
//}


-(void)tapped {
  [self.view endEditing:YES];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_subView autorelease];
//    [_messages release];
    [_textBackGround autorelease];
    [_newMes autorelease];
    [_newMessageImage autorelease];
    [super dealloc];
}


//- (IBAction)SendMessage:(id)sender {
//    if (self.newMes.text.length!=0) {
//        [_messages addObject:self.newMes.text];
//        _newMes.text=@"";
//        [self.tableView beginUpdates];
//        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:_messages.count - 1 inSection:0]]
//                          withRowAnimation:UITableViewRowAnimationNone];
//        [self.tableView endUpdates];
//        if ([_messages count]>0) {
//            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[_messages count]-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
//        }
//        CGRect frame;
//        frame = self.newMes.frame;
//        float fl;
//        fl=frame.size.height-32;
//        frame.size.height-=fl;
//        self.newMes.frame = frame;
//        frame=self.subView.frame;
//        frame.size.height-=fl;
//        frame.origin.y+=fl;
//        self.subView.frame=frame;
//    }
//}





- (IBAction)SendMessage:(id)sender {
    if (self.newMes.text.length!=0) {
        
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"MessageHistory" inManagedObjectContext:context];
        NSNumber *number=[NSNumber numberWithInt:[self.tableView numberOfRowsInSection:0]];
        [newManagedObject setValue:number forKey:@"number"];
        [newManagedObject setValue:self.newMes.text forKey:@"message"];
        [newManagedObject setValue:self.contact forKey:@"whoSend"];

        
//NSManagedObjectContext *context = [[(TableViewController*)[self.navigationController.viewControllers objectAtIndex:1] database]managedObjectContext];
// MessageHistory *message = (MessageHistory *)[NSEntityDescription insertNewObjectForEntityForName:@"MessageHistory" inManagedObjectContext:context];
//        message.message=self.newMes.text;
//        message.number=[NSNumber numberWithInt:[self.tableView numberOfRowsInSection:0]];
//        message.whoSend=self.contact;
        
       _newMes.text=@"";
       //        [self.tableView beginUpdates];
//        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:number inSection:0]]
//                              withRowAnimation:UITableViewRowAnimationNone];
//        [self.tableView endUpdates];


//        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:[self tableView:self.tableView numberOfRowsInSection:0]-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        
        CGRect frame = self.newMes.frame;
        float fl = frame.size.height-32;
        frame.size.height-=fl;
        self.newMes.frame = frame;
        frame=self.subView.frame;
        frame.size.height-=fl;
        frame.origin.y+=fl;
        self.subView.frame=frame;
    }
}


- (void)setupFetchedResultsController
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"MessageHistory"];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"number"
                                                                                     ascending:YES
                                                                                      selector:@selector(compare:)]];
    request.predicate = [NSPredicate predicateWithFormat:@"whoSend == %@", self.contact];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:self.contact.managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                cacheName:nil];
    
}

- (void)setContact:(Contact *)contact
{
    _contact = contact;
    self.title = contact.name;
    [self setupFetchedResultsController];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mesCellIdentifier";
    
    tableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[tableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    MessageHistory *messageHistory = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.name.text=@"me";
    cell.message.text=messageHistory.message;
    cell.message.numberOfLines = 0;
    cell.backGround.image = [UIImage imageNamed:@"rect7824.png"];
    return cell;
}

@end
