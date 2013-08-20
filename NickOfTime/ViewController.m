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
#import "UIProgressView+FlatUI.h"
#import "UIColor+FlatUI.h"
#import "UISlider+FlatUI.h"
@interface ViewController (){
    
    __weak IBOutlet UIProgressView *progressView;
    __weak IBOutlet UISlider *slider;
    float seconds;
    NSTimer *myTimer;
}

@property (nonatomic, weak) ContainerViewController *containerViewController;
- (IBAction)swap:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [progressView configureFlatProgressViewWithTrackColor:[UIColor alizarinColor] progressColor:[UIColor cloudsColor]];
    [slider configureFlatSliderWithTrackColor:[UIColor cloudsColor] progressColor:[UIColor alizarinColor] thumbColor:[UIColor alizarinColor]];
    seconds = 12;
    slider.maximumValue = seconds;

    
    myTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(methodToUpdateProgress) userInfo:nil repeats:YES];
    
    
    [UIView animateWithDuration:seconds
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [slider setValue:0];
                     }
                     completion:NULL];
    
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

- (void)methodToUpdateProgress
{
    if(seconds == 1){
        [myTimer invalidate];
        NSLog(@"done");

    }else{
        seconds = seconds - 1;
    }
}
@end
