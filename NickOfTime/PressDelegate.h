//
//  PressDelegate.h
//  NickOfTime
//
//  Created by Yaniv Kerem on 8/20/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ColorButtons;

@protocol PressDelegate <NSObject>

-(void) didClickGame1View: (ColorButtons *) thisView;

@end
