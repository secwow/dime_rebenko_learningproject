#import <UIKit/UIKit.h>
#import "SavedProtocol.h"
#import <CoreData/CoreData.h>

@class Employee;
@class Organization;

@interface MainViewController : UITableViewController<UITableViewDataSource, SaveEmployeeProtocol, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) Organization *org;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
