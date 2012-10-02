#import <UIKit/UIKit.h>

/******************************************************************************/
#pragma mark Forward Decl

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@end

@interface TestVC : UIViewController
@end

/******************************************************************************/
#pragma mark -

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Create the VC either with a nib or a storyboard
    
    // 1. Creating the TestVC using the nib file successfully makes the connection
//    self.window.rootViewController = [TestVC new];

    // 2. Using the storyboard does *not* create that connection
    self.window.rootViewController = [[UIStoryboard storyboardWithName:@"TestVC" bundle:nil] instantiateInitialViewController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (IBAction)action:(id)sender
{
    NSLog(@"action !");
}

@end


/******************************************************************************/
#pragma mark -

@implementation TestVC
{
    IBOutlet UIButton * _button;
}
- (void) viewDidLoad
{
    NSLog(@"number of targets : %d",[[_button allTargets] count]);
}
@end

/******************************************************************************/
#pragma mark -

int main(int argc, char *argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}

