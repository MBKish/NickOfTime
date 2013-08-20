//
//  PressButtonViewController.m
//  NickOfTime
//
//  Created by Brian Dinh on 8/15/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import "PressButtonViewController.h"
#import "ColorButtons.h"


@interface PressButtonViewController ()
{
    int gameCounter;
    BOOL correct;
    UIColor *red;
    UIColor *blue;
    UIColor *yellow;
    NSArray *colorArray;
    NSMutableArray * gameLabelArray;
    NSMutableDictionary *playDictionary;
    NSArray * viewArray;
    NSArray * colorLabelArray;
    NSMutableArray *playArray;
    NSMutableArray * mutableColorLabelArray;
    __weak IBOutlet UILabel *textInstruction;
    __weak IBOutlet UILabel *successLabel;
    __weak IBOutlet UILabel *lossLabel;
}
- (IBAction)startDemo:(id)sender;

@end

@implementation PressButtonViewController

- (void)viewDidLoad
{
    red = [UIColor redColor];
    blue = [UIColor blueColor];
    yellow = [UIColor yellowColor];
    colorArray = @[red,blue,yellow];
    colorLabelArray = @[@"redColor", @"blueColor", @"yellowColor"];
    playDictionary = [[NSMutableDictionary alloc] initWithObjects:colorArray forKeys:colorLabelArray];
    //viewArray = @[@(0), @(1), @(2)];
    
    //NSLog(@"clu%lu",(unsigned long)[colorLabelArray count]);
    //mutableColorLabelArray = [[NSMutableArray alloc] initWithArray:colorLabelArray];
    
    [super viewDidLoad];
	
    for (UIView * subview in self.view.subviews){
        if ([subview isKindOfClass:[ColorButtons class]]) {
            ColorButtons * colorButton = (ColorButtons *) subview;
            colorButton.pressButtonsDelegate = self;
        }}
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startDemo:(id)sender {
    for (UIView * subview in self.view.subviews){
        if ([subview isKindOfClass:[ColorButtons class]]){
            [subview setAlpha:1.0];
            ColorButtons *view = (ColorButtons*) subview;
            view.layer.borderWidth = 2;
            view.layer.cornerRadius = 40;
            
            subview.transform = CGAffineTransformScale(subview.transform, 0.01, 0.01);
        }}
    successLabel.transform = CGAffineTransformScale(successLabel.transform, 0.01, 0.01);
    //lossLabel.transform = CGAffineTransformScale(lossLabel.transform, 0.01, 0.01);
    
    [successLabel setHidden:YES];
    [lossLabel setHidden:YES];
    gameCounter = 0;
    correct = NO;
    mutableColorLabelArray = [[NSMutableArray alloc] initWithArray:colorLabelArray];
    gameLabelArray = [[NSMutableArray alloc] initWithCapacity:10];
    NSMutableArray* mutableColorArray = [[NSMutableArray alloc] initWithArray:colorArray];
    NSMutableArray* playColorArray = [[NSMutableArray alloc] initWithCapacity:10];
    for (int num = 0; num < ([colorArray count]); num++) {
        int random = arc4random()%(3-num);
        int altRandom = arc4random()%(3-num);
        [gameLabelArray addObject:mutableColorLabelArray[random]];
        [mutableColorLabelArray removeObjectAtIndex:random];
        [playColorArray addObject:mutableColorArray[altRandom]];
        [mutableColorArray removeObjectAtIndex:altRandom];
        NSLog(@"colorarray %lu", (unsigned long)[playColorArray count]);
        
    } textInstruction.text = [NSString stringWithFormat:@"Press the %@ button then the %@ button", gameLabelArray[0], gameLabelArray[1]];
    playArray = [[NSMutableArray alloc] initWithCapacity:5];
    [playArray addObject:[playDictionary objectForKey:gameLabelArray[0]]];
    [playArray addObject:[playDictionary objectForKey:gameLabelArray[1]]];
    NSLog(@"playRray%i",[playArray count]);
    gameLabelArray = nil;
    
    for (UIView * subview in self.view.subviews){
        for (int counter = 0; counter < 4; counter++) {
            if ([subview isKindOfClass:[ColorButtons class]]){
                if (subview.tag == counter){
                    subview.backgroundColor = playColorArray[counter];
                    
                    [UIView animateWithDuration:1.0 animations:^{
                        
                        subview.transform = CGAffineTransformScale(subview.transform, 100, 100);
                    }];
                    
                }
            }
        }
    }
    
}
-(void) didClickGame1View:(ColorButtons *)thisView
{
    if ((gameCounter == 0) && (thisView.backgroundColor == playArray[gameCounter])) {
        gameCounter++;
        correct = YES;
        thisView.layer.borderWidth = 6;
        [thisView setAlpha:0.5];
    }else if ((correct = YES) && (thisView.backgroundColor == playArray[gameCounter])){
        [successLabel setHidden:NO];
        [UIView animateWithDuration:0.7 animations:^{
            //successLabel.transform = CGAffineTransformMakeRotation(M_PI);
            successLabel.transform = CGAffineTransformScale(successLabel.transform, 100, 100);
            //along w/rotate above will go forward then back(may need *2 below)(scale transform above excluded)
            /* }completion:^(BOOL finished) {
             [UIView animateWithDuration:0.5 animations:^{
             successLabel.transform = CGAffineTransformMakeRotation(M_PI * 4);
             }];*/
        }];
        
    }else{
        [lossLabel setHidden:NO];
        lossLabel.transform = CGAffineTransformScale(successLabel.transform, 0.01, 0.01);
        [UIView animateWithDuration:0.7 animations:^{
            lossLabel.transform = CGAffineTransformMakeRotation(M_PI);
            lossLabel.transform = CGAffineTransformScale(lossLabel.transform, 100, 100);
            //along w/rotate above will go forward then back(may need *2 below)(scale transform above excluded)
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.5 animations:^{
                lossLabel.transform = CGAffineTransformMakeRotation(M_PI * 4);
            }];
        }];
    }
}

@end
