//
//  ColorButtons.h
//  NickOfTime
//
//  Created by Yaniv Kerem on 8/22/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import "PressDelegate.h"
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ColorButtons : UIView

@property (strong, nonatomic) id <PressDelegate> pressButtonsDelegate;

@end
