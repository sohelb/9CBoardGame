//
//  ViewController.m
//  9CBoardGame
//
//  Created by Sohel Bukhari on 2/23/15.
//  Copyright (c) 2015 SB. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    IBOutlet UIImageView *ibox0;
    IBOutlet UIImageView *ibox1;
    IBOutlet UIImageView *ibox2;
    IBOutlet UIImageView *ibox3;
    IBOutlet UIImageView *ibox4;
    IBOutlet UIImageView *ibox5;
    IBOutlet UIImageView *ibox6;
    IBOutlet UIImageView *ibox7;
    IBOutlet UIImageView *ibox8;
    
    
    BOOL gameOn;
    
    NSMutableArray *boxIndex;
    
    UIImage *cicle;
    UIImage *cross;
    
     NSNumber *spotEmpty;
     NSNumber *spotPlayer;
     NSNumber *spotApp;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    cicle = [UIImage imageNamed:@"circle.png"];
    cross = [UIImage imageNamed:@"cross.png"];
    
    spotEmpty = [NSNumber numberWithInt:0];
    spotPlayer = [NSNumber numberWithInt:1];
    spotApp = [NSNumber numberWithInt:2];
    
    boxIndex = [[NSMutableArray alloc] init];
    for (int i = 0; i<10; i++) {
        [boxIndex addObject:spotEmpty];
    }
    gameOn = YES;
    
    UITapGestureRecognizer *b0tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxTap:)];

    UITapGestureRecognizer *b1tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxTap:)];
    UITapGestureRecognizer *b2tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxTap:)];

    UITapGestureRecognizer *b3tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxTap:)];

    UITapGestureRecognizer *b4tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxTap:)];
    UITapGestureRecognizer *b5tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxTap:)];
    UITapGestureRecognizer *b6tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxTap:)];
    UITapGestureRecognizer *b7tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxTap:)];
    UITapGestureRecognizer *b8tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxTap:)];

    
    [ibox0 addGestureRecognizer:b0tap];
    [ibox1 addGestureRecognizer:b1tap];
    [ibox2 addGestureRecognizer:b2tap];
    [ibox3 addGestureRecognizer:b3tap];
    [ibox4 addGestureRecognizer:b4tap];
    [ibox5 addGestureRecognizer:b5tap];
    [ibox6 addGestureRecognizer:b6tap];
    [ibox7 addGestureRecognizer:b7tap];
    [ibox8 addGestureRecognizer:b8tap];

    [self performSelector:@selector(setLabelValue:) withObject:@"New Game Started" afterDelay:.1];
}

- (void) boxTap:(UITapGestureRecognizer *)tappedOn{
    
    if (!gameOn) {
        [self performSelector:@selector(setLabelValue:) withObject:@"Start New Game" afterDelay:.1];
        return;
    }
    
    if(tappedOn.view == ibox0){
        if(!ibox0.image){
            [ibox0 setImage:cicle];
            [boxIndex replaceObjectAtIndex:0 withObject:spotPlayer];
            [self moveIt];
            return;
        }
    }
    else if (tappedOn.view == ibox1){
        if(!ibox1.image){
            [ibox1 setImage:cicle];
            [boxIndex replaceObjectAtIndex:1 withObject:spotPlayer];
            [self moveIt];
            return;
        }
    }
    else if (tappedOn.view == ibox2){
        if(!ibox2.image){
            [ibox2 setImage:cicle];
            [boxIndex replaceObjectAtIndex:2 withObject:spotPlayer];
            [self moveIt];
            return;
        }
    }
    else if (tappedOn.view == ibox3){
        if(!ibox3.image){
            [ibox3 setImage:cicle];
            [boxIndex replaceObjectAtIndex:3 withObject:spotPlayer];
            [self moveIt];
            return;
        }
    }
    else if (tappedOn.view == ibox4){
        if(!ibox4.image){
            [ibox4 setImage:cicle];
            [boxIndex replaceObjectAtIndex:4 withObject:spotPlayer];
            [self moveIt];
            return;
        }
    }
    else if (tappedOn.view == ibox5){
        if(!ibox5.image){
            [ibox5 setImage:cicle];
            [boxIndex replaceObjectAtIndex:5 withObject:spotPlayer];
            [self moveIt];
            return;
        }
    }
    else if (tappedOn.view == ibox6){
        if(!ibox6.image){
            [ibox6 setImage:cicle];
            [boxIndex replaceObjectAtIndex:6 withObject:spotPlayer];
            [self moveIt];
            return;
        }
    }
    else if (tappedOn.view == ibox7){
        if(!ibox7.image){
            [ibox7 setImage:cicle];
            [boxIndex replaceObjectAtIndex:7 withObject:spotPlayer];
            [self moveIt];
            return;
        }
    }
    else if (tappedOn.view == ibox8){
        if(!ibox8.image){
            [ibox8 setImage:cicle];
            [boxIndex replaceObjectAtIndex:8 withObject:spotPlayer];
            [self moveIt];
            return;
        }
    }
}

