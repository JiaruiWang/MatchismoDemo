//
//  ViewController.m
//  MatchismoDemo
//
//  Created by Jerry on 5/15/16.
//  Copyright © 2016 Jerry. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *deck;
@end

@implementation ViewController

- (Deck *)deck
{
  if (!_deck) {
    _deck = [self creatDeck];
  }
  return _deck;
}

- (Deck *)creatDeck
{
  return [[PlayingCardDeck alloc] init];
}

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
    Card *randomCard = [self.deck drawRandomCard];
    if (randomCard) {
      [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                        forState:UIControlStateNormal];
      [sender setTitle:randomCard.contents forState:UIControlStateNormal];
      self.flipCount++;
    }
  }

}

@end
