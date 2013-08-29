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
#import "SGSoundMachine.h"

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
    int highScore;
    __weak IBOutlet UILabel *scoreLabel;
    int bonusTimeInt;
    int level;
}

@property (nonatomic, weak) ContainerViewController *containerViewController;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    highScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScore"];
    NSLog(@"highscore: %i",highScore);
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

- (void)methodToUpdateProgress
{
    if(!(slider.value <= 0)){
        seconds = seconds - .01;
         //NSLog(@"%f",seconds);
        bonusTime = seconds;

    }else{
        [myTimer invalidate];
      /*  if (score > highScore) {
            //Use this to reset the score - do we want this somewhere in the app?
            //score = 0;
            [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"HighScore"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        } */
        [[SGSoundMachine soundMachine] playSoundWithName:@"TimeUp"];
        
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
        
        FUIAlertView *alertViewHighScore = [[FUIAlertView alloc] initWithTitle:@"You lose" message:@"New high score!" delegate:nil cancelButtonTitle:@"Home" otherButtonTitles:@"Restart", nil];
        alertViewHighScore.delegate = self;
        alertViewHighScore.titleLabel.textColor = [UIColor cloudsColor];
        alertViewHighScore.titleLabel.font = [UIFont boldFlatFontOfSize:25];
        alertViewHighScore.messageLabel.textColor = [UIColor cloudsColor];
        alertViewHighScore.messageLabel.font = [UIFont flatFontOfSize:14];
        alertViewHighScore.backgroundOverlay.backgroundColor = [[UIColor cloudsColor] colorWithAlphaComponent:0.8];
        alertViewHighScore.alertContainer.backgroundColor = [UIColor midnightBlueColor];
        alertViewHighScore.defaultButtonColor = [UIColor cloudsColor];
        alertViewHighScore.defaultButtonShadowColor = [UIColor asbestosColor];
        alertViewHighScore.defaultButtonFont = [UIFont boldFlatFontOfSize:16];
        alertViewHighScore.defaultButtonTitleColor = [UIColor asbestosColor];

        if (score >highScore) {
            [alertViewHighScore show];
            [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"HighScore"];
            [[NSUserDefaults standardUserDefaults] synchronize];

        }
        else {
            [alertView show];
        }
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
        [[SGSoundMachine soundMachine] playSoundWithName:@"Win1"];
        [self.containerViewController swapViewControllers2];
        [self gameWon];
        NSLog (@"Comp Games %i",completedGames);
    }
    
    else {
        [[SGSoundMachine soundMachine] playSoundWithName:@"Win2"];
        [self gameWon];
        NSLog (@"Comp Games %i",completedGames);
        [myTimer invalidate];
        completedSets = completedSets + 1;
        NSLog(@"Comp Sets %i",completedSets);
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
    [[SGSoundMachine soundMachine] playSoundWithName:@"Loss"];
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
    
    float newBonusTime = ((powf(40, ((30 - (0.80 * initialTime))/30)))/30) * seconds;
   
    //calculates speed up time and adds time bonus
    if (completedSets >= 1) {
        initialTime = (0.80 * initialTime) + newBonusTime;
//        initialTime = (initialTime - (.25 * initialTime)) + (.75 * bonusTime);
//        if (initialTime >= 25) {
//            initialTime = 25;
//     }
        seconds = initialTime;
    }NSLog(@"seconds %f", seconds);
 
}

-(void)nextLevel:(UIAlertView *)alertView{
    [alertView dismissWithClickedButtonIndex:0 animated:YES];
    
    if (((completedSets % 2) == 0) && (completedSets != 0)) {
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter postNotificationName:@"nextLevel" object:nil];
    }
    
    [self gameSetup];
    [self.containerViewController swapViewControllers2];

   
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
        [self updateScore];
        //notification to restart game
        
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        [notificationCenter postNotificationName:@"restartGame" object:nil];
    }
}

-(void)restartTimeAndScore{
    //resets time and score after you lose
    initialTime = 15;
    seconds = initialTime;
    score = 0;
    completedSets = 0;

}

-(void)updateScore{
    scoreLabel.text = [NSString stringWithFormat:@"%i",score];
}



@end
