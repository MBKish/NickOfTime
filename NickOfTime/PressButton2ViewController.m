//
//  PressButton2ViewController.m
//  NickOfTime
//
//  Created by Brian Dinh on 8/26/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//
#import "ColorButtons.h"
#import "PressButton2ViewController.h"

@interface PressButton2ViewController ()
{
    int gameCounter;
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
    NSArray *colorArray;
    NSMutableArray *randomColorArray;
    NSMutableArray *playColorArray;
    __weak IBOutlet UILabel *notificationLabel;
}

@end

@implementation PressButton2ViewController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
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
    colorArray = @[color1,color2,color3,color4,color5,color6,color7,color8,color9];
    
    CGPoint center = self.view.center;
    //NSLog(@"x = %f y=%f", center.x, center.y);
    //NSLog(@"self.view.frame.size.height = %f ", self.view.frame.size.height);
    //NSLog(@"self.view.frame.size.height/2 = %f ", self.view.frame.size.height/2);
    
    
    ColorButtons *button5Origin = [[ColorButtons alloc] initWithFrame:CGRectMake(center.x-40, 155-40, 80, 80)];
    ColorButtons *button1 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, -100, -100)];
    ColorButtons *button2 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 0, -100)];
    ColorButtons *button3 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 100, -100)];
    ColorButtons *button4 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, -100, 0)];
    ColorButtons *button6 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 100, 0)];
    ColorButtons *button7 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, -100, 100)];
    ColorButtons *button8 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 0, 100)];
    ColorButtons *button9 = [[ColorButtons alloc] initWithFrame:CGRectOffset(button5Origin.frame, 100, 100)];
    
    NSArray* buttonArray = @[button1, button2, button3, button4, button5Origin, button6, button7, button8, button9];
    
    [super viewDidLoad];
    
    for (ColorButtons* obj in buttonArray) {
        [self.view addSubview:obj];
    }
    
    int element = 0;
    for (ColorButtons* subview in buttonArray) {
        subview.tag = element;
        element++;
        [subview setUserInteractionEnabled:YES];
        [subview setHidden:YES];
        //[self.view addSubview:subview];
        ColorButtons * colorButton = (ColorButtons *) subview;
        colorButton.pressButtonsDelegate = self;
        
    }
	
    for (UIView * subview in self.view.subviews){
        if ([subview isKindOfClass:[ColorButtons class]]) {
            ColorButtons * colorButton = (ColorButtons *) subview;
            colorButton.pressButtonsDelegate = self;
        }}
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
    [self startDemoGame2:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)startDemoGame2:(id)sender
{
    gameCounter = 0;
    for (UIView * subview in self.view.subviews){
        if ([subview isKindOfClass:[ColorButtons class]]){
            [subview setAlpha:1.0];
            ColorButtons *view = (ColorButtons*) subview;
            view.layer.borderWidth = 2;
            view.layer.cornerRadius = 40;
            [UIView animateWithDuration:0.0 animations:^{
                subview.transform = CGAffineTransformScale(subview.transform, 0.01, 0.01);
                
            }];
        }}
    notificationLabel.text = @"Extinguish all the lights";
    NSMutableArray* gameColorArray = [[NSMutableArray alloc] initWithArray:colorArray];
    randomColorArray = [[NSMutableArray alloc] initWithCapacity:10];
    for (int num = 0; num < ([colorArray count]); num++) {
        int colorCounter = arc4random()%([colorArray count]-num);
        //int altCounter = arc4random()%(3-num);
        [randomColorArray addObject:gameColorArray[colorCounter]];
        [gameColorArray removeObjectAtIndex:colorCounter];
        //NSLog(@" randomcolorarray %lu",(unsigned long)[randomColorArray count]);
    }
    for (UIView * subview in self.view.subviews){
        for (int counter = 0; counter < [colorArray count]; counter++) {
            if ([subview isKindOfClass:[ColorButtons class]]){
                if (subview.tag == counter){
                    subview.backgroundColor = randomColorArray[counter];
                    [UIView animateWithDuration:1.0 animations:^{
                        subview.transform = CGAffineTransformScale(subview.transform, 100, 100);
                    }];
                    
                }
            }
        }
    }
}

-(void) didClickGameView: (ColorButtons *) thisView
{
    if (thisView.backgroundColor != black) {
        //thisView.backgroundColor = black;
        playColorArray = [[NSMutableArray alloc] initWithArray:randomColorArray];
        [randomColorArray replaceObjectAtIndex:thisView.tag withObject:black];
        [playColorArray removeObjectAtIndex:thisView.tag];
        gameCounter++;
        
        if (gameCounter == colorArray.count) {
            notificationLabel.text = @"Winner, winner!";
            [delegate didWinGame];
        }
 
        
        for (NSInteger i = playColorArray.count-1; i > 0; i--)
        {
            [playColorArray exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform(i+1)];
            NSLog(@"%@, %i X", playColorArray[i], i);
        }
        [playColorArray insertObject:black atIndex:thisView.tag];
        
        //NSLog(@"%@,%@", playColorArray[0], playColorArray[8]);
        for (UIView * subview in self.view.subviews){
            for (int counter = 0; counter < [colorArray count]; counter++) {
                if ([subview isKindOfClass:[ColorButtons class]]){
                    if (subview.tag == counter){
                        subview.backgroundColor = playColorArray[counter];
                        NSLog(@"%@, %i F", playColorArray[counter], counter);
                    }}}}
    }
    randomColorArray = playColorArray;
}

@end
