#import <UIKit/UIKit.h>
#import "SavedProtocol.h"




@interface CreateEmployeeViewController : UIViewController

@property (nonatomic, readwrite) id <SaveEmployeeProtocol> saver;

@end
