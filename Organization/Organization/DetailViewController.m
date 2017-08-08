#import "DetailViewController.h"
#import "Employee+CoreDataClass.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *detailView;

@end

@implementation DetailViewController

@synthesize detailItem;

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (detailItem) {
        NSInteger salary = detailItem.salary;
        NSString* information = [detailItem.fullName stringByAppendingString:@"’s salary is "];
        information = [information stringByAppendingString:[@(salary) stringValue]];
        [self.detailView setText: information];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setDetailItem:(Employee *)inputDetailItem
{
        detailItem = inputDetailItem;
}

@end
