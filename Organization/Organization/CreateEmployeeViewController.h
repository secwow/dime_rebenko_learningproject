#import <UIKit/UIKit.h>
#import "SavedProtocol.h"

@interface CreateEmployeeViewController : UIViewController

@property (nonatomic) id <SaveEmployeeProtocol> delegate;

@end
