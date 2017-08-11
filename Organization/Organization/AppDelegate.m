#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

+ (AppDelegate *)instance
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _managedObjectModel = [self managedObjectModel];
    _managedObjectContext = [self managedObjectContext];
    _persistentStoreCoordinator = [self persistentStoreCoordinator];
    return YES;
}

- (NSManagedObjectModel *)managedObjectModel
{

    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }

    NSURL *nsurl = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:nsurl];
    return _managedObjectModel;
}

- (NSManagedObjectContext *)managedObjectContext
{

    if (_managedObjectContext != nil)
    {
        return _managedObjectContext;
    }

    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];

    if (coordinator != nil)
    {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }

    return _managedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }

    NSURL *docDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [docDirectory URLByAppendingPathComponent:@"Employeeer.sqlite"];
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];

    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        abort();
    }

    return self.persistentStoreCoordinator;
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectctx = _managedObjectContext;

    if (managedObjectctx != nil)
    {
        if ([managedObjectctx hasChanges] && ![managedObjectctx save:&error])
        {
            abort();
        }
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self saveContext];
}

@end
