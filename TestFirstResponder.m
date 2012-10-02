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

- (IBAction)firstActionInAppDelegate:(id)sender
{
    NSLog(@"firstActionInAppDelegate");
}

- (IBAction)secondActionInAppDelegate:(id)sender
{
    NSLog(@"secondActionInAppDelegate");
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
    NSLog(@"control events: %d",[_button allControlEvents]);
    NSLog(@"%d targets:",[[_button allTargets] count]);
    for (id target in [_button allTargets])
    {
        NSLog(@"target : %@ actions : %@",target, [_button actionsForTarget:target forControlEvent:UIControlEventTouchUpInside]);
    }
    [_button addTarget:nil action:@selector(secondActionInAppDelegate:) forControlEvents:UIControlEventTouchUpInside];
    NSLog(@"%d targets:",[[_button allTargets] count]);
}

- (IBAction)actionInVC:(id)sender
{
    NSLog(@"actionInVC");
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

