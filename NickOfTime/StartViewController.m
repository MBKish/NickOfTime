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
#import "FUIAlertView.h"

@interface StartViewController (){
    
    __weak IBOutlet FUIButton *startButton;
    __weak IBOutlet FUIButton *scoreButton;

}
- (IBAction)startGame:(id)sender;

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

    scoreButton.hidden = YES;
    
    startButton.buttonColor = [UIColor alizarinColor];
    startButton.shadowColor = [UIColor pomegranateColor];
    startButton.shadowHeight = 3.0f;
    startButton.cornerRadius = 6.0f;
    startButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [startButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];

    scoreButton.buttonColor = [UIColor alizarinColor];
    scoreButton.shadowColor = [UIColor pomegranateColor];
    scoreButton.shadowHeight = 3.0f;
    scoreButton.cornerRadius = 6.0f;
    scoreButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
    [scoreButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [scoreButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startGame:(id)sender {
    FUIAlertView *alertView = [[FUIAlertView alloc] initWithTitle:@"Hello" message:@"Complete five challenges to move on." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:@"Begin", nil];
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

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0){
        //cancel clicked ...do your action
    }else if (buttonIndex == 1){
        [self performSegueWithIdentifier:@"toGame" sender:self];
    }
}

@end
