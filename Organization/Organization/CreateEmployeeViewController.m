#import "CreateEmployeeViewController.h"

@interface CreateEmployeeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *salaryTextField;

@end

@implementation CreateEmployeeViewController

@synthesize delegate;

- (IBAction)cancelAdding:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}

- (IBAction)saveEmployee:(id)sender
{
    NSString *firstName = self.firstNameTextField.text;
    NSString *lastName = self.lastNameTextField.text;
    NSString *salary = self.salaryTextField.text;
    [delegate saveEmployee:firstName lastName:lastName salary:salary.integerValue];
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
