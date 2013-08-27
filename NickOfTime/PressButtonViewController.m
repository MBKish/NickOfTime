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
    int level;
    int gameCounter;
    CGPoint center;
    //Level 0
    BOOL correct;
    UIColor *red;
    UIColor *blue;
    UIColor *yellow;
    NSArray *colorArray1;
    NSMutableArray * gameLabelArray;
    NSMutableDictionary *playDictionary;
    NSArray * viewArray;
    NSArray * colorLabelArray;
    NSMutableArray *playArray;
    NSMutableArray * mutableColorLabelArray;
    //Level 1
    UIColor *color1;
    UIColor *color2;
    UIColor *color3;
    UIColor *color4;
    UIColor *color5;
    UIColor *color6;
    UIColor *color7;
    UIColor *color8;
    UIColor *color9;
    UIColor *black;
    NSMutableArray *colorArray2;
    NSMutableArray *randomColorArray2;
    NSMutableArray *playColorArray2;
    __weak IBOutlet UILabel *textInstruction;

}

@end

@implementation PressButtonViewController

@synthesize delegate;

- (void)viewDidLoad
{
    //Level 0
    red = [UIColor redColor];
    blue = [UIColor blueColor];
    yellow = [UIColor yellowColor];
    colorArray1 = @[red,blue,yellow];
    colorLabelArray = @[@"red", @"blue", @"yellow"];
    playDictionary = [[NSMutableDictionary alloc] initWithObjects:colorArray1 forKeys:colorLabelArray];
    //Level 1
    color1 =[UIColor colorWithRed:13/255.0f green:168/255.0f blue:185/255.0f alpha:1.0f];
    color2 =[UIColor colorWithRed:255/255.0f green:60/255.0f blue:75/255.0f alpha:1.0f];
    color3 =[UIColor colorWithRed:62/255.0f green:243/255.0f blue:73/255.0f alpha:1.0f];
    color4 =[UIColor colorWithRed:57/255.0f green:247/255.0f blue:252/255.0f alpha:1.0f];
    color5 =[UIColor colorWithRed:234/255.0f green:33/255.0f blue:209/255.0f alpha:1.0f];
    color6 =[UIColor colorWithRed:239/255.0f green:188/255.0f blue:78/255.0f alpha:1.0f];
    color7 =[UIColor colorWithRed:135/255.0f green:32/255.0f blue:192/255.0f alpha:1.0f];
    color8 =[UIColor colorWithRed:135/255.0f green:252/255.0f blue:192/255.0f alpha:1.0f];
    color9 =[UIColor colorWithRed:151/255.0f green:168/255.0f blue:49/255.0f alpha:1.0f];
    black = [UIColor blackColor];
    
    level = 1;


    center = self.view.center;
    
    [self setup];

    
    [super viewDidLoad];
	
    for (UIView * subview in self.view.subviews){
        if ([subview isKindOfClass:[ColorButtons class]]) {
            [subview setUserInteractionEnabled:YES];
            ColorButtons * colorButton = (ColorButtons *) subview;
            colorButton.pressButtonsDelegate = self;
        }}
    //[self startDemo:self];
}
-(void) setup
{
    if (level == 0) {
        ColorButtons *button2 = [[ColorButtons alloc] initWithFrame:CGRectMake(center.x-40, 155-40, 80, 80)];
        ColorButtons *button1 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button2.frame, -100, 0)];
        ColorButtons *button3 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button2.frame, 100, 0)];
        [self.view addSubview:button1];
        [self.view addSubview:button2];
        [self.view addSubview:button3];
        button1.tag = 0;
        button2.tag = 1;
        button3.tag = 2;
       
    } else if (level == 1){
        ColorButtons *button5Origin = [[ColorButtons alloc] initWithFrame:CGRectMake(center.x-40, 155-40, 80, 80)];
        //ColorButtons *button1 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, -100, -100)];
        ColorButtons *button2 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 0, -100)];
        //ColorButtons *button3 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 100, -100)];
        ColorButtons *button4 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, -100, 0)];
        ColorButtons *button6 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 100, 0)];
        //ColorButtons *button7 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, -100, 100)];
        ColorButtons *button8 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 0, 100)];
        //ColorButtons *button9 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 100, 100)];
        
        //below for build with 9 buttons
        //NSArray* buttonArray = @[button1, button2, button3, button4, button5Origin, button6, button7, button8, button9];
        NSArray* buttonArray = @[button2, button4, button5Origin, button6, button8];
        
        [super viewDidLoad];
        
        for (ColorButtons* obj in buttonArray) {
            [self.view addSubview:obj];
        }
        int element = 0;
        for (ColorButtons* subview in buttonArray) {
            subview.tag = element;
            element++;
        }
       
    } else if (level == 2){
        NSLog(@"level2");
    } 
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
    level = 1;
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
            if (level == 2) {
                view.layer.cornerRadius = 35;
            } else {
                view.layer.cornerRadius = 40;
            }
            
            subview.transform = CGAffineTransformScale(subview.transform, 0.01, 0.01);
            
        }}
    gameCounter = 0;
    
    if (level == 0) {
        correct = NO;
        mutableColorLabelArray = [[NSMutableArray alloc] initWithArray:colorLabelArray];
        gameLabelArray = [[NSMutableArray alloc] initWithCapacity:10];
        NSMutableArray* mutableColorArray = [[NSMutableArray alloc] initWithArray:colorArray1];
        NSMutableArray* playColorArray = [[NSMutableArray alloc] initWithCapacity:10];
        for (int num = 0; num < ([colorArray1 count]); num++) {
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
        
    } else if (level == 1){
        NSMutableArray* selectColorArray = [[NSMutableArray alloc] initWithObjects:color1,color2,color3,color4,color5,color6,color7,color8,color9, nil];
        NSMutableArray* setupColorArray = [[NSMutableArray alloc] initWithArray:selectColorArray];
        colorArray2 = [[NSMutableArray alloc] initWithCapacity:10];
        for (int num = 0; num < 5; num++) {
            int colorCounter = arc4random()%([selectColorArray count]-num);
            [colorArray2 addObject:setupColorArray[colorCounter]];
            [setupColorArray removeObjectAtIndex:colorCounter];
        }
        textInstruction.text = @"Extinguish all the lights";
        NSMutableArray* gameColorArray = [[NSMutableArray alloc] initWithArray:colorArray2];
        randomColorArray2 = [[NSMutableArray alloc] initWithCapacity:10];
        for (int num = 0; num < ([colorArray2 count]); num++) {
            int colorCounter = arc4random()%([colorArray2 count]-num);
            //int altCounter = arc4random()%(3-num);
            [randomColorArray2 addObject:gameColorArray[colorCounter]];
            [gameColorArray removeObjectAtIndex:colorCounter];
            //NSLog(@" randomcolorarray %lu",(unsigned long)[randomColorArray count]);
        }
        for (UIView * subview in self.view.subviews){
            for (int counter = 0; counter < [colorArray2 count]; counter++) {
                if ([subview isKindOfClass:[ColorButtons class]]){
                    if (subview.tag == counter){
                        subview.backgroundColor = randomColorArray2[counter];
                        [UIView animateWithDuration:1.0 animations:^{
                            subview.transform = CGAffineTransformScale(subview.transform, 100, 100);
                        }];
                        
                    }
                }
            }
        }
        
    } else if (level == 2){
        NSLog(@"level2");
    }
    
 
}
-(void) didClickGameView:(ColorButtons *)thisView
{
    if (level == 0) {
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
            [self startDemo:self];
        }
        
    } else if (level == 1){
        if (thisView.backgroundColor != black) {
            //thisView.backgroundColor = black;
            playColorArray2 = [[NSMutableArray alloc] initWithArray:randomColorArray2];
            [randomColorArray2 replaceObjectAtIndex:thisView.tag withObject:black];
            [playColorArray2 removeObjectAtIndex:thisView.tag];
            gameCounter++;
            
            if (gameCounter == colorArray2.count) {
                textInstruction.text = @"Winner, winner!";
                [delegate didWinGame];
            }
            
            
            for (NSInteger i = playColorArray2.count-1; i > 0; i--)
            {
                [playColorArray2 exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform(i+1)];
                NSLog(@"%@, %i X", playColorArray2[i], i);
            }
            [playColorArray2 insertObject:black atIndex:thisView.tag];
            
            //NSLog(@"%@,%@", playColorArray[0], playColorArray[8]);
            for (UIView * subview in self.view.subviews){
                for (int counter = 0; counter < [colorArray2 count]; counter++) {
                    if ([subview isKindOfClass:[ColorButtons class]]){
                        if (subview.tag == counter){
                            subview.backgroundColor = playColorArray2[counter];
                            NSLog(@"%@, %i F", playColorArray2[counter], counter);
                        }}}}
        }
        randomColorArray2 = playColorArray2;

        
    } else if (level == 2){
        NSLog(@"level2");
    }
    

}

@end
