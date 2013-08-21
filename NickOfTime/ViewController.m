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
#import "CompletedGameView.h"
#import "SwipeViewController.h"
#import "FUIAlertView.h"
#import "UIFont+FlatUI.h"


@interface ViewController (){
    
   // __weak IBOutlet UIProgressView *progressView;
    __weak IBOutlet UISlider *slider;
    float initialTime;
    float seconds;
    NSTimer *myTimer;
    int completedGames;
    UIColor *unlitColor;

}

@property (nonatomic, weak) ContainerViewController *containerViewController;
- (IBAction)swap:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.containerViewController.swipeViewController.delegate = self;
    [slider configureFlatSliderWithTrackColor:[UIColor cloudsColor] progressColor:[UIColor alizarinColor] thumbColor:[UIColor alizarinColor]];
    initialTime = 15;
    seconds = initialTime;
    [self gameSetup];
    [self gameCompleted];
    
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
    if(slider.value != 0){
        seconds = seconds - .01;
         NSLog(@"%f",seconds);
    }else{
        [myTimer invalidate];
        NSLog(@"done");
        
        FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"You lose" message:@"You ran out of time." delegate:nil cancelButtonTitle:@"Home" otherButtonTitles:@"Restart", nil];
        alertView.delegate = self;
        alertView.titleLabel.textColor = [UIColor cloudsColor];
        alertView.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        alertView.messageLabel.textColor = [UIColor cloudsColor];
        alertView.messageLabel.font = [UIFont flatFontOfSize:14];
        alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
        alertView.alertContainer.backgroundColor = [UIColor midnightBlueColor];
        alertView.defaultButtonColor = [UIColor cloudsColor];
        alertView.defaultButtonShadowColor = [UIColor asbestosColor];
        alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        alertView.defaultButtonTitleColor = [UIColor asbestosColor];
        [alertView show];

    }
        slider.value = seconds;
}

-(void)gameCompleted{
    
    for (UIView *game in self.view.subviews)
        
        if ([game isKindOfClass:[CompletedGameView class]]) {
            if (game.tag == completedGames) {
                unlitColor = game.backgroundColor;
                game.backgroundColor = [UIColor alizarinColor];
            }
        }
        

    
}

#pragma mark WinDelegate

-(void)didWinGame{
    //[self.containerViewController swapViewControllers2];

    completedGames = completedGames + 1;
    [self gameCompleted];
    NSLog (@"%i",completedGames);
    
    if (completedGames == 5) {
        [myTimer invalidate];
        
        FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Nice" message:@"Speed up." delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
        alertView.delegate = self;
        alertView.titleLabel.textColor = [UIColor cloudsColor];
        alertView.titleLabel.font = [UIFont boldFlatFontOfSize:16];
        alertView.messageLabel.textColor = [UIColor cloudsColor];
        alertView.messageLabel.font = [UIFont flatFontOfSize:14];
        alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
        alertView.alertContainer.backgroundColor = [UIColor midnightBlueColor];
        alertView.defaultButtonColor = [UIColor cloudsColor];
        alertView.defaultButtonShadowColor = [UIColor asbestosColor];
        alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        alertView.defaultButtonTitleColor = [UIColor asbestosColor];
        [alertView show];
        [self performSelector:@selector(nextLevel:) withObject:alertView afterDelay:1];
    }
}
-(void)gameSetup{
    for (UIView *game in self.view.subviews)
        
        if ([game isKindOfClass:[CompletedGameView class]]) {
            
                game.backgroundColor = [UIColor silverColor];
            
        }
    
    completedGames = 0;
    [self calculateSeconds];
    slider.maximumValue = seconds;
    slider.value = seconds;
    myTimer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(methodToUpdateProgress) userInfo:nil repeats:YES];
}

-(void)calculateSeconds{
    initialTime = initialTime - 1;
    seconds = initialTime;
}

-(void)nextLevel:(UIAlertView *)alertView{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
    [self gameSetup];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        [self dismissModalViewControllerAnimated:YES];
    }else if (buttonIndex == 1){
        initialTime = 15;
        seconds = initialTime;
        [self gameSetup];
        [self gameCompleted];
    }
}
@end
