//
//  SwipeViewController.h
//  NickOfTime
//
//  Created by Brian Dinh on 8/15/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WinOrLoseDelegate.h"

@interface SwipeViewController : UIViewController

@property (strong, nonatomic) id<WinOrLoseDelegate>delegate;

@end
