//
//  ShapeView.h
//  NickOfTime
//
//  Created by Matthew Kish on 8/16/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickedDelegate.h"

@interface ShapeView : UIImageView

@property (strong, nonatomic) id <PickedDelegate> delegate;

@end
