#import <UIKit/UIKit.h>
#import "SavedProtocol.h"

@interface CreateEmployeeViewController : UIViewController

@property (nonatomic, weak) id<SaveEmployeeProtocol> delegate;

@end
