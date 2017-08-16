#import <UIKit/UIKit.h>
#import "SavedProtocol.h"
#import "HSDatePickerViewController.h"

@interface CreateEmployeeViewController : UIViewController <HSDatePickerViewControllerDelegate>

@property (nonatomic, weak) id<DataAccessProtocol> delegate;

@end
