//
//  CardGameViewController.h
//  Matchismo
//
//  Created by Sanjib Ahmad on 11/3/13.
//  Copyright (c) 2013 <>< ObjectCoder. All rights reserved.
//
//  Abstract class. Must implement methods as described below.

#import <UIKit/UIKit.h>
#import "Deck.h"

@interface CardGameViewController : UIViewController <UIAlertViewDelegate>


// protected
// for subclasses
- (Deck *)createDeck;    // abstract

- (NSAttributedString *)titleForCard:(Card *)card;
- (UIImage *)backgroundImageForCard:(Card *)card;
- (void)updateUI;

@end
