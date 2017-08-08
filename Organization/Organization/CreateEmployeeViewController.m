#import "CreateEmployeeViewController.h"
#import "Employee.h"


@interface CreateEmployeeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *salaryTextField;

@end

@implementation CreateEmployeeViewController

- (IBAction)cancelAdding:(id)sender {
    [self dismissViewControllerAnimated:true completion:nil];
}


- (IBAction)saveEmployee:(id)sender
{
    NSString *firstName = _firstNameTextField.text;
    NSString *lastName = _lastNameTextField.text;
    NSString *salary = _salaryTextField.text;
    NSLog(@"%@", firstName);
    NSLog(@"%@", lastName);
    NSLog(@"%@", salary);
    Employee* savedEmployee = [[Employee alloc] initWithFirstName:firstName lastNameInit:lastName initSalary:[salary integerValue]];
    [_saver saveEmployee:savedEmployee];
    [self dismissViewControllerAnimated:true completion:nil];
}


@end
