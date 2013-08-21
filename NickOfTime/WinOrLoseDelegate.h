//
//  WinOrLoseDelegate.h
//  NickOfTime
//
//  Created by Brian Dinh on 8/20/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WinOrLoseDelegate <NSObject>

-(void)didWinGame;
-(void)didLoseGame;

@end
