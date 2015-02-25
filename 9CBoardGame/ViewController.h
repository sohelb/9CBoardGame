//
//  ViewController.h
//  9CBoardGame
//
//  Created by Sohel Bukhari on 2/23/15.
//  Copyright (c) 2015 SB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

- (IBAction)newGameButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *gameStatusLabel;

@end

