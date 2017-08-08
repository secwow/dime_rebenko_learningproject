#import "CreateEmployeeViewController.h"
#import "Employee.h"

@interface CreateEmployeeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *salaryTextField;

@end

@implementation CreateEmployeeViewController

- (IBAction)saveEmployee:(id)sender
{
    NSString *firstName = self.firstNameTextField.text;
    NSString *lastName = self.lastNameTextField.text;
    NSString *salary = self.salaryTextField.text;
    Employee *savedEmployee = [[Employee alloc] initWithFirstName:firstName lastNameInit:lastName initSalary:salary.integerValue];
    [self.delegate saveEmployee:savedEmployee];
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
