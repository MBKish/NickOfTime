//
//  SwipeViewController.h
//  NickOfTime
//
//  Created by Brian Dinh on 8/15/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WinDelegate.h"

@interface SwipeViewController : UIViewController

@property (strong, nonatomic) id<WinDelegate>delegate;

@end
