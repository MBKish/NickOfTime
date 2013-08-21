//
//  FindTheObjectViewController.m
//  NickOfTime
//
//  Created by Brian Dinh on 8/15/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import "FindTheObjectViewController.h"
#import "ShapeView.h"

@interface FindTheObjectViewController (){
    NSString *pickedCommand;
    NSArray *arrayOfTags;
    NSArray *commandArray;
    NSMutableArray *unpickedCommandsArray;
    NSMutableArray *compareArray;
    int shapesOnScreen;
    int level;
    
    __weak IBOutlet UILabel *commandLabel;
}
- (IBAction)levelSwap:(id)sender;

@end

@implementation FindTheObjectViewController

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
    arrayOfTags = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"];
    
    commandArray = @[@"Red Square", @"Blue Square", @"Green Square", @"Red Circle", @"Blue Circle", @"Green Circle", @"Red Triangle", @"Blue Triangle", @"Green Triangle"];
    level = 0;
    shapesOnScreen = 0;
    unpickedCommandsArray = [[NSMutableArray alloc] initWithArray:commandArray];
    
    compareArray = [[NSMutableArray alloc] initWithCapacity:4];
    
    [self randomCommand];
    [self shapeColorAllViewsWithinArray:arrayOfTags atIndex:0];
}


- (void)randomCommand {
    int command = arc4random()%commandArray.count;
    
    if (level == 0) {
        [self drawFour];
    } else if (level == 1){
        [self drawNine];
    } else if (level == 2){
        [self drawTwelve];
    } else if (level == 3){
        [self drawSixteen];
    }
    
    commandLabel.text = [NSString stringWithFormat:@"Tap the %@",[commandArray objectAtIndex:command]];
    pickedCommand = [commandArray objectAtIndex:command];
    [unpickedCommandsArray removeObjectAtIndex:command];
}


- (void)drawSets{
    //draw the four
    
    
    if (level == 2) {
        //draw the 12 minus those in the 4
    } else if (level == 3){
        //draw the 16 minus those in the 12 and 4
    }
    
}

- (void)drawFour {
    
    ShapeView *fourZero = [[ShapeView alloc] initWithFrame: CGRectMake (106, 77, 50, 50)];
    ShapeView *fourOne = [[ShapeView alloc] initWithFrame: CGRectMake(164, 77, 50, 50)];
    ShapeView *fourTwo = [[ShapeView alloc] initWithFrame: CGRectMake(106, 135, 50, 50)];
    ShapeView *fourThree = [[ShapeView alloc] initWithFrame: CGRectMake(164, 135, 50, 50)];
    [self.view addSubview:fourZero];
    [self.view addSubview:fourOne];
    [self.view addSubview:fourTwo];
    [self.view addSubview:fourThree];
    fourZero.tag = 0;
    fourOne.tag = 1;
    fourTwo.tag = 2;
    fourThree.tag = 3;
    fourZero.userInteractionEnabled = YES;
    fourOne.userInteractionEnabled = YES;
    fourTwo.userInteractionEnabled = YES;
    fourThree.userInteractionEnabled = YES;
    
}

- (void)drawNine {
    
    ShapeView *nineZero = [[ShapeView alloc] initWithFrame: CGRectMake (77, 77, 50, 50)];
    ShapeView *nineOne = [[ShapeView alloc] initWithFrame: CGRectMake (135, 77, 50, 50)];
    ShapeView *nineTwo = [[ShapeView alloc] initWithFrame: CGRectMake (193, 77, 50, 50)];
    ShapeView *nineThree = [[ShapeView alloc] initWithFrame: CGRectMake (77, 135, 50, 50)];
    ShapeView *nineFour = [[ShapeView alloc] initWithFrame: CGRectMake (135, 135, 50, 50)];
    ShapeView *nineFive = [[ShapeView alloc] initWithFrame: CGRectMake (193, 135, 50, 50)];
    ShapeView *nineSix = [[ShapeView alloc] initWithFrame: CGRectMake (77, 193, 50, 50)];
    ShapeView *nineSeven = [[ShapeView alloc] initWithFrame: CGRectMake (135, 193, 50, 50)];
    ShapeView *nineEight = [[ShapeView alloc] initWithFrame: CGRectMake (193, 193, 50, 50)];
    [self.view addSubview:nineZero];
    [self.view addSubview:nineOne];
    [self.view addSubview:nineTwo];
    [self.view addSubview:nineThree];
    [self.view addSubview:nineFour];
    [self.view addSubview:nineFive];
    [self.view addSubview:nineSix];
    [self.view addSubview:nineSeven];
    [self.view addSubview:nineEight];
    nineZero.tag = 0;
    nineOne.tag = 1;
    nineTwo.tag = 2;
    nineThree.tag = 3;
    nineFour.tag = 4;
    nineFive.tag = 5;
    nineSix.tag = 6;
    nineSeven.tag = 7;
    nineEight.tag = 8;
    nineZero.userInteractionEnabled = YES;
    nineOne.userInteractionEnabled = YES;
    nineTwo.userInteractionEnabled = YES;
    nineThree.userInteractionEnabled = YES;
    nineFour.userInteractionEnabled = YES;
    nineFive.userInteractionEnabled = YES;
    nineSix.userInteractionEnabled = YES;
    nineSeven.userInteractionEnabled = YES;
    nineEight.userInteractionEnabled = YES;
}

