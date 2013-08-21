//
//  SwipeViewController.m
//  NickOfTime
//
//  Created by Brian Dinh on 8/15/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import "SwipeViewController.h"
#import "ContainerViewController.h"

@interface SwipeViewController (){
    NSArray *allCommands;
    NSMutableArray *checkArray;
    NSMutableArray *commandArray;
    int index;
    int level;
    __weak IBOutlet UILabel *commandLabel;
    __weak IBOutlet UIButton *levelButton;
    
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
  
    allCommands = [NSArray arrayWithObjects:@"Swipe up",@"Swipe down",@"Swipe left",@"Swipe right",@"Swipe left then up", @"Swipe left then down",@"Swipe left then left",@"Swipe left then right",@"Swipe up then up", @"Swipe up then down",@"Swipe up then left",@"Swipe up then right",@"Swipe down then up", @"Swipe down then down",@"Swipe down then left",@"Swipe down then right",@"Swipe right then up", @"Swipe right then down",@"Swipe right then left",@"Swipe right then right", @"Swipe anywhere but up", @"Swipe anywhere but down",@"Swipe anywhere but left",@"Swipe anywhere but right", nil];
    
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

- (void)handleSwipeUpFrom:(UIGestureRecognizer*)recognizer {
    [checkArray addObject:@"0"];
    if (index <3) {
        if ([checkArray isEqualToArray:commandArray]) {
            NSLog(@"youwin!");
            [delegate didWinGame];
            [self pickAndDisplayCommand];
        }
        else {
            NSLog(@"youlose!");
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
            
        }
    }
    
    if (index < 20) {
        if ([checkArray isEqualToArray:commandArray]) {
            NSLog(@"youwin!");
            [delegate didWinGame];
            [self pickAndDisplayCommand];
            
        }
        if ((checkArray.count == 2) && (![commandArray isEqualToArray:checkArray])) {
            NSLog(@"youlose!");
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
        }
        
    }
    
    else {
        if (![checkArray isEqualToArray:commandArray]) {
            NSLog(@"youwin!");
            [delegate didWinGame];
            [self pickAndDisplayCommand];
        }
        else{
            NSLog(@"youlose!");
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
            
        }
    }
    
}

- (void)handleSwipeDownFrom:(UIGestureRecognizer*)recognizer {
    [checkArray addObject:@"1"];
    if (index <3) {
        if ([checkArray isEqualToArray:commandArray]) {
            NSLog(@"youwin!");
            [delegate didWinGame];
            [self pickAndDisplayCommand];
             }
             else {
                 NSLog(@"youlose!");
                 [delegate didLoseGame];
                 [self pickAndDisplayCommand];

             }
    }
    if (index < 20) {
        if ([checkArray isEqualToArray:commandArray]) {
            NSLog(@"youwin!");
            [delegate didWinGame];
            [self pickAndDisplayCommand];
        }
        if ((checkArray.count == 2) && (![commandArray isEqualToArray:checkArray])) {
            NSLog(@"youlose!");
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
        }
        
    }
    
    else {
        if (![checkArray isEqualToArray:commandArray]) {
            NSLog(@"youwin!");
            [self pickAndDisplayCommand];
            [delegate didWinGame];
        }
        else{
            NSLog(@"youlose!");
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
            
        }
    }
    
}

- (void)handleSwipeLeftFrom:(UIGestureRecognizer*)recognizer {
    [checkArray addObject:@"2"];
    if (index <3) {
        if ([checkArray isEqualToArray:commandArray]) {
            NSLog(@"youwin!");
            [delegate didWinGame];
            [self pickAndDisplayCommand];
        }
        else {
            NSLog(@"youlose!");
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
            
        }
    }
    if (index < 20) {
        if ([checkArray isEqualToArray:commandArray]) {
            NSLog(@"youwin!");
            [self pickAndDisplayCommand];
            [delegate didWinGame];
        }
        if ((checkArray.count == 2) && (![commandArray isEqualToArray:checkArray])) {
            NSLog(@"youlose!");
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
        }
        
    }
    
    else {
        if (![checkArray isEqualToArray:commandArray]) {
            NSLog(@"youwin!");
            [self pickAndDisplayCommand];
            [delegate didWinGame];
        }
        else{
            NSLog(@"youlose!");
            [self pickAndDisplayCommand];
            
        }
    }
    
}

- (void)handleSwipeRightFrom:(UIGestureRecognizer*)recognizer {
    [checkArray addObject:@"3"];
    if (index <3) {
        if ([checkArray isEqualToArray:commandArray]) {
            NSLog(@"youwin!");
            [delegate didWinGame];
            [self pickAndDisplayCommand];
        }
        else {
            NSLog(@"youlose!");
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
            
        }
    }
    if (index < 20) {
        if ([checkArray isEqualToArray:commandArray]) {
            NSLog(@"youwin!");
            [self pickAndDisplayCommand];
            [delegate didWinGame];
        }
        if ((checkArray.count == 2) && (![commandArray isEqualToArray:checkArray])) {
            NSLog(@"youlose!");
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
        }
        
    }
    
    else {
        if (![checkArray isEqualToArray:commandArray]) {
            NSLog(@"youwin!");
            [self pickAndDisplayCommand];
            [delegate didWinGame];
        }
        else{
            NSLog(@"youlose!");
            [delegate didLoseGame];
            [self pickAndDisplayCommand];
            
        }
    }
    
}


-(void)pickAndDisplayCommand{
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
        index = arc4random() % 20;
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
        
        index = arc4random() % 24;
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


- (IBAction)swapLevel:(id)sender {
    level = level +1;
    if (level == 3) {
        level = 1;
    }
    NSLog(@"%i",level);
}


@end
