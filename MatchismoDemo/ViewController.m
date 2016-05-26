//
//  ViewController.m
//  MatchismoDemo
//
//  Created by Jerry on 5/15/16.
//  Copyright © 2016 Jerry. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmented2or3;
@property (nonatomic) BOOL two;
@property (nonatomic) BOOL three;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *showMatchingComment;

@end

@implementation ViewController
- (IBAction)choseMatching2or3Cards:(UISegmentedControl *)sender {
  NSUInteger index = [sender selectedSegmentIndex];
  switch (index) {
    case 0:
      self.two = YES;
      self.three = NO;
      break;
    
    case 1:
      self.two = NO;
      self.three = YES;
      break;
      
    default:
      break;
  }
}
- (IBAction)reDealButton:(UIButton *)sender {
  self.game = nil;
  [self game];
  [self updateUI];
  self.segmented2or3.enabled = YES;
}

- (CardMatchingGame *)game
{
  if (!_game) {
    _game = [[CardMatchingGame alloc] initWithCardCount: [self.cardButtons count]
                                              usingDeck:[self creatDeck]];
  }
  return _game;
}

- (Deck *)creatDeck
{
  return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
  self.segmented2or3.enabled = NO;
  NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];

  if (self.two == YES || self.three != YES) {
    [self.game chooseCardAtIndex:chosenButtonIndex];
  } else {
    [self.game chooseCardAtIndex:chosenButtonIndex matchCards:3];
  }
  [self updateUI];
}

- (void)updateUI
{
  for (UIButton *cardButton in self.cardButtons) {
    NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
    Card *card = [self.game cardAtIndex:cardButtonIndex];
    [cardButton setTitle:[self titleForCard:card]
                forState:UIControlStateNormal];
    [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                          forState:UIControlStateNormal];
    cardButton.enabled = !card.isMatched;
    self.showMatchingComment.text = self.game.comment;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
  }
}

- (NSString *)titleForCard:(Card *)card
{
  return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
  return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
@end
