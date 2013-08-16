//
//  ShapeView.m
//  NickOfTime
//
//  Created by Matthew Kish on 8/16/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import "ShapeView.h"

@implementation ShapeView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [delegate didChooseView:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
