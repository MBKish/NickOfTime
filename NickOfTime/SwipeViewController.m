//
//  SwipeViewController.m
//  NickOfTime
//
//  Created by Brian Dinh on 8/15/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import "SwipeViewController.h"
#import "ContainerViewController.h"
#import "ArrowView.h"

@interface SwipeViewController (){
    NSArray *allCommands;
    NSMutableArray *checkArray;
    NSMutableArray *commandArray;
    int index;
    int level;
    __weak IBOutlet UILabel *commandLabel;
    ArrowView *up;
    ArrowView *right;
    ArrowView *down;
    ArrowView *left;
    
}
- (IBAction)swapLevel:(id)sender;

@end

@implementation SwipeViewController

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
    [super viewDidLoad];
    level = 0;
    [self addSwipeGestures];
    checkArray = [[NSMutableArray alloc] init];;
    commandArray = [[NSMutableArray alloc] init];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(swapLevel:) name:@"nextLevel" object:nil];
    [notificationCenter addObserver:self selector:@selector(restartLevel:) name:@"restartGame" object:nil];

  
    allCommands = [NSArray arrayWithObjects:@"Swipe up",@"Swipe down",@"Swipe left",@"Swipe right",@"Swipe left then up", @"Swipe left then down",@"Swipe left then left",@"Swipe left then right",@"Swipe up then up", @"Swipe up then down",@"Swipe up then left",@"Swipe up then right",@"Swipe down then up", @"Swipe down then down",@"Swipe down then left",@"Swipe down then right",@"Swipe right then up", @"Swipe right then down",@"Swipe right then left",@"Swipe right then right", @"Swipe anywhere but up", @"Swipe anywhere but down",@"Swipe anywhere but left",@"Swipe anywhere but right", nil];
    [self drawSets];
    [self pickAndDisplayCommand];
    
    NSLog(@"%@,%@",checkArray, commandArray);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addSwipeGestures{
    UISwipeGestureRecognizer* swipeUpGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeUpFrom:)];
    swipeUpGestureRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
    
    UISwipeGestureRecognizer* swipeDownGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeDownFrom:)];
    swipeDownGestureRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
    
    UISwipeGestureRecognizer* swipeLeftGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeftFrom:)];
    swipeLeftGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer* swipeRightGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRightFrom:)];
    swipeRightGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:swipeUpGestureRecognizer];
    [self.view addGestureRecognizer:swipeDownGestureRecognizer];
    [self.view addGestureRecognizer:swipeLeftGestureRecognizer];
    [self.view addGestureRecognizer:swipeRightGestureRecognizer];
}
-(void)viewWillAppear:(BOOL)animated{
    up.alpha = .5;
    right.alpha = .5;
    down.alpha = .5;
    left.alpha = .5;
    [self pickAndDisplayCommand];

}

- (void)handleSwipeUpFrom:(UIGestureRecognizer*)recognizer {
    [checkArray addObject:@"0"];
    [up setAlpha: 1];
    if (index <3) {
        if ([checkArray isEqualToArray:commandArray]) {
            [delegate didWinGame];
            //[self pickAndDisplayCommand];
        }
        else {
            [delegate didLoseGame];
            //[self pickAndDisplayCommand];
            
        }
    }
     
    else if (index < 20) {
        if ([checkArray isEqualToArray:commandArray]) {
            [delegate didWinGame];
            //[self pickAndDisplayCommand];
            
        }
        if ((checkArray.count == 1) && (commandArray.count == 2)) {
            if (checkArray[0] != commandArray [0]) {
                [delegate didLoseGame];
                [self pickAndDisplayCommand];

            }
        }
        
        if ((checkArray.count == 2) && (![commandArray isEqualToArray:checkArray])) {
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
        }
        
    }
    
    else {
        if (![checkArray isEqualToArray:commandArray]) {
            [delegate didWinGame];
            //[self pickAndDisplayCommand];
        }
        else{
            [delegate didLoseGame];
            //[self pickAndDisplayCommand];
            
        }
    }
    
}

- (void)handleSwipeDownFrom:(UIGestureRecognizer*)recognizer {
    [down setAlpha: 1];
    [checkArray addObject:@"1"];
    if (index <3) {
        if ([checkArray isEqualToArray:commandArray]) {
            [delegate didWinGame];
            //[self pickAndDisplayCommand];
             }
             else {
                 [delegate didLoseGame];
                 [self pickAndDisplayCommand];

             }
    }
    else if (index < 20) {
        if ([checkArray isEqualToArray:commandArray]) {
            [delegate didWinGame];
            //[self pickAndDisplayCommand];
        }
        if ((checkArray.count == 1) && (commandArray.count == 2)) {
            if (checkArray[0] != commandArray [0]) {
                [delegate didLoseGame];
                [self pickAndDisplayCommand];
                
            }
        }
        if ((checkArray.count == 2) && (![commandArray isEqualToArray:checkArray])) {
            [delegate didLoseGame];
           // [self pickAndDisplayCommand];
        }
        
    }
    
    else {
        if (![checkArray isEqualToArray:commandArray]) {
            //[self pickAndDisplayCommand];
            [delegate didWinGame];
        }
        else{
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
            
        }
    }
    
}

