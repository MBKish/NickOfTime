//
//  StartViewController.m
//  NickOfTime
//
//  Created by Brian Dinh on 8/20/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import "StartViewController.h"
#import "FUIButton.h"
#import "UIColor+FlatUI.h"
#import "UIFont+FlatUI.h"
#import "SGSoundMachine.h"
#import "FUIAlertView.h"

@interface StartViewController (){
    
    __weak IBOutlet FUIButton *startButton;
    __weak IBOutlet UILabel *highScoreLabel;
    __weak IBOutlet NSLayoutConstraint *constraint;
    __weak IBOutlet UIButton *soundButton;
    UIImage * soundButtonOff;
    UIImage * soundButtonON;
    __weak IBOutlet UILabel *titleLabel;

}
- (IBAction)startGame:(id)sender;
- (IBAction)mute:(id)sender;


@end

@implementation StartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    soundButtonOff = [UIImage imageNamed:@"soundOff.png"];
    soundButtonON = [UIImage imageNamed:@"soundOn.png"];
    
     [titleLabel setFont:[UIFont fontWithName:@"Pusab" size:60]];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenHeight = screenRect.size.height;
    if (screenHeight == 568){
        constraint.constant = 188;
    }
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped:)];
    [highScoreLabel addGestureRecognizer:tap];
    
    startButton.buttonColor = [UIColor alizarinColor];
    startButton.shadowColor = [UIColor pomegranateColor];
    startButton.shadowHeight = 3.0f;
    startButton.cornerRadius = 6.0f;
    startButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [startButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];

   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startGame:(id)sender {
    [[SGSoundMachine soundMachine] playSoundWithName:@"Begin"];
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Hello" message:@"Complete five challenges to move on." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:@"Begin", nil];
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
    alertView.tag = 0;
    [alertView show];
}

- (IBAction)mute:(id)sender {

    if ([SGSoundMachine soundMachine].soundIsOff == NO) {
        [SGSoundMachine soundMachine].soundIsOff = YES;
        [[NSUserDefaults standardUserDefaults] setBool:[SGSoundMachine soundMachine].soundIsOff forKey:@"Sound"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    } else {
        [SGSoundMachine soundMachine].soundIsOff = NO;
        [[NSUserDefaults standardUserDefaults] setBool:[SGSoundMachine soundMachine].soundIsOff forKey:@"Sound"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    
    [self checkSound];

}
- (void)imageViewTapped:(UITapGestureRecognizer *)gr {
    
    FUIAlertView *alertViewHighScore = [[FUIAlertView alloc] initWithTitle:@"Clear high score?" message:nil delegate:nil cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    alertViewHighScore.delegate = self;
    alertViewHighScore.tag = 1;
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
    
    [alertViewHighScore show];
}


- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 0) {
        if (buttonIndex == 0){
            //cancel clicked ...do your action
        }else if (buttonIndex == 1){
            [self performSegueWithIdentifier:@"toGame" sender:self];
        }
    }
    if (alertView.tag == 1) {
        if (buttonIndex == 0){
            //cancel clicked ...do your action
        }else if (buttonIndex == 1){
            [[NSUserDefaults standardUserDefaults] setInteger:0 forKey:@"HighScore"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [self setScore];

            
        }

    }
}
-(void)viewDidAppear:(BOOL)animated{
    
    [self setScore];
    [SGSoundMachine soundMachine].soundIsOff = [[NSUserDefaults standardUserDefaults] boolForKey:@"Sound"];
    [self checkSound];

}
-(void)setScore{
    highScoreLabel.text = [NSString stringWithFormat:@"high score: %i", [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScore"]];

}

-(void)checkSound{
    if ([SGSoundMachine soundMachine].soundIsOff == YES) {
        [soundButton setImage:soundButtonOff forState:UIControlStateNormal];
    }
    else if ([SGSoundMachine soundMachine].soundIsOff == NO) {
        [soundButton setImage:soundButtonON forState:UIControlStateNormal];
    }

}
@end
