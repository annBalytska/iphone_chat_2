

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CoreDataTableViewController : UIViewController <NSFetchedResultsControllerDelegate,UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;


- (void)performFetch;

@property (nonatomic) BOOL suspendAutomaticTrackingOfChangesInManagedObjectContext;
@property (nonatomic,retain) IBOutlet UITableView *tableView;

@property BOOL debug;

@end