- (void)handleSwipeLeftFrom:(UIGestureRecognizer*)recognizer {
    [left setAlpha: 1];
    [checkArray addObject:@"2"];
    if (index <3) {
        if ([checkArray isEqualToArray:commandArray]) {
            [delegate didWinGame];
            //[self pickAndDisplayCommand];
        }
        else {
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
            
        }
    }
    else if (index < 20) {
        if ([checkArray isEqualToArray:commandArray]) {
            //[self pickAndDisplayCommand];
            [delegate didWinGame];
        }
        if ((checkArray.count == 1) && (commandArray.count == 2)) {
            if (checkArray[0] != commandArray [0]) {
                [delegate didLoseGame];
                [self pickAndDisplayCommand];
                
            }
        }
        if ((checkArray.count == 2) && (![commandArray isEqualToArray:checkArray])) {
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
        }
        
    }
    
    else {
        if (![checkArray isEqualToArray:commandArray]) {
            //[self pickAndDisplayCommand];
            [delegate didWinGame];
        }
        else{
            [self pickAndDisplayCommand];
            [delegate didLoseGame];

        }
    }
    
}

- (void)handleSwipeRightFrom:(UIGestureRecognizer*)recognizer {
    [right setAlpha: 1];
    [checkArray addObject:@"3"];
    if (index <3) {
        if ([checkArray isEqualToArray:commandArray]) {
            [delegate didWinGame];
            //[self pickAndDisplayCommand];
        }
        else {
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
            
        }
    }
    else if (index < 20) {
        if ([checkArray isEqualToArray:commandArray]) {
            //[self pickAndDisplayCommand];
            [delegate didWinGame];
        }
        if ((checkArray.count == 1) && (commandArray.count == 2)) {
            if (checkArray[0] != commandArray [0]) {
                [delegate didLoseGame];
                [self pickAndDisplayCommand];
                
            }
        }
        if ((checkArray.count == 2) && (![commandArray isEqualToArray:checkArray])) {
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
        }
        
    }
    
    else {
        if (![checkArray isEqualToArray:commandArray]) {
            //[self pickAndDisplayCommand];
            [delegate didWinGame];
        }
        else{
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
            
        }
    }
    
}


