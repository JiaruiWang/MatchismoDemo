//
//  PlayingCard.m
//  MatchismoDemo
//
//  Created by Jerry on 5/16/16.
//  Copyright © 2016 Jerry. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
  int score = 0;
  if ([otherCards count] == 1) {
    PlayingCard *otherCard = [otherCards firstObject];
    if (otherCard.rank == self.rank) {
      score = 4;
    } else if ([otherCard.suit isEqualToString:self.suit]) {
      score = 1;
    }
  }
  
  if ([otherCards count] == 2) {
    PlayingCard *other1 = [otherCards firstObject];
    PlayingCard *other2 = [otherCards lastObject];
    if ([self.suit isEqualToString:other1.suit] &&
        [self.suit isEqualToString:other2.suit]) {
      score = 4;
    } else if (self.rank == other1.rank &&
               self.rank == other2.rank) {
      score = 16;
    } else if (self.rank == other1.rank ||
               self.rank == other2.rank ||
               other1.rank == other2.rank){
      score = 4;
    } else if ([self.suit isEqualToString:other1.suit] ||
               [self.suit isEqualToString:other2.suit] ||
               [other1.suit isEqualToString:other2.suit]) {
      score = 1;
    }
    
  }
  return score;
}

- (NSString *)contents
{
  NSArray *rankStrings = [PlayingCard rankStrings];
  return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit
{
  if ([[PlayingCard validSuits] containsObject:suit]) {
    _suit = suit;
  }
}

- (NSString *)suit
{
  return _suit? _suit:@"?";
}

+ (NSArray *)validSuits
{
  return @[@"♥️", @"♦️", @"♣️", @"♠️"];
}

+ (NSArray *)rankStrings
{
  return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6",
           @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank
{
  return [[self rankStrings] count] -1;
}

- (void)setRank:(NSUInteger)rank
{
  if (rank <= [PlayingCard maxRank]) {
    _rank = rank;
  }
}
@end
