//
//  ViewController.m
//  MatchismoDemo
//
//  Created by Jerry on 5/15/16.
//  Copyright © 2016 Jerry. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation ViewController

- (void) setFlipCount:(int)flipCount
{
  _flipCount = flipCount;
  self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
  if ([sender.currentTitle length]) {
    [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                      forState:UIControlStateNormal];
    [sender setTitle:@"" forState:UIControlStateNormal];
  } else {
    [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                      forState:UIControlStateNormal];
    [sender setTitle:@"A♣️" forState:UIControlStateNormal];
  }
  self.flipCount++;
}

@end