-(void)pickAndDisplayCommand{

    up.alpha = .5;
    right.alpha = .5;
    down.alpha = .5;
    left.alpha = .5;
    
    if (level == 0) {
        [commandArray removeAllObjects];
        [checkArray removeAllObjects];
        index = arc4random() % 4;
        commandLabel.text = [NSString stringWithFormat:@"%@",allCommands[index]];

        
        if (index == 0) {
            [commandArray addObject:@"0"];
        }
        if (index == 1) {
            [commandArray addObject:@"1"];
        }
        if (index == 2) {
            [commandArray addObject:@"2"];
        }
        if (index == 3) {
            [commandArray addObject:@"3"];
        }

    }
    
    if (level == 1) {
        [commandArray removeAllObjects];
        [checkArray removeAllObjects];
        //index = arc4random() % 20;
        index = arc4random_uniform(19) + 4;;
        commandLabel.text = [NSString stringWithFormat:@"%@",allCommands[index]];

        
        if (index == 0) {
            [commandArray addObject:@"0"];
        }
        if (index == 1) {
            [commandArray addObject:@"1"];
        }
        if (index == 2) {
            [commandArray addObject:@"2"];
        }
        if (index == 3) {
            [commandArray addObject:@"3"];
        }
        if (index == 4) {
            [commandArray addObject:@"2"];
            [commandArray addObject:@"0"];
        }
        if (index == 5) {
            [commandArray addObject:@"2"];
            [commandArray addObject:@"1"];
        }
        if (index == 6) {
            [commandArray addObject:@"2"];
            [commandArray addObject:@"2"];
        }
        if (index == 7) {
            [commandArray addObject:@"2"];
            [commandArray addObject:@"3"];
        }
        if (index == 8) {
            [commandArray addObject:@"0"];
            [commandArray addObject:@"0"];
        }
        if (index == 9) {
            [commandArray addObject:@"0"];
            [commandArray addObject:@"1"];
        }
        if (index == 10) {
            [commandArray addObject:@"0"];
            [commandArray addObject:@"2"];
        }
        if (index == 11) {
            [commandArray addObject:@"0"];
            [commandArray addObject:@"3"];
        }
        if (index == 12) {
            [commandArray addObject:@"1"];
            [commandArray addObject:@"0"];
        }
        if (index == 13) {
            [commandArray addObject:@"1"];
            [commandArray addObject:@"1"];
        }
        if (index == 14) {
            [commandArray addObject:@"1"];
            [commandArray addObject:@"2"];
        }
        if (index == 15) {
            [commandArray addObject:@"1"];
            [commandArray addObject:@"3"];
        }
        if (index == 16) {
            [commandArray addObject:@"3"];
            [commandArray addObject:@"0"];
        }
        if (index == 17) {
            [commandArray addObject:@"3"];
            [commandArray addObject:@"1"];
        }
        if (index == 18) {
            [commandArray addObject:@"3"];
            [commandArray addObject:@"2"];
        }
        if (index == 19) {
            [commandArray addObject:@"3"];
            [commandArray addObject:@"3"];
        }

        
    }
    
    if (level == 2) {
        [commandArray removeAllObjects];
        [checkArray removeAllObjects];
        
        //index = arc4random() % 24;
        index = (arc4random()%(23-4+1))+4 ;
        commandLabel.text = [NSString stringWithFormat:@"%@",allCommands[index]];
        if (index == 0) {
            [commandArray addObject:@"0"];
        }
        if (index == 1) {
            [commandArray addObject:@"1"];
        }
        if (index == 2) {
            [commandArray addObject:@"2"];
        }
        if (index == 3) {
            [commandArray addObject:@"3"];
        }
        if (index == 4) {
            [commandArray addObject:@"2"];
            [commandArray addObject:@"0"];
        }
        if (index == 5) {
            [commandArray addObject:@"2"];
            [commandArray addObject:@"1"];
        }
        if (index == 6) {
            [commandArray addObject:@"2"];
            [commandArray addObject:@"2"];
        }
        if (index == 7) {
            [commandArray addObject:@"2"];
            [commandArray addObject:@"3"];
        }
        if (index == 8) {
            [commandArray addObject:@"0"];
            [commandArray addObject:@"0"];
        }
        if (index == 9) {
            [commandArray addObject:@"0"];
            [commandArray addObject:@"1"];
        }
        if (index == 10) {
            [commandArray addObject:@"0"];
            [commandArray addObject:@"2"];
        }
        if (index == 11) {
            [commandArray addObject:@"0"];
            [commandArray addObject:@"3"];
        }
        if (index == 12) {
            [commandArray addObject:@"1"];
            [commandArray addObject:@"0"];
        }
        if (index == 13) {
            [commandArray addObject:@"1"];
            [commandArray addObject:@"1"];
        }
        if (index == 14) {
            [commandArray addObject:@"1"];
            [commandArray addObject:@"2"];
        }
        if (index == 15) {
            [commandArray addObject:@"1"];
            [commandArray addObject:@"3"];
        }
        if (index == 16) {
            [commandArray addObject:@"3"];
            [commandArray addObject:@"0"];
        }
        if (index == 17) {
            [commandArray addObject:@"3"];
            [commandArray addObject:@"1"];
        }
        if (index == 18) {
            [commandArray addObject:@"3"];
            [commandArray addObject:@"2"];
        }
        if (index == 19) {
            [commandArray addObject:@"3"];
            [commandArray addObject:@"3"];
        }
        if (index == 20) {
            [commandArray addObject:@"0"];
        }
        if (index == 21) {
            [commandArray addObject:@"1"];
        }
        if (index == 22) {
            [commandArray addObject:@"2"];
        }
        if (index == 23) {
            [commandArray addObject:@"3"];
        }

    }
}

-(void)swapLevel:(id)sender{
    if (level <2) {
        level = level +1;
    }
}

-(void)restartLevel:(id)sender{
    level = 0;
    [self pickAndDisplayCommand];

}

- (void)drawSets{
    UIImage *upImage = [UIImage imageNamed: @"arrow_up.png"];
    UIImage *rightImage = [UIImage imageNamed: @"arrow_right.png"];
    UIImage *downImage = [UIImage imageNamed: @"arrow_down.png"];
    UIImage *leftImage = [UIImage imageNamed: @"arrow_left.png"];

    //draw the four
    up = [[ArrowView alloc] initWithFrame: CGRectMake (135, 85, 50, 78)];
    right = [[ArrowView alloc] initWithFrame: CGRectMake (163, 163, 78, 50)];
    down = [[ArrowView alloc] initWithFrame: CGRectMake (135, 210, 50, 78)];
    left = [[ArrowView alloc] initWithFrame: CGRectMake (78, 163, 78, 50)];
    
    [up setImage:upImage];
    [right setImage:rightImage];
    [down setImage:downImage];
    [left setImage:leftImage];
    
    [self.view addSubview:up];
    [self.view addSubview:right];
    [self.view addSubview:down];
    [self.view addSubview:left];
    
    up.alpha = .5;
    right.alpha = .5;
    down.alpha = .5;
    left.alpha = .5;
    
    up.tag = 0;
    right.tag = 1;
    left.tag = 2;
    down.tag = 3;
    
}

@end
