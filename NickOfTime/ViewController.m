//
//  ViewController.m
//  NickOfTime
//
//  Created by Matthew Kish on 8/13/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//
// TEST LINE!

#import "ViewController.h"
#import "ContainerViewController.h"

@interface ViewController ()

@property (nonatomic, weak) ContainerViewController *containerViewController;
- (IBAction)swap:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"embedContainer"]) {
        self.containerViewController = segue.destinationViewController;
    }
}

- (IBAction)swap:(id)sender {
    [self.containerViewController swapViewControllers2];
}
@end
