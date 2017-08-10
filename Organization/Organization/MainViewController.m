#import "MainViewController.h"
#import "DetailViewController.h"
#import "CreateEmployeeViewController.h"
#import "Employee+CoreDataClass.h"
#import "Organization+CoreDataClass.h"
#import "AppDelegate.h"



@implementation MainViewController



NSString* attributeValue = @"Siemens";
NSString* attributeName = @"name"; //genious constant
AppDelegate *delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
 
   
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Organization" inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:entity];
    self.org = [delegate.managedObjectContext executeFetchRequest:request error:nil] == nil ?
                [delegate.managedObjectContext executeFetchRequest:request error:nil] [0] :
                [self primaryInit:delegate.managedObjectContext];
    
    
}

- (Organization *)primaryInit:(NSManagedObjectContext *)context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    Organization *organization = [NSEntityDescription insertNewObjectForEntityForName:@"Organization" inManagedObjectContext:context];
    organization.name = attributeValue;
    [delegate saveContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Organization" inManagedObjectContext:delegate.managedObjectContext];
    [request setEntity:entity];
    return [context executeFetchRequest:request error:nil][0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.org.empls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"CellForTitle"];
    Employee *object = [self.org.empls objectAtIndex:indexPath.row];
    cell.textLabel.text = object.fullName;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexSelectedRow = [self.tableView indexPathForSelectedRow];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexSelectedRow];
        NSString *employeeName = cell.textLabel.text;
        Employee *object = [self.org getEmployeeByFullName:employeeName];
        DetailViewController *controller = [segue destinationViewController];
        controller.detailItem = object;
    }
    
    if ([segue.identifier isEqualToString:@"AddUser"])
    {
        CreateEmployeeViewController *controller = [segue destinationViewController];
        controller.delegate = self;
    }
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [self.org removeObjectFromEmplsAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [delegate saveContext];
    }
}

- (void)saveEmployee:(NSString *) firstName lastName:(NSString *)lastName salary:(NSInteger)salary
{
    Employee *employee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:delegate.managedObjectContext];
    employee.lastName = lastName;
    employee.firstName = firstName;
    employee.salary = salary;
    [self.org addEmplsObject:employee];
    NSIndexPath *path =[NSIndexPath indexPathForRow:self.org.empls.count-1 inSection:0];
    NSArray *indexArray = [NSArray arrayWithObject:path];
    [self.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
    [delegate saveContext];
}

@end
