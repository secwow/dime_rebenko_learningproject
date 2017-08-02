//
//  MainViewController.h
//  Organization
//
//  Created by New user on 01.08.17.
//  Copyright © 2017 New user. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Employee.h"
#import "Organization.h"
@interface MainViewController : UITableViewController
@property (strong,readwrite) Organization* org;

@end
