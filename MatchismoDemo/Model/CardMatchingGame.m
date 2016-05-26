//
//  CardMatchingGame.m
//  MatchismoDemo
//
//  Created by Jerry on 5/18/16.
//  Copyright © 2016 Jerry. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, readwrite) NSString *comment;
@property (nonatomic, strong) NSMutableArray *cards;
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
  if (!_cards) {
    _cards = [[NSMutableArray alloc] init];
  }
  return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
  self = [super init];
  
  if (self) {
    for (int i = 0; i < count; i++) {
      Card *card = [deck drawRandomCard];
      if (card) {
        [self.cards addObject:card];
      } else {
        self = nil;
        break;
      }
    }
  }
  return self;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index
{
  Card *card = [self cardAtIndex:index];
  if (!card.isMatched) {
    if (card.isChosen) {
      card.chosen = NO;
    } else {
      //match against other chosen cards
      for (Card *othercard in self.cards) {
        if (!othercard.isMatched && othercard.isChosen) {
          int matchScore = [card match:@[othercard]];
          if (matchScore) {
            self.score += matchScore * MATCH_BONUS;
            card.matched = YES;
            othercard.matched = YES;
          } else {
            self.score -= MISMATCH_PENALTY;
            othercard.chosen = NO;
          }
          break;
        }
      }
      self.score -= COST_TO_CHOOSE;
      card.chosen = YES;
    }
  }
}

- (void)chooseCardAtIndex:(NSUInteger)index matchCards:(NSUInteger)three
{
  Card *card = [self cardAtIndex:index];
  if (!card.isMatched) {
    if (card.isChosen) {
      card.chosen = NO;
      self.comment = [NSString stringWithFormat:@""];
    } else {
      //match against other chosen cards
      for (Card *other1 in self.cards) {
        if (card != other1 && !other1.isMatched && other1.isChosen) {
          for (Card *other2 in self.cards) {
            if (other2 != card && other2 != other1 &&
                !other2.isMatched && other2.isChosen) {
              
              int matchScore = [card match:@[other1, other2]];
              if (matchScore) {
                self.score += matchScore * MATCH_BONUS;
                card.matched = YES;
                other1.matched = YES;
                other2.matched = YES;
                self.comment = [NSString stringWithFormat:
                                @"Matched %@ %@ %@ for %d points.",card.contents,
                                other1.contents, other2.contents,
                                matchScore* MATCH_BONUS];
              } else {
                self.score -= MISMATCH_PENALTY;
                other1.chosen = NO;
                other2.chosen = NO;
                self.comment = [NSString stringWithFormat:
                                @"%@ %@ %@ don't match! %d points penalty!",
                                card.contents, other1.contents, other2.contents,
                                MISMATCH_PENALTY];
              }
              break;
              //              goto out;
            }
          }

        }
        self.comment = [NSString stringWithFormat:@"%@",card.contents];
      }
      //      out:
      self.score -= COST_TO_CHOOSE;
      card.chosen = YES;
    }
  }
}
- (Card *)cardAtIndex:(NSUInteger)index
{
  return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
