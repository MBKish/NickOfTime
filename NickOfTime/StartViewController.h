//
//  StartViewController.h
//  NickOfTime
//
//  Created by Brian Dinh on 8/20/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FUIAlertView.h"

@interface StartViewController : UIViewController<FUIAlertViewDelegate>

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex;

@end
