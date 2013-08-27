//
//  PressButton3ViewController.m
//  NickOfTime
//
//  Created by Brian Dinh on 8/26/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//
#import "ColorButtons.h"
#import "PressButton3ViewController.h"

@interface PressButton3ViewController ()
{
    int gameCounter;
    int offset;
    int frameSize;
    float spin;
    UIColor *color1;
    UIColor *color2;
    UIColor *color3;
    UIColor *color4;
    UIColor *color5;
    UIColor *color6;
    UIColor *color7;
    UIColor *color8;
    UIColor *color9;
    UIColor *color10;
    UIColor *black;
    UIView *button0;
    ColorButtons *button1;
    ColorButtons *button2;
    ColorButtons *button3;
    ColorButtons *button4;
    ColorButtons *button5;
    ColorButtons *button6;
    ColorButtons *button7;
    ColorButtons *button8;
    ColorButtons *button9;
    CGRect frame1;
    CGRect frame2;
    CGRect frame3;
    CGRect frame4;
    CGRect frame5;
    CGRect frame6;
    CGRect frame7;
    CGRect frame8;
    CGRect frame9;
    NSMutableArray *colorArray;
    NSArray *buttonArray;
    NSArray *frameArray;
    NSMutableArray *playButtonArray;
    NSMutableArray *playFrameArray;
    __weak IBOutlet UILabel *notificationLabel;

}

@end

@implementation PressButton3ViewController

@synthesize testDelegate;

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
    [super viewDidLoad];
    
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
    
    colorArray = [[NSMutableArray alloc] initWithObjects:color1,color2,color3,color4,color5,color6,color7,color8,color9, nil];
    offset = 105;
    frameSize = 70;
    spin = 0;
    //////////\\\\\\\\\\\\\\\
    //To adjust the number of starting lights for game, must delete from colorArray and buttonArray to match that size. This is now set for max size 9; can adjust dowward.
    //views are moved via entire frame, but maybe could be moved by just referencing a new CGPoint center, etc..
    //playButtonArray and playFrameArray may be needed in app implementation, but may be unnecessary and could just reload buttonArray and frameArray each time
	// Do any additional setup after loading the view.
    
    //CGPoint center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    CGPoint center = self.view.center;
    button0 = [[UIView alloc] initWithFrame: CGRectMake(center.x - frameSize/2, center.y - 20-frameSize/2,frameSize,frameSize)];
    [button0 setCenter: self.view.center];
    
    button1 = [[ColorButtons alloc] init];
    button2 = [[ColorButtons alloc] init];
    button3 = [[ColorButtons alloc] init];
    button4 = [[ColorButtons alloc] init];
    button5 = [[ColorButtons alloc] init];
    button6 = [[ColorButtons alloc] init];
    button7 = [[ColorButtons alloc] init];
    button8 = [[ColorButtons alloc] init];
    button9 = [[ColorButtons alloc] init];
    buttonArray = [[NSArray alloc] initWithObjects:button1, button2, button3, button4, button5, button6, button7, button8, button9, nil];
    playButtonArray = [[NSMutableArray alloc] initWithArray:buttonArray];
    
    frame1 = CGRectOffset(button0.frame, offset* cosf((1*(2*M_PI)/playButtonArray.count) + spin), offset* sinf((1*(2*M_PI)/playButtonArray.count) + spin));
    frame2 = CGRectOffset(button0.frame, offset* cosf((2*(2*M_PI)/playButtonArray.count) + spin), offset* sinf((2*(2*M_PI)/playButtonArray.count) + spin));
    frame3 = CGRectOffset(button0.frame, offset* cosf((3*(2*M_PI)/playButtonArray.count) + spin), offset* sinf((3*(2*M_PI)/playButtonArray.count) + spin));
    frame4 = CGRectOffset(button0.frame, offset* cosf((4*(2*M_PI)/playButtonArray.count) + spin), offset* sinf((4*(2*M_PI)/playButtonArray.count) + spin));
    frame5 = CGRectOffset(button0.frame, offset* cosf((5*(2*M_PI)/playButtonArray.count) + spin), offset* sinf((5*(2*M_PI)/playButtonArray.count) + spin));
    frame6 = CGRectOffset(button0.frame, offset* cosf((6*(2*M_PI)/playButtonArray.count) + spin), offset* sinf((6*(2*M_PI)/playButtonArray.count) + spin));
    frame7 = CGRectOffset(button0.frame, offset* cosf((7*(2*M_PI)/playButtonArray.count) + spin), offset* sinf((7*(2*M_PI)/playButtonArray.count) + spin));
    frame8 = CGRectOffset(button0.frame, offset* cosf((8*(2*M_PI)/playButtonArray.count) + spin), offset* sinf((8*(2*M_PI)/playButtonArray.count) + spin));
    frame9 = CGRectOffset(button0.frame, offset* cosf((9*(2*M_PI)/playButtonArray.count) + spin), offset* sinf((9*(2*M_PI)/playButtonArray.count) + spin));

    frameArray = [[NSArray alloc] initWithObjects:[NSValue valueWithCGRect:frame1], [NSValue valueWithCGRect:frame2], [NSValue valueWithCGRect:frame3], [NSValue valueWithCGRect:frame4], [NSValue valueWithCGRect:frame5], [NSValue valueWithCGRect:frame6], [NSValue valueWithCGRect:frame7], [NSValue valueWithCGRect:frame8], [NSValue valueWithCGRect:frame9], nil];

    //using buttonArray as alternate to isKind ofClass iteration
    for (ColorButtons* obj in buttonArray) {
        [self.view addSubview:obj];
    }
    //needed to add subviews above before could do below
    int element = 0;
    for (ColorButtons* subview in buttonArray) {
        //tag not used in current version
        subview.tag = element;
        subview.frame = button0.frame;
        element++;
        [subview setUserInteractionEnabled:YES];
        [subview setHidden:YES];
        //[self.view addSubview:subview];
        ColorButtons * colorButton = (ColorButtons *) subview;
        colorButton.pressButtonsDelegate = self;
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [self startDemoGame3:self];
}

- (void)startDemoGame3:(id)sender
{
    gameCounter = 0;
    playButtonArray = [[NSMutableArray alloc] initWithArray:buttonArray];
    playFrameArray = [[NSMutableArray alloc] initWithArray:frameArray];
    for (NSInteger i = colorArray.count-1; i > 0; i--)
    {
        [colorArray exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform(i+1)];
    }
    int frameElement = 0;
    for (UIView * subview in self.view.subviews){
        if ([subview isKindOfClass:[ColorButtons class]]){
            [subview setAlpha:1.0];
            ColorButtons *view = (ColorButtons*) subview;
            view.backgroundColor = colorArray[frameElement];
            view.layer.borderWidth = 2;
            view.layer.cornerRadius = 35;
            view.center = self.view.center;
            subview.transform = CGAffineTransformScale(subview.transform, 0.01, 0.01);
            [subview setHidden:NO];
            [subview setUserInteractionEnabled:YES];
            [UIView animateWithDuration:1.0 animations:^{
                subview.transform = CGAffineTransformScale(subview.transform, 100, 100);
            }completion:^(BOOL finished) {
                [UIView animateWithDuration:1.0 animations:^{
                    subview.frame = [frameArray[frameElement] CGRectValue];
                }];
            }];
            frameElement++;
        }
    }notificationLabel.text = @"Extinguish all the lights";
}
-(void) didClickGameView: (ColorButtons *) thisView
{
    
}

@end
