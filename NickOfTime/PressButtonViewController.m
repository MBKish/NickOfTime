//
//  PressButtonViewController.m
//  NickOfTime
//
//  Created by Brian Dinh on 8/15/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//
#import "ColorButtons.h"
#import "PressButtonViewController.h"
#import "UIColor+FlatUI.h"

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
    
    //Level 2
    int offset;
    int frameSize;
    float spin;
    UIView *button0;
    ColorButtons *button1PB3;
    ColorButtons *button2PB3;
    ColorButtons *button3PB3;
    ColorButtons *button4PB3;
    ColorButtons *button5PB3;
    ColorButtons *button6PB3;
    ColorButtons *button7PB3;
    ColorButtons *button8PB3;
    ColorButtons *button9PB3;
    CGRect frame1;
    CGRect frame2;
    CGRect frame3;
    CGRect frame4;
    CGRect frame5;
    CGRect frame6;
    CGRect frame7;
    CGRect frame8;
    CGRect frame9;
    NSMutableArray *colorArray3;
    NSArray *buttonArray3;
    NSArray *frameArray;
    NSMutableArray *playButtonArray3;
    NSMutableArray *playFrameArray;

    __weak IBOutlet UILabel *textInstruction;


}

@end

@implementation PressButtonViewController

@synthesize delegate;

