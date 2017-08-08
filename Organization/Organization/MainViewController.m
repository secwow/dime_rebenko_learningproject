#import "MainViewController.h"
#import "DetailViewController.h"
#import "CreateEmployeeViewController.h"
#import "Employee+CoreDataClass.h"
#import "Organization+CoreDataClass.h"
#import "AppDelegate.h"
#import "HSDatePickerViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize org;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

NSString* attributeValue = @"Siemens";
NSString* attributeName = @"name"; //geniuos constant


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSManagedObjectContext *context = [AppDelegate context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Organization" inManagedObjectContext:context];
    [request setEntity:entity];
    org = [context executeFetchRequest:request error:nil] == nil ?
                [context executeFetchRequest:request error:nil] [0] :
                [self primaryInit:context];
    
    
}

- (Organization *) primaryInit: (NSManagedObjectContext *) context
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    Organization *organization = [NSEntityDescription insertNewObjectForEntityForName:@"Organization" inManagedObjectContext:context];
    organization.name = attributeValue;
    [AppDelegate saveContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Organization" inManagedObjectContext:context];
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
    return [org getCountEmployees];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellForTitle"];
    Employee *object = [org getEmployeeByIndex:indexPath.row];
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
        Employee *object = [org getEmployeeByFullName:employeeName];
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
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        [org removeObjectFromEmplsAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [AppDelegate saveContext];
    }
}

- (void)saveEmployee:(NSString *) firstName lastName:(NSString *)lastName salary:(NSInteger)salary birthDate:(NSDate *)date
{
    Employee *employee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:[AppDelegate context]];
    employee.lastName = lastName;
    employee.firstName = firstName;
    employee.salary = salary;
    employee.birthDate = date;
    [org addEmplsObject:employee];
    NSIndexPath *path =[NSIndexPath indexPathForRow: org.getCountEmployees-1 inSection:0];
    NSArray *indexArray = [NSArray arrayWithObject:path];
    [self.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
    [AppDelegate saveContext];
}


@end
