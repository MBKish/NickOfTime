//
//  PressButtonViewController.h
//  NickOfTime
//
//  Created by Brian Dinh on 8/15/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import "PressDelegate.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "WinOrLoseDelegate.h"

@interface PressButtonViewController : UIViewController<PressDelegate>

@property (strong, nonatomic) id<WinOrLoseDelegate>delegate;

@end
