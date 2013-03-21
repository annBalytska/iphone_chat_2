//
//  TableViewController.m
//  iphone chat
//
//  Created by Anna Balytska on 3/13/13.
//  Copyright (c) 2013 softserve. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
@property NSArray* alphabet;
@property NSMutableArray* sections;
@property NSMutableArray *sortedKeys;
@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _alphabet=[[NSArray alloc] initWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",nil];
    _people=[[NSMutableDictionary alloc] initWithObjectsAndKeys:
             @"family",    @"Angelina",
             @"family",    @"Mackenzie",
             @"family",    @"Brooke",
             @"job",       @"Alex",
             @"job",       @"Owen",
             @"job",       @"Trinity",
             @"job",       @"Zoe",
             @"friends",   @"Nicole",
             @"friends",   @"Rebecca",
             @"friends",   @"Luis",
             @"neighbours",@"Leon",
             @"neighbours",@"Kaitlyn",
             @"other",     @"Mary",
             nil];
    _sections=[[NSMutableArray alloc]initWithCapacity:26];
    
    self.title = @"Contacts";
    
    for (int i=0; i<26; i++) {
        NewSection *sect = [[[NewSection alloc]init]autorelease];
        [_sections addObject:sect];
        [[_sections objectAtIndex:i]setNameOfSection:[_alphabet objectAtIndex:i]];
    }
    
    
    for (int i=0; i<[[_people allKeys]count]; i++)
        for (int j = 0; j<26; j++) {
            if([[[_people allKeys] objectAtIndex:i]characterAtIndex:0]==[[[_sections objectAtIndex:j]nameOfSection]characterAtIndex:0])
                [[_sections objectAtIndex:j]setNumberOfContacts:[[_sections objectAtIndex:j]numberOfContacts]+1];
    }

    for (int i=0; i<[_sections count]; i++)
    {
        if ([[_sections objectAtIndex:i]numberOfContacts]==0) {
            [_sections removeObjectAtIndex:i];
            i--;
        }
    }

    NSArray* keys = [_people allKeys];
    
    _his=[[HistoryOfMessages alloc] init];
 
    _sortedKeys = [[NSMutableArray alloc]initWithArray:[keys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]];
    

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_sections count];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[[UIView alloc] initWithFrame:CGRectMake(0,0,tableView.frame.size.width,23)] autorelease];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, headerView.frame.size.width, headerView.frame.size.height)];
    headerLabel.text = [[_sections objectAtIndex:section]nameOfSection];
    headerLabel.textAlignment =NSTextAlignmentCenter;
    //headerLabel.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    [headerView addSubview:headerLabel];
    [headerLabel release];
    return headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[_sections objectAtIndex:section]numberOfContacts];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cellIdentifier";
    Cell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[Cell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    for (int i=0; i<[_sortedKeys count]; i++) {
        if ([[[_sections objectAtIndex:indexPath.section]nameOfSection]characterAtIndex:0]==[[[_sortedKeys objectAtIndex:i]uppercaseString]characterAtIndex:0])
        {
            cell.nameOfContact.text = [_sortedKeys objectAtIndex:i+indexPath.row];
            cell.group.text=[_people objectForKey:[_sortedKeys objectAtIndex:i+indexPath.row]];
            break;
        }
    }
//    UIView *backgroundView = [[[UIView alloc] initWithFrame:CGRectZero] autorelease];
//    backgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rect5798.png"]];
    cell.backGround.image = [UIImage imageNamed:@"rect5798.png"];
    if([[_people objectForKey:cell.nameOfContact.text] isEqualToString:@"family"])
        cell.img.image=[UIImage imageNamed:@"i.jpeg"];
    else if([[_people objectForKey:cell.nameOfContact.text] isEqualToString:@"job"])
        cell.img.image=[UIImage imageNamed:@"i-1.jpeg"];
    else if([[_people objectForKey:cell.nameOfContact.text] isEqualToString:@"friends"])
        cell.img.image=[UIImage imageNamed:@"i-2.jpeg"];
    else if([[_people objectForKey:cell.nameOfContact.text] isEqualToString:@"neighbours"])
        cell.img.image=[UIImage imageNamed:@"i-3.jpeg"];
    else
        cell.img.image = UIGraphicsGetImageFromCurrentImageContext();
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if (indexPath) {
        Message *mesViewController = segue.destinationViewController;
        for (int i=0; i<[_sortedKeys count]; i++) {
            if ([[[_sections objectAtIndex:indexPath.section]nameOfSection]characterAtIndex:0]==[[[_sortedKeys objectAtIndex:i]uppercaseString] characterAtIndex:0])
            {
                mesViewController.titleName = [_sortedKeys objectAtIndex:i+indexPath.row];
                mesViewController.messages= [_his messagesForKey:mesViewController.titleName];
                break;
            }
        }
    }
    else
    {
        contactController *contact = segue.destinationViewController;
        contact.contacts=_people;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}


- (void)addObject:(NSString*)object addKey:(NSString*)key {
    bool b=false;
    [_people setObject:object forKey:key];
    
    for (int i=0; i<[_sections count]; i++) {
        if ([[key uppercaseString] characterAtIndex:0]==[[[_sections objectAtIndex:i]nameOfSection] characterAtIndex:0]) {
            b=true;
        }
    }
    if (b==false) {
        
        NewSection *sect = [[[NewSection alloc]init]autorelease];
        [sect setNameOfSection:[NSString stringWithFormat:@"%c",[[key uppercaseString] characterAtIndex:0]]];
        int i=0;
        
        while([[[_sections objectAtIndex:i]nameOfSection]characterAtIndex:0]<[[key uppercaseString] characterAtIndex:0]) {
            i++;
        }
        [_sections insertObject:sect atIndex:i];
        
        NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
        [indexSet addIndex:i];
        [self.tableView beginUpdates];
        [self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationNone];
        [self.tableView endUpdates];
    }
    
    int numberOfSection=0;
    int numberOfRow=0;
    [_sortedKeys addObject:key];
    [_sortedKeys sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    for (int i=0;i<[_sections count]; i++) {
        if ([[key uppercaseString] characterAtIndex:0]==[[[_sections objectAtIndex:i]nameOfSection] characterAtIndex:0]) {
            numberOfSection=i;
        }
    }
    
    int i=0,j=0;
    
    while ([[key uppercaseString] characterAtIndex:0] != [[[_sortedKeys objectAtIndex:i]uppercaseString] characterAtIndex:0]) {
        i++;
    }
    while (![[key uppercaseString] isEqualToString:[[_sortedKeys objectAtIndex:j]uppercaseString]]) {
        j++;
    }
    numberOfRow=j-i;
    [[_sections objectAtIndex:numberOfSection]setNumberOfContacts:[[_sections objectAtIndex:numberOfSection]numberOfContacts]+1];
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:numberOfRow inSection:numberOfSection]]
                          withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView endUpdates];
}

- (void)dealloc
{
    [_people release];
    [_alphabet release];
    [_sortedKeys release];
    [_sections release];
    [_his release];
    [super dealloc];
}

@end
