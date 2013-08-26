//
//  PressDelegate.h
//  NickOfTime
//
//  Created by Yaniv Kerem on 8/22/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ColorButtons;

@protocol PressDelegate <NSObject>

-(void) didClickGameView: (ColorButtons *) thisView;

@end