- (void)drawTwelve {
    ShapeView *twelveZero = [[ShapeView alloc] initWithFrame: CGRectMake (106, 38, 50, 50)];
    ShapeView *twelveOne = [[ShapeView alloc] initWithFrame: CGRectMake (164, 38, 50, 50)];
    ShapeView *twelveTwo = [[ShapeView alloc] initWithFrame: CGRectMake (49, 96, 50, 50)];
    ShapeView *twelveThree = [[ShapeView alloc] initWithFrame: CGRectMake (106, 96, 50, 50)];
    ShapeView *twelveFour = [[ShapeView alloc] initWithFrame: CGRectMake (164, 96, 50, 50)];
    ShapeView *twelveFive = [[ShapeView alloc] initWithFrame: CGRectMake (222, 96, 50, 50)];
    ShapeView *twelveSix = [[ShapeView alloc] initWithFrame: CGRectMake (49, 154, 50, 50)];
    ShapeView *twelveSeven = [[ShapeView alloc] initWithFrame: CGRectMake (106, 154, 50, 50)];
    ShapeView *twelveEight = [[ShapeView alloc] initWithFrame: CGRectMake (164, 154, 50, 50)];
    ShapeView *twelveNine = [[ShapeView alloc] initWithFrame: CGRectMake (222, 154, 50, 50)];
    ShapeView *twelveTen = [[ShapeView alloc] initWithFrame: CGRectMake (106, 212, 50, 50)];
    ShapeView *twelveEleven = [[ShapeView alloc] initWithFrame: CGRectMake (164, 212, 50, 50)];
    [self.view addSubview:twelveZero];
    [self.view addSubview:twelveOne];
    [self.view addSubview:twelveTwo];
    [self.view addSubview:twelveThree];
    [self.view addSubview:twelveFour];
    [self.view addSubview:twelveFive];
    [self.view addSubview:twelveSix];
    [self.view addSubview:twelveSeven];
    [self.view addSubview:twelveEight];
    [self.view addSubview:twelveNine];
    [self.view addSubview:twelveTen];
    [self.view addSubview:twelveEleven];
    twelveZero.tag = 0;
    twelveOne.tag = 1;
    twelveTwo.tag = 2;
    twelveThree.tag = 3;
    twelveFour.tag = 4;
    twelveFive.tag = 5;
    twelveSix.tag = 6;
    twelveSeven.tag = 7;
    twelveEight.tag = 8;
    twelveNine.tag = 9;
    twelveTen.tag = 10;
    twelveEleven.tag = 11;
    twelveZero.userInteractionEnabled = YES;
    twelveOne.userInteractionEnabled = YES;
    twelveTwo.userInteractionEnabled = YES;
    twelveThree.userInteractionEnabled = YES;
    twelveFour.userInteractionEnabled = YES;
    twelveFive.userInteractionEnabled = YES;
    twelveSix.userInteractionEnabled = YES;
    twelveSeven.userInteractionEnabled = YES;
    twelveEight.userInteractionEnabled = YES;
    twelveNine.userInteractionEnabled = YES;
    twelveTen.userInteractionEnabled = YES;
    twelveEleven.userInteractionEnabled = YES;
}

