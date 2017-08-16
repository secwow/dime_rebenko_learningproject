#import <UIKit/UIKit.h>
#import "SavedProtocol.h"
#import <CoreData/CoreData.h>

@class Employee;
@class Organization;

@interface MainViewController : UITableViewController <UITableViewDataSource, DataAccessProtocol>

@property (strong, nonatomic) Organization *org;

@end
