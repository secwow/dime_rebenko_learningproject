#import <UIKit/UIKit.h>
#import "SavedProtocol.h"

@interface CreateEmployeeViewController : UIViewController

@property (nonatomic, retain) id <SaveEmployeeProtocol> delegate;

@end
