//
//  Deck.h
//  MatchismoDemo
//
//  Created by Jerry on 5/16/16.
//  Copyright © 2016 Jerry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;
@end
