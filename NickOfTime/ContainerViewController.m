//
//  ContainerViewController.m
//  NickOfTime
//
//  Created by Brian Dinh on 8/15/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import "ContainerViewController.h"


#define SegueIdentifierFirst @"toSwipeGame"
#define SegueIdentifierSecond @"toFindGame"
#define SegueIdentifierThird @"toPressGame"


@interface ContainerViewController (){
    NSMutableArray *segueIdentifiers;
    int index;
}

@property (strong, nonatomic) NSString *currentSegueIdentifier;

@property (assign, nonatomic) BOOL transitionInProgress;

@end

@implementation ContainerViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    segueIdentifiers = [NSMutableArray arrayWithObjects:SegueIdentifierFirst, SegueIdentifierSecond, SegueIdentifierThird, nil];
    index = 1;
    
    self.transitionInProgress = NO;
    self.currentSegueIdentifier = SegueIdentifierFirst;
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Instead of creating new VCs on each seque we want to hang on to existing
    // instances if we have it. Remove the second condition of the following
    // two if statements to get new VC instances instead.
    if (([segue.identifier isEqualToString:SegueIdentifierFirst]) && !self.swipeViewController) {
        self.swipeViewController = segue.destinationViewController;
    }
    
    if (([segue.identifier isEqualToString:SegueIdentifierThird]) && !self.pressButtonViewController) {
        self.pressButtonViewController = segue.destinationViewController;
        self.pressButtonViewController.delegate = delegate;

    }
    if (([segue.identifier isEqualToString:SegueIdentifierSecond]) && !self.findTheObjectViewController) {
        self.findTheObjectViewController = segue.destinationViewController;
        self.findTheObjectViewController.testDelegate = delegate;
    }
    
    // If we're going to the first view controller.
    if ([segue.identifier isEqualToString:SegueIdentifierFirst]) {
        // If this is not the first time we're loading this.
        if (self.childViewControllers.count > 0) {
            [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.swipeViewController];
        }
        else {
            // If this is the very first time we're loading this we need to do
            // an initial load and not a swap.
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
        }
    }
    // By definition the second view controller will always be swapped with the
    // first one.
    else if ([segue.identifier isEqualToString:SegueIdentifierSecond]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.findTheObjectViewController];
    }
    else if ([segue.identifier isEqualToString:SegueIdentifierThird]) {
        [self swapFromViewController:[self.childViewControllers objectAtIndex:0] toViewController:self.pressButtonViewController];
    }

}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:.09 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        self.transitionInProgress = NO;
    }];
}

- (void)swapViewControllers2
{
    if (self.transitionInProgress) {
        return;
    }
   
    self.transitionInProgress = YES;
   
    
    if (index==3) {
        index = 0;
    }
    self.currentSegueIdentifier = [NSString stringWithFormat:@"%@",segueIdentifiers[index]];
   // self.currentSegueIdentifier = ([self.currentSegueIdentifier isEqualToString:SegueIdentifierSecond]) ? SegueIdentifierThird : SegueIdentifierSecond;
    
    [self performSegueWithIdentifier:self.currentSegueIdentifier sender:nil];
    index++;

}



@end
