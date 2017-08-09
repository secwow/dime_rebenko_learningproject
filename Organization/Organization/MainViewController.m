#import "MainViewController.h"
#import "DetailViewController.h"
#import "CreateEmployeeViewController.h"
#import "Employee.h"
#import "Organization.h"

@interface MainViewController ()		

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Organization *org = [[Organization alloc] initWithName:@"Inter"];
    for(int i = 0; i < 4; i++)
    {
        NSString *name = [@(i).stringValue stringByAppendingString: @"vasya "];
        NSString *fullName = [name stringByAppendingString:@"pupkin"];
        [org addEmployeeWithName:fullName];
    }
    
    self.org = org;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [_org getCountEmplyees];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellForTitle" ];
    Employee* employee = [_org getEmployeeAtIndex:indexPath.row];
    cell.textLabel.text = employee.fullName;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexSelectedRow = [self.tableView indexPathForSelectedRow];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexSelectedRow];
        NSString *employeeName = cell.textLabel.text;
        Employee *object = [_org getEmployeeByFullName:employeeName];
        DetailViewController *controller = [segue destinationViewController];
        controller.detailItem = object;
        
    }
    
    if ([segue.identifier isEqualToString:@"AddUser"])
    {
        CreateEmployeeViewController *controller = [segue destinationViewController];
        controller.delegate = self;
    }
    
}

- (void)saveEmployee:(Employee *) employee
{
    [self addEmployee:employee];
}

- (void)addEmployee:(Employee *)employee
{
    [_org addEmployee:employee];
    NSIndexPath *path =[NSIndexPath indexPathForRow:_org.getCountEmplyees-1 inSection:0];
    NSArray *indexArray = [NSArray arrayWithObject:path];
    [self.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