- (void)drawSixteen {
    //
    ShapeView *sixteenOne = [[ShapeView alloc] initWithFrame: CGRectMake (49, 38, 50, 50)];
    ShapeView *sixteenTwo = [[ShapeView alloc] initWithFrame: CGRectMake (222, 38, 50, 50)];
    ShapeView *sixteenThree = [[ShapeView alloc] initWithFrame: CGRectMake (49, 212, 50, 50)];
    ShapeView *sixteenFour = [[ShapeView alloc] initWithFrame: CGRectMake (222, 212, 50, 50)];
    
    ShapeView *twelveZero = [[ShapeView alloc] initWithFrame: CGRectMake (106, 38, 50, 50)];
    ShapeView *twelveOne = [[ShapeView alloc] initWithFrame: CGRectMake (164, 38, 50, 50)];
    ShapeView *twelveTwo = [[ShapeView alloc] initWithFrame: CGRectMake (49, 96, 50, 50)];
    ShapeView *twelveThree = [[ShapeView alloc] initWithFrame: CGRectMake (106, 96, 50, 50)];
    ShapeView *twelveFour = [[ShapeView alloc] initWithFrame: CGRectMake (164, 96, 50, 50)];
    ShapeView *twelveFive = [[ShapeView alloc] initWithFrame: CGRectMake (222, 96, 50, 50)];
    ShapeView *twelveSix = [[ShapeView alloc] initWithFrame: CGRectMake (49, 154, 50, 50)];
    ShapeView *twelveSeven = [[ShapeView alloc] initWithFrame: CGRectMake (106, 154, 50, 50)];
    ShapeView *twelveEight = [[ShapeView alloc] initWithFrame: CGRectMake (164, 154, 50, 50)];
    ShapeView *twelveNine = [[ShapeView alloc] initWithFrame: CGRectMake (222, 154, 50, 50)];
    ShapeView *twelveTen = [[ShapeView alloc] initWithFrame: CGRectMake (106, 212, 50, 50)];
    ShapeView *twelveEleven = [[ShapeView alloc] initWithFrame: CGRectMake (164, 212, 50, 50)];
    
    [self.view addSubview:sixteenOne];
    [self.view addSubview:sixteenTwo];
    [self.view addSubview:sixteenThree];
    [self.view addSubview:sixteenFour];
    
    [self.view addSubview:twelveZero];
    [self.view addSubview:twelveOne];
    [self.view addSubview:twelveTwo];
    [self.view addSubview:twelveThree];
    [self.view addSubview:twelveFour];
    [self.view addSubview:twelveFive];
    [self.view addSubview:twelveSix];
    [self.view addSubview:twelveSeven];
    [self.view addSubview:twelveEight];
    [self.view addSubview:twelveNine];
    [self.view addSubview:twelveTen];
    [self.view addSubview:twelveEleven];
    
    sixteenOne.tag = 0;
    twelveZero.tag = 1;
    twelveOne.tag = 2;
    sixteenTwo.tag = 3;
    twelveTwo.tag = 4;
    twelveThree.tag = 5;
    twelveFour.tag = 6;
    twelveFive.tag = 7;
    twelveSix.tag = 8;
    twelveSeven.tag = 9;
    twelveEight.tag = 10;
    twelveNine.tag = 11;
    sixteenThree.tag = 12;
    twelveTen.tag = 13;
    twelveEleven.tag = 14;
    sixteenFour.tag = 15;
    
    sixteenOne.userInteractionEnabled = YES;
    sixteenTwo.userInteractionEnabled = YES;
    sixteenThree.userInteractionEnabled = YES;
    sixteenFour.userInteractionEnabled = YES;
    
    twelveZero.userInteractionEnabled = YES;
    twelveOne.userInteractionEnabled = YES;
    twelveTwo.userInteractionEnabled = YES;
    twelveThree.userInteractionEnabled = YES;
    twelveFour.userInteractionEnabled = YES;
    twelveFive.userInteractionEnabled = YES;
    twelveSix.userInteractionEnabled = YES;
    twelveSeven.userInteractionEnabled = YES;
    twelveEight.userInteractionEnabled = YES;
    twelveNine.userInteractionEnabled = YES;
    twelveTen.userInteractionEnabled = YES;
    twelveEleven.userInteractionEnabled = YES;
}

