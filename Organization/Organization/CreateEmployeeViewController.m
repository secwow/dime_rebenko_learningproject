#import "CreateEmployeeViewController.h"
#import "HSDatePickerViewController.h"

@interface CreateEmployeeViewController ()

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *salaryTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthDateField;
@property (retain, nonatomic) NSDate *lastPickedDate;

@end

@implementation CreateEmployeeViewController

@synthesize delegate;

- (IBAction)cancelAdding:(id)sender
{
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)hsDatePickerPickedDate:(NSDate *)date
{
    self.lastPickedDate = date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyyy"];
    NSString *result = [formatter stringFromDate:date];
    self.birthDateField.text = result;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)dismissKeyboard
{
    [self.view endEditing:YES];
}

- (IBAction)saveEmployee:(id)sender
{
    NSString *firstName = self.firstNameTextField.text;
    NSString *lastName = self.lastNameTextField.text;
    NSString *salary = self.salaryTextField.text;
    [delegate saveEmployee:firstName lastName:lastName salary:salary.integerValue birthDate:self.lastPickedDate];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)pickDate:(id)sender
{
    HSDatePickerViewController *hsdpvc = [[HSDatePickerViewController alloc] init];
    [hsdpvc setDelegate:self];
    hsdpvc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:hsdpvc animated:YES completion:nil];
}

@end
