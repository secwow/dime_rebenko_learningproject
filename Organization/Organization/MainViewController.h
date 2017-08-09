#import <UIKit/UIKit.h>
#import "SavedProtocol.h"

@class Employee;
@class Organization;

@interface MainViewController : UITableViewController<SaveEmployeeProtocol>

@property (strong, nonatomic) Organization *org;

@end
