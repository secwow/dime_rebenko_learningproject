//
//  MainViewController.m
//  Organization
//
//  Created by New user on 01.08.17.
//  Copyright © 2017 New user. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Organization *org = [[Organization alloc] initWithName:@"Inter"];
    for(int i = 0; i < 100; i++)
    {
        NSString *name = [@(i).stringValue stringByAppendingString: @"vasya "];
        NSString *fullName = [name stringByAppendingString:@"pupkin"];
        [org addEmployeeWithName:fullName];
    }
    
    _org = org;
    
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
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *indexSelectedRow = [self.tableView indexPathForSelectedRow];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexSelectedRow];
        NSString *employeeName = cell.textLabel.text;
        Employee *object = [_org getEmployeeByFullName:employeeName];
        DetailViewController *controller = [segue destinationViewController];
        controller.detailItem = object;
        
    }
}




@end
