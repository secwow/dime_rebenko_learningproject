//
//  CreateEmployeeViewController.m
//  Organization
//
//  Created by New user on 02.08.17.
//  Copyright © 2017 New user. All rights reserved.
//

#import "CreateEmployeeViewController.h"
#import "MainViewController.h"
@interface CreateEmployeeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *salary;



@end

@implementation CreateEmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
             NSLog(@"%@", [segue identifier]);
    if ([[segue identifier] isEqualToString:@"SaveEmployee"])
    {
     
        NSString *firstName = _firstName.text;
        NSString *lastName = _lastName.text;
        NSString *salary = _salary.text;
        NSLog(@"%@", firstName);
        NSLog(@"%@", lastName);
        NSLog(@"%@", salary);
        _savedEmployee = [[Employee alloc] initWithFirstName:firstName lastNameInit:lastName initSalary:[salary integerValue]];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