- (void)shapeColorAllViewsWithinArray:(NSArray *)tagArray atIndex:(NSUInteger)tagIndex {
    
    ShapeView *selectedView = nil;
    
    NSString *tagString = [tagArray objectAtIndex:tagIndex];
    
    //ShapeView *polygonView = [[ShapeView alloc] initWithFrame: CGRectMake (106, 77, 51, 51)];
    
    //polygonView.backgroundColor = [UIColor redColor];
    //[self.view addSubview:polygonView];
    
    for (ShapeView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[ShapeView class]]) {
            if (subview.tag == [tagString intValue]) {
                selectedView = subview;
                subview.delegate = self;
                shapesOnScreen++;
                break;
            }
        }
    }
    //int r = arc4random() %unpickedCommandsArray.count;
    int r = arc4random_uniform(unpickedCommandsArray.count);
    //NSLog(@"%i",r);
    
    //Need to make a custom class with a property for color and shape
    
    //We only want one of the asked shape!
    
    if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Blue Square"]) {
        UIImage *blueSquare = [UIImage imageNamed: @"blue_square.png"];
        [selectedView setImage:blueSquare];
        [compareArray addObject:@"Blue Square"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Blue Circle"]) {
        UIImage *blueCircle = [UIImage imageNamed: @"blue_circle.png"];
        [selectedView setImage:blueCircle];
        [compareArray addObject:@"Blue Circle"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Blue Triangle"]) {
        UIImage *blueTriangle = [UIImage imageNamed: @"blue_triangle.png"];
        [selectedView setImage:blueTriangle];
        [compareArray addObject:@"Blue Triangle"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Green Square"]) {
        UIImage *greenSquare = [UIImage imageNamed: @"green_square.png"];
        [selectedView setImage:greenSquare];
        [compareArray addObject:@"Green Square"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Green Circle"]) {
        UIImage *greenCircle = [UIImage imageNamed: @"green_circle.png"];
        [selectedView setImage:greenCircle];
        [compareArray addObject:@"Green Circle"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Green Triangle"]) {
        UIImage *greenTriangle = [UIImage imageNamed: @"green_triangle.png"];
        [selectedView setImage:greenTriangle];
        [compareArray addObject:@"Green Triangle"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Red Square"]) {
        UIImage *redSquare = [UIImage imageNamed: @"pink_square.png"];
        [selectedView setImage:redSquare];
        [compareArray addObject:@"Red Square"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Red Circle"]) {
        UIImage *redCircle = [UIImage imageNamed: @"pink_circle.png"];
        [selectedView setImage:redCircle];
        [compareArray addObject:@"Red Circle"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Red Triangle"]) {
        UIImage *redTriangle = [UIImage imageNamed: @"pink_triangle.png"];
        [selectedView setImage:redTriangle];
        [compareArray addObject:@"Red Triangle"];
    }
    
    if ([tagString isEqual:[tagArray lastObject]]) {
        
        
        //Put in another loop that checks what the command object is (shape, color) and assign it to one of the compareArray objects
        //random compareArray.count to and change the image - replace object at index
        
        //NSLog(@"%i", shapesOnScreen);
        //int t = arc4random()% shapesOnScreen;
        int t = arc4random_uniform(shapesOnScreen);
        NSLog(@"%i", t);
        
        for (ShapeView *subview in self.view.subviews) {
            if ([subview isKindOfClass:[ShapeView class]]) {
                if (subview.tag == t) {
                    if ([pickedCommand isEqual:@"Blue Square"]){
                        UIImage *blueSquare = [UIImage imageNamed: @"blue_square.png"];
                        [subview setImage:blueSquare];
                        [compareArray replaceObjectAtIndex:t withObject:@"Blue Square"];
                    } else if ([pickedCommand isEqual:@"Blue Circle"]){
                        UIImage *blueCircle = [UIImage imageNamed: @"blue_circle.png"];
                        [subview setImage:blueCircle];
                        [compareArray replaceObjectAtIndex:t withObject:@"Blue Circle"];
                    } else if ([pickedCommand isEqual:@"Blue Triangle"]){
                        UIImage *blueTriangle = [UIImage imageNamed: @"blue_triangle.png"];
                        [subview setImage:blueTriangle];
                        [compareArray replaceObjectAtIndex:t withObject:@"Blue Triangle"];
                    } else if ([pickedCommand isEqual:@"Green Square"]){
                        UIImage *greenSquare = [UIImage imageNamed: @"green_square.png"];
                        [subview setImage:greenSquare];
                        [compareArray replaceObjectAtIndex:t withObject:@"Green Square"];
                    } else if ([pickedCommand isEqual:@"Green Circle"]){
                        UIImage *greenCircle = [UIImage imageNamed: @"green_circle.png"];
                        [subview setImage:greenCircle];
                        [compareArray replaceObjectAtIndex:t withObject:@"Green Circle"];
                    } else if ([pickedCommand isEqual:@"Green Triangle"]){
                        UIImage *greenTriangle = [UIImage imageNamed: @"green_triangle.png"];
                        [subview setImage:greenTriangle];
                        [compareArray replaceObjectAtIndex:t withObject:@"Green Triangle"];
                    } else if ([pickedCommand isEqual:@"Red Square"]){
                        UIImage *redSquare = [UIImage imageNamed: @"pink_square.png"];
                        [subview setImage:redSquare];
                        [compareArray replaceObjectAtIndex:t withObject:@"Red Square"];
                    } else if ([pickedCommand isEqual:@"Red Circle"]){
                        UIImage *redCircle = [UIImage imageNamed: @"pink_circle.png"];
                        [subview setImage:redCircle];
                        [compareArray replaceObjectAtIndex:t withObject:@"Red Circle"];
                    } else if ([pickedCommand isEqual:@"Red Triangle"]){
                        UIImage *redTriangle = [UIImage imageNamed: @"pink_triangle.png"];
                        [subview setImage:redTriangle];
                        [compareArray replaceObjectAtIndex:t withObject:@"Red Triangle"];
                    }
                }
            }
        }
        
        return;
    } else {
        [self shapeColorAllViewsWithinArray:tagArray atIndex:tagIndex+1];
    }
    unpickedCommandsArray = [commandArray mutableCopy];
    
}

- (void) didChooseView: (ShapeView *) shapeView{
    if ([compareArray objectAtIndex:shapeView.tag] == pickedCommand) {
        for (ShapeView *subview in self.view.subviews) {
            if ([subview isKindOfClass:[ShapeView class]]) {
                [subview removeFromSuperview];
            }
        }
        NSLog(@"You Win!");
        shapesOnScreen = 0;
        [compareArray removeAllObjects];
        [self randomCommand];
        [self shapeColorAllViewsWithinArray:arrayOfTags atIndex:0];
    } else {
        for (ShapeView *subview in self.view.subviews) {
            if ([subview isKindOfClass:[ShapeView class]]) {
                [subview removeFromSuperview];
            }
        }
        NSLog(@"You Lose!");
        shapesOnScreen = 0;
        [compareArray removeAllObjects];
        [self randomCommand];
        [self shapeColorAllViewsWithinArray:arrayOfTags atIndex:0];
    }
    
}
- (IBAction)levelSwap:(id)sender {
    if (level == 0) {
        level = 1;
        for (ShapeView *subview in self.view.subviews) {
            if ([subview isKindOfClass:[ShapeView class]]) {
                [subview removeFromSuperview];
            }
        }
        [compareArray removeAllObjects];
        shapesOnScreen = 0;
        [self randomCommand];
        [self shapeColorAllViewsWithinArray:arrayOfTags atIndex:0];
        NSLog(@"1");
    }else if (level == 1){
        level = 2;
        for (ShapeView *subview in self.view.subviews) {
            if ([subview isKindOfClass:[ShapeView class]]) {
                [subview removeFromSuperview];
            }
        }
        [compareArray removeAllObjects];
        shapesOnScreen = 0;
        [self randomCommand];
        [self shapeColorAllViewsWithinArray:arrayOfTags atIndex:0];
        NSLog(@"0");
    } else if (level == 2){
        level = 3;
        for (ShapeView *subview in self.view.subviews) {
            if ([subview isKindOfClass:[ShapeView class]]) {
                [subview removeFromSuperview];
            }
        }
        [compareArray removeAllObjects];
        shapesOnScreen = 0;
        [self randomCommand];
        [self shapeColorAllViewsWithinArray:arrayOfTags atIndex:0];
    } else if (level == 3){
        level = 0;
        for (ShapeView *subview in self.view.subviews) {
            if ([subview isKindOfClass:[ShapeView class]]) {
                [subview removeFromSuperview];
            }
        }
        [compareArray removeAllObjects];
        shapesOnScreen = 0;
        [self randomCommand];
        [self shapeColorAllViewsWithinArray:arrayOfTags atIndex:0];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
