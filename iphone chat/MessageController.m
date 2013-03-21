//
//  Message.m
//  iphone chat
//
//  Created by Anna Balytska on 3/15/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "MessageController.h"

@interface Message ()
@property float f;

@end

@implementation Message

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    self.title = _titleName;

    [super viewDidLoad];
    UITapGestureRecognizer *tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
    [self.tableView addGestureRecognizer:tapped];
    [tapped release];
	// Do any additional setup after loading the view.
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_messages count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* theString=[_messages objectAtIndex:indexPath.row];
   
    
    CGSize textSize = [theString sizeWithFont:[UIFont systemFontOfSize:13.0]
                            constrainedToSize:CGSizeMake(300.0f, CGFLOAT_MAX)
                                lineBreakMode:NSLineBreakByClipping];
    
    return textSize.height+21;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mesCellIdentifier";
    tableCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ([_messages count]!=0) {
        cell.name.text=@"me";
        cell.message.text=[_messages objectAtIndex:indexPath.row];
        cell.message.numberOfLines = 0;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)sender didSelectRowAtIndexPath:(NSIndexPath *)path {

}

-(void)tapped
{
  [self.view endEditing:YES];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [_tableView release];
    [_newMessage release];
    [_subView release];
    [_messages release];
    [super dealloc];
}

- (IBAction)Send:(id)sender {
    if (self.newMessage.text.length!=0) {
        [_messages addObject:self.newMessage.text];
        _newMessage.text=@"";
        [_tableView beginUpdates];
        [_tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:_messages.count - 1 inSection:0]]
                          withRowAnimation:UITableViewRowAnimationNone];
        [_tableView endUpdates];
    }
}
@end
