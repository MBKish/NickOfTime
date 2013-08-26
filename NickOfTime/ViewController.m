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
    float bonusTime;
    NSTimer *myTimer;
    int completedGames;
    int completedSets;
    int score;
    __weak IBOutlet UILabel *scoreLabel;
    int bonusTimeInt;
    int level;

}

@property (nonatomic, weak) ContainerViewController *containerViewController;
- (IBAction)swap:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.containerViewController.swipeViewController.delegate = self;
    //self.containerViewController.findTheObjectViewController.testDelegate = self;
    self.containerViewController.delegate = self;
    [slider configureFlatSliderWithTrackColor:[UIColor cloudsColor] progressColor:[UIColor alizarinColor] thumbColor:[UIColor alizarinColor]];
    scoreLabel.text = @"000";
    level = 0;
    [self restartTimeAndScore];
    [self gameSetup];
    [self gameWon];
    completedSets = 0;
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(swapLevel:) name:@"nextLevel" object:nil];
    [notificationCenter addObserver:self selector:@selector(restartLevel:) name:@"restartGame" object:nil];
    
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
    if(!(slider.value <= 0)){
        seconds = seconds - .01;
        // NSLog(@"%f",seconds);
        bonusTime = seconds;

    }else{
        [myTimer invalidate];
  
        
        NSLog(@"done");
        
        FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"You lose" message:@"You ran out of time." delegate:nil cancelButtonTitle:@"Home" otherButtonTitles:@"Restart", nil];
        alertView.delegate = self;
        alertView.titleLabel.textColor = [UIColor cloudsColor];
        alertView.titleLabel.font = [UIFont boldFlatFontOfSize:25];
        alertView.messageLabel.textColor = [UIColor cloudsColor];
        alertView.messageLabel.font = [UIFont flatFontOfSize:14];
        alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
        alertView.alertContainer.backgroundColor = [UIColor midnightBlueColor];
        alertView.defaultButtonColor = [UIColor cloudsColor];
        alertView.defaultButtonShadowColor = [UIColor asbestosColor];
        alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        alertView.defaultButtonTitleColor = [UIColor asbestosColor];
        [alertView show];
        
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        
        //notification to restart game
        [notificationCenter postNotificationName:@"restartGame" object:nil];
        seconds = initialTime;

    }
        slider.value = seconds;
}

-(void)gameWon{
    for (UIView *game in self.view.subviews)
        
        if ([game isKindOfClass:[CompletedGameView class]]) {
            if (game.tag == completedGames) {
                game.backgroundColor = [UIColor alizarinColor];
            }
        }
    
}

-(void)gameLost{
    for (UIView *game in self.view.subviews)
        
        if ([game isKindOfClass:[CompletedGameView class]]) {
            if (game.tag == completedGames+1) {
                game.backgroundColor = [UIColor silverColor];
            }
        }
    
}

#pragma mark WinOrLoseDelegate

-(void)didWinGame{
    completedGames = completedGames + 1;
    score = score + 100;
    [self updateScore];

    if (completedGames < 5) {
        [self.containerViewController swapViewControllers2];
        [self gameWon];
        NSLog (@"%i",completedGames);
    }
    
    else {
        [self gameWon];
        NSLog (@"%i",completedGames);
        [myTimer invalidate];
        completedSets = completedSets + 1;
        NSLog(@"%i",completedSets);
        FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Nice" message:@"Speed up." delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
        alertView.delegate = self;
        alertView.titleLabel.textColor = [UIColor cloudsColor];
        alertView.titleLabel.font = [UIFont boldFlatFontOfSize:25];
        alertView.messageLabel.textColor = [UIColor cloudsColor];
        alertView.messageLabel.font = [UIFont flatFontOfSize:14];
        alertView.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
        alertView.alertContainer.backgroundColor = [UIColor midnightBlueColor];
        alertView.defaultButtonColor = [UIColor cloudsColor];
        alertView.defaultButtonShadowColor = [UIColor asbestosColor];
        alertView.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        alertView.defaultButtonTitleColor = [UIColor asbestosColor];
        [alertView show];
        score = score + (bonusTimeInt * 50);
        [self updateScore];
        [self performSelector:@selector(nextLevel:) withObject:alertView afterDelay:1];
    }
    
   
}

-(void)didLoseGame{
    score = score - 50;
    [self updateScore];
    if (completedGames > 0) {
        completedGames = completedGames - 1;
        
    }
    [self gameLost];
    //unlight the completed game box
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
    //calculates bonus time from remaining time
    bonusTimeInt = (int)seconds;
   
    //calculates speed up time and adds time bonus
    initialTime = (initialTime - (2 * completedSets)) + bonusTime;
    seconds = initialTime;
}

-(void)nextLevel:(UIAlertView *)alertView{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
    
    if (((completedSets % 2) == 0) && (completedSets != 0)) {
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter postNotificationName:@"nextLevel" object:nil];
    }
    
    [self gameSetup];

    
    if (level == 0) {
        [self.containerViewController swapViewControllers2];
    }
    
    if (level == 1) {
        [self.containerViewController swapViewControllers3];
    }
    
    if (level == 2) {
        [self.containerViewController swapViewControllers4];
    }
    
   
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        [self dismissViewControllerAnimated:YES completion:^{
            //nothing
        }];
    }else if (buttonIndex == 1){
        [self restartTimeAndScore];
        [self gameSetup];
        [self gameWon];
    }
}

-(void)restartTimeAndScore{
    //resets time and score after you lose
    initialTime = 15;
    seconds = initialTime;
    score = 0;
}

-(void)updateScore{
    scoreLabel.text = [NSString stringWithFormat:@"%i",score];
}

-(void)swapLevel:(id)sender{
    if (level <2) {
        level = level +1;
    }
}

-(void)restartLevel:(id)sender{
    level = 0;    
}

@end
