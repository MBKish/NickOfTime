//
//  FindTheObjectViewController.h
//  NickOfTime
//
//  Created by Brian Dinh on 8/15/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickedDelegate.h"
#import "WinOrLoseDelegate.h"

@interface FindTheObjectViewController : UIViewController <PickedDelegate>

- (void) didChooseView: (ShapeView *) shapeView;
@property (strong, nonatomic) id<WinOrLoseDelegate>testDelegate;

@end