- (void)viewDidLoad
{
    //Level 0
    //selectedColor =[UIColor colorWithRed:14.0/255.0 green:114.0/255.0 blue:199.0/255.0 alpha:1];
    //blue = rgb(52, 152, 219)
    red = [UIColor alizarinColor];
    blue = [UIColor peterRiverColor];
    yellow = [UIColor sunflowerColor];
    colorArray1 = @[red,blue,yellow];
    colorLabelArray = @[@"red", @"blue", @"yellow"];
    playDictionary = [[NSMutableDictionary alloc] initWithObjects:colorArray1 forKeys:colorLabelArray];
    
    //Level 1
    color1 =[UIColor turquoiseColor];
    color2 =[UIColor emerlandColor];
    color3 =[UIColor peterRiverColor];
    color4 =[UIColor amethystColor];
    color5 =[UIColor turquoiseColor];
    color6 =[UIColor wetAsphaltColor];
    color7 =[UIColor sunflowerColor];
    color8 =[UIColor concreteColor];
    color9 =[UIColor alizarinColor];
    black = [UIColor blackColor];
    
    //level = 1;
    
    
    center = self.view.center;
    
    [self setup];
    
    
    [super viewDidLoad];
    
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(swapLevel:) name:@"nextLevel" object:nil];
    [notificationCenter addObserver:self selector:@selector(restartLevel:) name:@"restartGame" object:nil];
	
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
    /*if (level == 0) {
        [self createPB1Buttons];
        
    } else if (level == 1){
        [self createPB2Buttons];
        
    } *///else if (level == 2){
        //colorArray3 = [[NSMutableArray alloc] initWithObjects:color1,color2,color3,color4,color5,color6,color7,color8,color9, nil];
        offset = 95;
        frameSize = 70;
        spin = 0;
        
        NSMutableArray* selectColorArray3 = [[NSMutableArray alloc] initWithObjects:color1,color2,color3,color4,color5,color6,color7,color8,color9, nil];
        NSMutableArray* setupColorArray3 = [[NSMutableArray alloc] initWithArray:selectColorArray3];
        colorArray3 = [[NSMutableArray alloc] initWithCapacity:10];
        for (int num = 0; num < 5; num++) {
            int colorCounter = arc4random()%([selectColorArray3 count]-num);
            [colorArray3 addObject:setupColorArray3[colorCounter]];
            [setupColorArray3 removeObjectAtIndex:colorCounter];
        }
        //////////\\\\\\\\\\\\\\\
        //To adjust the number of starting lights for game, must delete from colorArray and buttonArray to match that size. This is now set for max size 9; can adjust dowward.
        //views are moved via entire frame, but maybe could be moved by just referencing a new CGPoint center, etc..
        //playButtonArray and playFrameArray may be needed in app implementation, but may be unnecessary and could just reload buttonArray and frameArray each time
        // Do any additional setup after loading the view.
        
        //CGPoint center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
        
        [self createPB3Buttons];
        
    //}
}
-(void)createPB1Buttons
{
    ColorButtons *button2 = [[ColorButtons alloc] initWithFrame:CGRectMake(center.x-40, 155, 80, 80)];
    ColorButtons *button1 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button2.frame, -100, 0)];
    ColorButtons *button3 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button2.frame, 100, 0)];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    button1.tag = 0;
    button2.tag = 1;
    button3.tag = 2;
}
-(void)createPB2Buttons
{
    ColorButtons *button5Origin = [[ColorButtons alloc] initWithFrame:CGRectMake(center.x-40, 155-0, 70, 70)];
    //ColorButtons *button1 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, -100, -100)];
    ColorButtons *button2 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 0, -90)];
    //ColorButtons *button3 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 100, -100)];
    ColorButtons *button4 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, -90, 0)];
    ColorButtons *button6 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 90, 0)];
    //ColorButtons *button7 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, -100, 100)];
    ColorButtons *button8 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 0, 90)];
    //ColorButtons *button9 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 100, 100)];
    
    //below for build with 9 buttons
    //NSArray* buttonArray = @[button1, button2, button3, button4, button5Origin, button6, button7, button8, button9];
    NSArray* buttonArray = @[button2, button4, button5Origin, button6, button8];
    
    int element = 0;
    for (ColorButtons* subview in buttonArray) {
        [self.view addSubview:subview];
        subview.tag = element;
        element++;
        
    }
}
-(void)createPB3Buttons
{
    button0 = [[UIView alloc] initWithFrame: CGRectMake(center.x - frameSize/2, 155,frameSize,frameSize)];
    //[button0 setCenter: self.view.center];
    
    button1PB3 = [[ColorButtons alloc] init];
    button2PB3 = [[ColorButtons alloc] init];
    button3PB3 = [[ColorButtons alloc] init];
    button4PB3 = [[ColorButtons alloc] init];
    button5PB3 = [[ColorButtons alloc] init];
    //    button6PB3 = [[ColorButtons alloc] init];
    //    button7PB3 = [[ColorButtons alloc] init];
    //    button8PB3 = [[ColorButtons alloc] init];
    //    button9PB3 = [[ColorButtons alloc] init];
    //    buttonArray3 = [[NSArray alloc] initWithObjects:button1PB3, button2PB3, button3PB3, button4PB3, button5PB3, button6PB3, button7PB3, button8PB3, button9PB3, nil];
    buttonArray3 = [[NSArray alloc] initWithObjects:button1PB3, button2PB3, button3PB3, button4PB3, button5PB3, nil];
    playButtonArray3 = [[NSMutableArray alloc] initWithArray:buttonArray3];
    
    frame1 = CGRectOffset(button0.frame, offset* cosf((1*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((1*(2*M_PI)/playButtonArray3.count) + spin));
    frame2 = CGRectOffset(button0.frame, offset* cosf((2*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((2*(2*M_PI)/playButtonArray3.count) + spin));
    frame3 = CGRectOffset(button0.frame, offset* cosf((3*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((3*(2*M_PI)/playButtonArray3.count) + spin));
    frame4 = CGRectOffset(button0.frame, offset* cosf((4*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((4*(2*M_PI)/playButtonArray3.count) + spin));
    frame5 = CGRectOffset(button0.frame, offset* cosf((5*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((5*(2*M_PI)/playButtonArray3.count) + spin));
    frame6 = CGRectOffset(button0.frame, offset* cosf((6*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((6*(2*M_PI)/playButtonArray3.count) + spin));
    frame7 = CGRectOffset(button0.frame, offset* cosf((7*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((7*(2*M_PI)/playButtonArray3.count) + spin));
    frame8 = CGRectOffset(button0.frame, offset* cosf((8*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((8*(2*M_PI)/playButtonArray3.count) + spin));
    frame9 = CGRectOffset(button0.frame, offset* cosf((9*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((9*(2*M_PI)/playButtonArray3.count) + spin));
    
    frameArray = [[NSArray alloc] initWithObjects:[NSValue valueWithCGRect:frame1], [NSValue valueWithCGRect:frame2], [NSValue valueWithCGRect:frame3], [NSValue valueWithCGRect:frame4], [NSValue valueWithCGRect:frame5], [NSValue valueWithCGRect:frame6], [NSValue valueWithCGRect:frame7], [NSValue valueWithCGRect:frame8], [NSValue valueWithCGRect:frame9], nil];
    
    //using buttonArray as alternate to isKind ofClass iteration
    
    //needed to add subviews above before could do below
    int element = 0;
    for (ColorButtons* subview in buttonArray3) {
        [self.view addSubview:subview];
        //tag not used in current version
        subview.tag = element;
        subview.frame = button0.frame;
        element++;
        
    }
    
}
-(void)swapLevel:(id)sender{
    if (level <2) {
        level = level +1;
    }
}

-(void)restartLevel:(id)sender{
    level = 0;
    //[self startDemo:self];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[ColorButtons class]]){
        [subview removeFromSuperview];
        }}
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
    //level = 1;
    //Put the IBAction stuff here OR fix startDemo to do the setup stuff (Rect coords etc) for you
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)startDemo:(id)sender {

    gameCounter = 0;
    
    if (level == 0) {
        
        [self createPB1Buttons];
        
        for (UIView * subview in self.view.subviews){
            if ([subview isKindOfClass:[ColorButtons class]]){
                [subview setAlpha:1.0];
                [subview setUserInteractionEnabled:YES];
                ColorButtons *view = (ColorButtons*) subview;
                view.pressButtonsDelegate = self;
                //view.layer.borderWidth = 2;
                view.layer.cornerRadius = 40;
                subview.transform = CGAffineTransformScale(subview.transform, 0.01, 0.01);
            }
           
        }
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
            
        }
        
        textInstruction.text = [NSString stringWithFormat:@"Tap %@ then %@", gameLabelArray[0], gameLabelArray[1]];
        
        NSLog(@" %@ %@", gameLabelArray[0], gameLabelArray[1]);
        NSLog(@"%@", textInstruction.text);
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
        
        [self createPB2Buttons];
        
        for (UIView * subview in self.view.subviews){
            if ([subview isKindOfClass:[ColorButtons class]]){
                [subview setAlpha:1.0];
                [subview setUserInteractionEnabled:YES];
                ColorButtons *view = (ColorButtons*) subview;
                view.pressButtonsDelegate = self;
                //view.layer.borderWidth = 2;
                view.layer.cornerRadius = 35;
                subview.transform = CGAffineTransformScale(subview.transform, 0.01, 0.01);
            }
            
        }
        
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
                        [UIView animateWithDuration:0.3 animations:^{
                            subview.transform = CGAffineTransformScale(subview.transform, 100, 100);
                        }];
                        
                    }
                }
            }
        }
        
    } else if (level == 2){
        for (UIView *subview in self.view.subviews) {
            if ([subview isKindOfClass:[ColorButtons class]]){
            [subview removeFromSuperview];
            }}
        
        
        [self createPB3Buttons];
        
        for (UIView * subview in self.view.subviews){
            if ([subview isKindOfClass:[ColorButtons class]]){
                [subview setUserInteractionEnabled:YES];
                [subview setAlpha:1.0];
                ColorButtons *view = (ColorButtons*) subview;
                view.pressButtonsDelegate = self;
                //view.layer.borderWidth = 2;
                view.layer.cornerRadius = 35;
                view.transform = CGAffineTransformScale(subview.transform, 0.01, 0.01);
            }
        }
        
        
        playButtonArray3 = [[NSMutableArray alloc] initWithArray:buttonArray3];
        playFrameArray = [[NSMutableArray alloc] initWithArray:frameArray];
        for (NSInteger i = colorArray3.count-1; i > 0; i--)
        {
            [colorArray3 exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform(i+1)];
        }
        int frameElement = 0;
        for (UIView * subview in self.view.subviews){
            if ([subview isKindOfClass:[ColorButtons class]]){
                [subview setAlpha:1.0];
                ColorButtons *view = (ColorButtons*) subview;
                view.backgroundColor = colorArray3[frameElement];
                //                view.layer.borderWidth = 2;
                //                view.layer.cornerRadius = 35;
                view.center = self.view.center;
                
                //                subview.transform = CGAffineTransformScale(subview.transform, 0.01, 0.01);
                //                [subview setHidden:NO];
                //                [subview setUserInteractionEnabled:YES];
                [UIView animateWithDuration:0.2 animations:^{
                    subview.transform = CGAffineTransformScale(subview.transform, 100, 100);
                }completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.2 animations:^{
                        subview.frame = [frameArray[frameElement] CGRectValue];
                    }];
                }];
                frameElement++;
            }
        }textInstruction.text = @"Extinguish all the lights";
        
    }
    
    
}
-(void) didClickGameView:(ColorButtons *)thisView
{
    if (level == 0) {
        if ((gameCounter == 0) && ([thisView.backgroundColor isEqual: playArray[gameCounter]])) {
            gameCounter++;
            correct = YES;
            //thisView.layer.borderWidth = 6;
            [thisView setAlpha:0.5];
        }else if ((correct = YES) && ([thisView.backgroundColor isEqual: playArray[gameCounter]])){
            NSLog(@"Success!");
            [delegate didWinGame];
            for (UIView *subview in self.view.subviews) {
                if ([subview isKindOfClass:[ColorButtons class]]){
                    [subview removeFromSuperview];
                }}
            //[self startDemo:self];
            
        }else{
            NSLog(@"Fail!");
            [delegate didLoseGame];
            for (UIView *subview in self.view.subviews) {
                if ([subview isKindOfClass:[ColorButtons class]]){
                    [subview removeFromSuperview];
                }}
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
                
                //textInstruction.text = @"Winner, winner!";
                [delegate didWinGame];
                for (UIView *subview in self.view.subviews) {
                    if ([subview isKindOfClass:[ColorButtons class]]){
                        [subview removeFromSuperview];
                    }}
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
        [playButtonArray3 removeObject:thisView];
        [thisView setUserInteractionEnabled:NO];
        gameCounter++;
        NSLog(@"buttonArray %lu", (unsigned long)buttonArray3.count);
        NSLog(@"gamecounter %i", gameCounter);
        NSLog(@"playframearray %lu", (unsigned long)playFrameArray.count);
        if (gameCounter == colorArray3.count) {
            
            
            [UIView animateWithDuration:0.3 animations:^{
                thisView.backgroundColor = black;
                [thisView setCenter: button0.center];
            }completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 animations:^{
                    for (ColorButtons *obj in buttonArray3){
                        //offset = 300;
                        obj.transform = CGAffineTransformScale(obj.transform, 0.01, 0.01);
                    }
                }completion:^(BOOL finished) {
//                    for (ColorButtons *obj in buttonArray3){
//                        [obj setHidden:YES];
//                        obj.transform = CGAffineTransformScale(obj.transform, 100, 100);
//                        
//                    }
                    //textInstruction.text = @"Winner, winner!";
                    [delegate didWinGame];
                    for (UIView *subview in self.view.subviews) {
                        if ([subview isKindOfClass:[ColorButtons class]]){
                            [subview removeFromSuperview];
                        }}
                }];
            }];
        }else{
            //        spin = (M_2_PI * arc4random_uniform(360))/360;
            
            frame1 = CGRectOffset(button0.frame, offset* cosf((1*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((1*(2*M_PI)/playButtonArray3.count) + spin));
            frame2 = CGRectOffset(button0.frame, offset* cosf((2*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((2*(2*M_PI)/playButtonArray3.count) + spin));
            frame3 = CGRectOffset(button0.frame, offset* cosf((3*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((3*(2*M_PI)/playButtonArray3.count) + spin));
            frame4 = CGRectOffset(button0.frame, offset* cosf((4*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((4*(2*M_PI)/playButtonArray3.count) + spin));
            frame5 = CGRectOffset(button0.frame, offset* cosf((5*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((5*(2*M_PI)/playButtonArray3.count) + spin));
            frame6 = CGRectOffset(button0.frame, offset* cosf((6*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((6*(2*M_PI)/playButtonArray3.count) + spin));
            frame7 = CGRectOffset(button0.frame, offset* cosf((7*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((7*(2*M_PI)/playButtonArray3.count) + spin));
            frame8 = CGRectOffset(button0.frame, offset* cosf((8*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((8*(2*M_PI)/playButtonArray3.count) + spin));
            frame9 = CGRectOffset(button0.frame, offset* cosf((9*(2*M_PI)/playButtonArray3.count) + spin), offset* sinf((9*(2*M_PI)/playButtonArray3.count) + spin));
            
            playFrameArray = [[NSMutableArray alloc] initWithObjects:[NSValue valueWithCGRect:frame1], [NSValue valueWithCGRect:frame2], [NSValue valueWithCGRect:frame3], [NSValue valueWithCGRect:frame4], [NSValue valueWithCGRect:frame5], [NSValue valueWithCGRect:frame6], [NSValue valueWithCGRect:frame7], [NSValue valueWithCGRect:frame8], [NSValue valueWithCGRect:frame9], nil];
            
            if (playButtonArray3.count > 1) {
                for (NSInteger i = playButtonArray3.count-1; i > 0; i--)
                {
                    [playButtonArray3 exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform(i+1)];
                }
            }
            [UIView animateWithDuration:0.1 animations:^{
                thisView.backgroundColor = black;
                [thisView setCenter: button0.center];
            }completion:^(BOOL finished) {
                spin = (2 * M_PI * arc4random_uniform(360))/360;
                NSLog(@"spin %f", spin);
                [UIView animateWithDuration:0.1 animations:^{
                    int frameElement = 0;
                    for (ColorButtons *obj in playButtonArray3) {
                        obj.frame = [playFrameArray[frameElement] CGRectValue];
                        frameElement++;
                        //NSLog(@"frame1 origin %@", NSStringFromCGPoint(frame1.origin));
                        //NSLog(@"spin %f", spin/M_2_PI);
                    }
                }];
            }];
            [self.view sendSubviewToBack:thisView];
        }
        
    }
    
    
}

@end