- (void)moveIt{
    //[self compute];
    if(!ibox0.image && !ibox2.image && !ibox6.image && !ibox8.image){
        [ibox2 setImage:cross];
        [boxIndex replaceObjectAtIndex:2 withObject:spotApp];
    }
    else if(!ibox4.image){
        [ibox4 setImage:cross];
        [boxIndex replaceObjectAtIndex:4 withObject:spotApp];
    }
    else{
        [self compute];
    }
}

- (void) compute{
    //Winning Pair indexe

    NSArray * rowa1 = [NSArray arrayWithObjects:[boxIndex objectAtIndex:0], [boxIndex objectAtIndex:1], [boxIndex objectAtIndex:2], nil];
    NSArray * rowa1i= [NSArray arrayWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:1], [NSNumber numberWithInt:2], nil];
    NSArray * rowa2 = [NSArray arrayWithObjects:[boxIndex objectAtIndex:3], [boxIndex objectAtIndex:4], [boxIndex objectAtIndex:5], nil];
    NSArray * rowa2i= [NSArray arrayWithObjects:[NSNumber numberWithInt:3], [NSNumber numberWithInt:4], [NSNumber numberWithInt:5], nil];
    
    NSArray * rowa3 = [NSArray arrayWithObjects:[boxIndex objectAtIndex:6], [boxIndex objectAtIndex:7], [boxIndex objectAtIndex:8], nil];
    NSArray * rowa3i= [NSArray arrayWithObjects:[NSNumber numberWithInt:6], [NSNumber numberWithInt:7], [NSNumber numberWithInt:8], nil];
    
    NSArray * cola1 = [NSArray arrayWithObjects:[boxIndex objectAtIndex:0], [boxIndex objectAtIndex:3], [boxIndex objectAtIndex:6], nil];
    NSArray * cola1i= [NSArray arrayWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:3], [NSNumber numberWithInt:6], nil];
    
    NSArray * cola2 = [NSArray arrayWithObjects:[boxIndex objectAtIndex:1], [boxIndex objectAtIndex:4], [boxIndex objectAtIndex:7], nil];
    NSArray * cola2i= [NSArray arrayWithObjects:[NSNumber numberWithInt:1], [NSNumber numberWithInt:4], [NSNumber numberWithInt:7], nil];
    
    NSArray * cola3 = [NSArray arrayWithObjects:[boxIndex objectAtIndex:2], [boxIndex objectAtIndex:5], [boxIndex objectAtIndex:8], nil];
    NSArray * cola3i= [NSArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:5], [NSNumber numberWithInt:8], nil];
    
    NSArray * xa1 = [NSArray arrayWithObjects:[boxIndex objectAtIndex:0], [boxIndex objectAtIndex:4], [boxIndex objectAtIndex:8], nil];
    NSArray * xa1i= [NSArray arrayWithObjects:[NSNumber numberWithInt:0], [NSNumber numberWithInt:4], [NSNumber numberWithInt:8], nil];
    
    NSArray * xa2 = [NSArray arrayWithObjects:[boxIndex objectAtIndex:2], [boxIndex objectAtIndex:4], [boxIndex objectAtIndex:6], nil];
    NSArray * xa2i= [NSArray arrayWithObjects:[NSNumber numberWithInt:2], [NSNumber numberWithInt:4], [NSNumber numberWithInt:6], nil];
    
    NSDictionary *rowd1 = [NSDictionary dictionaryWithObjectsAndKeys:rowa1 ,rowa1i, nil];
    NSDictionary *rowd2 = [NSDictionary dictionaryWithObjectsAndKeys:rowa2 ,rowa2i, nil];
    NSDictionary *rowd3 = [NSDictionary dictionaryWithObjectsAndKeys:rowa3 ,rowa3i, nil];
    NSDictionary *cold1 = [NSDictionary dictionaryWithObjectsAndKeys:cola1 ,cola1i, nil];
    NSDictionary *cold2 = [NSDictionary dictionaryWithObjectsAndKeys:cola2 ,cola2i, nil];
    NSDictionary *cold3 = [NSDictionary dictionaryWithObjectsAndKeys:cola3 ,cola3i, nil];
    NSDictionary *xd1 = [NSDictionary dictionaryWithObjectsAndKeys:xa1 ,xa1i, nil];
    NSDictionary *xd2 = [NSDictionary dictionaryWithObjectsAndKeys:xa2 ,xa2i, nil];
    
    // Pair Complete Check
    NSArray* shellArray = [NSArray arrayWithObjects:rowd1, rowd2, rowd3, cold1, cold2, cold3, xd1, xd2, nil];
    int enumCounter=0;
    for (NSDictionary* pair in shellArray) {
        for (NSArray* vals in [pair allValues]) {
            int one3 = 0;
            int two3 = 0;
            for (id val in vals) {
                enumCounter++;

                if ([val intValue] == 1) {
                    one3++;
                }else if([val intValue] == 2){
                    two3++;
                }
                
                if(one3 == 3){
                    for (NSArray* keys in [pair allKeys]) {
                        [self setPlayerWin:keys];
                    }
                    // end game
                    return;
                }
                else if(two3 == 3){
                    // end game
                    return;
                }
            }
        }
    }
    
    // Pair fulfill check
    // Find chance to Win
    for (NSDictionary* pair in shellArray) {
        
        for (NSArray* vals in [pair allValues]) {
            int one = 0;
            int two = 0;
            for (id val in vals) {
                
                if ([val intValue]== 1) {
                    one++;
                }else if ([val intValue] == 2) {
                    two++;
                }
            }
            if (two == 2) {
                //make move to fill empty slot
                for (NSArray* vals in [pair allValues]) {
                    int indexcounter = -1;
                    
                    for (id val in vals) {
                        indexcounter++;
                        
                        if([val intValue] == 0){
                            //set spot
                            for (NSArray* keys in [pair allKeys]) {
                                //spot to be filled

                                [self setSpot:[[keys objectAtIndex:indexcounter] intValue]  withImage:cross asSpot:[NSNumber numberWithInt:2]];
                                //end game
                                [self setAppWin:keys];
                                return;
                            }
                        }
                    }
                }
            }
        }
    }
    
    // check for opponent's chance to win
    for (NSDictionary* pair in shellArray) {
        
        for (NSArray* vals in [pair allValues]) {
            int one = 0;
            int two = 0;
            for (id val in vals) {
                
                if ([val intValue]== 1) {
                    one++;
                }else if ([val intValue] == 2) {
                    two++;
                }
            }
            if (one == 2) {
                //make move to fill empty slot
                for (NSArray* vals in [pair allValues]) {
                    int indexCounter = -1;
                    for (id val in vals) {
                        indexCounter ++;
                        
                        if([val intValue] == 0){
                            //set spot
                            for (NSArray* keys in [pair allKeys]) {
                                //spot to be filled
                                [self setSpot:[[keys objectAtIndex:indexCounter] intValue]  withImage:cross asSpot:[NSNumber numberWithInt:2]];
                                return;
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Check for single ocupied pairs
    
    for (NSDictionary* pair in shellArray) {
        
        for (NSArray* vals in [pair allValues]) {
            int one = 0;
            int two = 0;
            for (id val in vals) {
                
                if ([val intValue]== 1) {
                    one++;
                }else if ([val intValue] == 2) {
                    two++;
                }
            }
            if (two == 1 && one == 0) {
                //make move to fill empty slot
                for (NSArray* vals in [pair allValues]) {
                    int indexCounter = -1;
                    for (id val in vals) {
                        indexCounter ++;
                        
                        if([val intValue] == 0){
                            //set spot
                            for (NSArray* keys in [pair allKeys]) {
                                //spot to be filled
                                [self setSpot:[[keys objectAtIndex:indexCounter] intValue]  withImage:cross asSpot:[NSNumber numberWithInt:2]];
                                return;
                            }
                        }
                    }
                }
            }
        }
    }

    // Check for Single Player ocupied pair
    
    for (NSDictionary* pair in shellArray) {
        
        for (NSArray* vals in [pair allValues]) {
            int one = 0;
            int two = 0;
            for (id val in vals) {
                
                if ([val intValue]== 1) {
                    one++;
                }else if ([val intValue] == 2) {
                    two++;
                }
            }
            if (two == 0 && one == 1) {
                //make move to fill empty slot
                for (NSArray* vals in [pair allValues]) {
                    int indexCounter = -1;
                    for (id val in vals) {
                        indexCounter ++;
                        
                        if([val intValue] == 0){
                            //set spot
                            for (NSArray* keys in [pair allKeys]) {
                                //spot to be filled
                                [self setSpot:[[keys objectAtIndex:indexCounter] intValue]  withImage:cross asSpot:[NSNumber numberWithInt:2]];
                                return;
                            }
                        }
                    }
                }
            }
        }
    }
    
    // Check for Game drow and all cell full
    
    for (NSDictionary* pair in shellArray) {
        
        for (NSArray* vals in [pair allValues]) {
            int zero = 0;
            for (id val in vals) {
                if ([val intValue]== 0) {
                    zero++;
                }
            }
            if (zero == 0) {
                [self setDraw];
                //end game with draw results
            }
        }
    }
}

- (void)setSpot:(int)index withImage:(UIImage *)image asSpot:(NSNumber *)spotVal{
    switch (index) {
        case 0:
            [ibox0 setImage:image];
            [boxIndex replaceObjectAtIndex:0 withObject:spotVal];
            break;
        case 1:
            [ibox1 setImage:image];
            [boxIndex replaceObjectAtIndex:1 withObject:spotVal];
            break;
        case 2:
            [ibox2 setImage:image];
            [boxIndex replaceObjectAtIndex:2 withObject:spotVal];
            break;
        case 3:
            [ibox3 setImage:image];
            [boxIndex replaceObjectAtIndex:3 withObject:spotVal];
            break;
        case 4:
            [ibox4 setImage:image];
            [boxIndex replaceObjectAtIndex:4 withObject:spotVal];
            break;
        case 5:
            [ibox5 setImage:image];
            [boxIndex replaceObjectAtIndex:5 withObject:spotVal];
            break;
        case 6:
            [ibox6 setImage:image];
            [boxIndex replaceObjectAtIndex:6 withObject:spotVal];
            break;
        case 7:
            [ibox7 setImage:image];
            [boxIndex replaceObjectAtIndex:7 withObject:spotVal];
            break;
        case 8:
            [ibox8 setImage:image];
            [boxIndex replaceObjectAtIndex:8 withObject:spotVal];
            break;
        
        default:
            break;
    }
}

- (void)setPlayerWin:(NSArray *)pair{

    // winning boxes in pair
    gameOn = NO;
    [self performSelector:@selector(setLabelValue:) withObject:@"You Win the Game" afterDelay:.1];
    
}

- (void)setAppWin:(NSArray *)pair{
    // winning boxes in pair
    
    gameOn = NO;
    [self performSelector:@selector(setLabelValue:) withObject:@"Sorry You lost the Game" afterDelay:.1];
  
}
- (void) setDraw{
    gameOn = NO;
    [self performSelector:@selector(setLabelValue:) withObject:@"Sorry the Game is Draw" afterDelay:.1];
}

- (void) startNewGame{

    gameOn = YES;
    
    [ibox0 setImage:nil];
    [ibox1 setImage:nil];
    [ibox2 setImage:nil];
    [ibox3 setImage:nil];
    [ibox4 setImage:nil];
    [ibox5 setImage:nil];
    [ibox6 setImage:nil];
    [ibox7 setImage:nil];
    [ibox8 setImage:nil];
  
    for (int i = 0; i<[boxIndex count]; i++) {
        [boxIndex replaceObjectAtIndex:i withObject:spotEmpty];
    }

    [self performSelector:@selector(setLabelValue:) withObject:@"New Game Started" afterDelay:.1];
}

- (void) setLabelValue:(NSString*)valString{
    self.gameStatusLabel.hidden = NO;
    self.gameStatusLabel.text = valString;

    [self performSelector:@selector(setLabelValue:) withObject:@"" afterDelay:3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)newGameButton:(id)sender {
    [self startNewGame];
}
@end
