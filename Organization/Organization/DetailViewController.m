#import "DetailViewController.h"
#import "Employee+CoreDataClass.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *detailView;

@end

@implementation DetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.detailItem)
    {
        NSString *information = [NSString stringWithFormat:@"@%@ salary is %i", self.detailItem.fullName, self.detailItem.salary];
        [self.detailView setText:information];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
