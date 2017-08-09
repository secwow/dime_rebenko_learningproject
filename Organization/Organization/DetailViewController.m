#import "DetailViewController.h"
#import "Employee.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *detailView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.detailItem)
    {
        NSInteger salary = self.detailItem.salary;
        NSString* information = [self.detailItem.fullName stringByAppendingString:@"’s salary is "];
        information = [information stringByAppendingString:[@(salary) stringValue]];
        [self.detailView setText: information];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)setDetailItem:(Employee *)detailItem
{
        self.detailItem = detailItem;
}

@end
