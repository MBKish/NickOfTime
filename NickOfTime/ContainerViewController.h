//
//  ContainerViewController.h
//  NickOfTime
//
//  Created by Brian Dinh on 8/15/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwipeViewController.h"
#import "FindTheObjectViewController.h"
#import "PressButtonViewController.h"
#import "WinOrLoseDelegate.h"

@interface ContainerViewController : UIViewController

- (void)swapViewControllers2;

@property (strong, nonatomic) SwipeViewController *swipeViewController;
@property (strong, nonatomic) FindTheObjectViewController *findTheObjectViewController;
@property (strong, nonatomic) PressButtonViewController *pressButtonViewController;
@property (strong, nonatomic) id<WinOrLoseDelegate> delegate;


@end
