//
//  PressButtonViewController.m
//  NickOfTime
//
//  Created by Brian Dinh on 8/15/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//
#import "ColorButtons.h"
#import "PressButtonViewController.h"

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

}

@end

@implementation PressButtonViewController

@synthesize delegate;

- (void)viewDidLoad
{
    red = [UIColor redColor];
    blue = [UIColor blueColor];
    yellow = [UIColor yellowColor];
    colorArray = @[red,blue,yellow];
    colorLabelArray = @[@"red", @"blue", @"yellow"];
    playDictionary = [[NSMutableDictionary alloc] initWithObjects:colorArray forKeys:colorLabelArray];

    
    CGPoint center = self.view.center;
    NSLog(@"x = %f y=%f", center.x, center.y);
    NSLog(@"self.view.frame.size.height = %f ", self.view.frame.size.height);
    NSLog(@"self.view.frame.size.height/2 = %f ", self.view.frame.size.height/2);
    
    
    ColorButtons *button2 = [[ColorButtons alloc] initWithFrame:CGRectMake(center.x-40, 155-40, 80, 80)];
    ColorButtons *button1 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button2.frame, -100, 0)];
    ColorButtons *button3 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button2.frame, 100, 0)];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    button1.tag = 0;
    button2.tag = 1;
    button3.tag = 2;
    
    [super viewDidLoad];
	
    for (UIView * subview in self.view.subviews){
        if ([subview isKindOfClass:[ColorButtons class]]) {
            [subview setUserInteractionEnabled:YES];
            ColorButtons * colorButton = (ColorButtons *) subview;
            colorButton.pressButtonsDelegate = self;
        }}
    //[self startDemo:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[ColorButtons class]]) {
            subview.hidden = YES;
        }
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[ColorButtons class]]) {
            subview.hidden = NO;
        }
    }
    [self startDemo:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startDemo:(id)sender {
    for (UIView * subview in self.view.subviews){
        if ([subview isKindOfClass:[ColorButtons class]]){
            [subview setAlpha:1.0];
            ColorButtons *view = (ColorButtons*) subview;
            view.layer.borderWidth = 2;
            view.layer.cornerRadius = 40;
            
            subview.transform = CGAffineTransformScale(subview.transform, 0.01, 0.01);
            
        }}

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
        //NSLog(@"colorarray %lu", (unsigned long)[playColorArray count]);
        
    } textInstruction.text = [NSString stringWithFormat:@"Press the %@ button then the %@ button", gameLabelArray[0], gameLabelArray[1]];
    playArray = [[NSMutableArray alloc] initWithCapacity:5];
    [playArray addObject:[playDictionary objectForKey:gameLabelArray[0]]];
    [playArray addObject:[playDictionary objectForKey:gameLabelArray[1]]];
    //NSLog(@"playRray%i",[playArray count]);
    gameLabelArray = nil;
    
    for (UIView * subview in self.view.subviews){
        for (int counter = 0; counter < 4; counter++) {
            if ([subview isKindOfClass:[ColorButtons class]]){
                if (subview.tag == counter){
                    subview.backgroundColor = playColorArray[counter];
                    
                    [UIView animateWithDuration:0.3 animations:^{
                        
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
        NSLog(@"Success!");
        [delegate didWinGame];
        //[self startDemo:self];
        
    }else{
        NSLog(@"Fail!");
        [delegate didLoseGame];
        //[self startDemo:self];
    }
}

@end
