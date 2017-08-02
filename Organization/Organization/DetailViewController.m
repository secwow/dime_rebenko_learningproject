//
//  DetailViewController.m
//  Organization
//
//  Created by New user on 02.08.17.
//  Copyright © 2017 New user. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *detailView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (_detailItem) {
        NSInteger salary = _detailItem.salary;
        NSString* information = [_detailItem.fullName stringByAppendingString:@"’s salary is "];
        information = [information stringByAppendingString:[@(salary) stringValue]];
        [_detailView setText: information];
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


- (void)setDetailItem:(Employee *)detailItem{
    
        _detailItem = detailItem;
    
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
   
}





@end
