//
//  SetCardGameViewController.m
//  Matchismo
//
//  Created by Haluk Isik on 23/03/14.
//  Copyright (c) 2014 <>< ObjectCoder. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"
#import "CardMatchingGame.h"

@interface SetCardGameViewController ()
//@property (strong, nonatomic) SetCardMatchingGame
//@property (strong, nonatomic) CardMatchingGame *game;
//@property (strong, nonatomic) SetCardMatchingGame *game;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
//@property (nonatomic) NSInteger numberOfCardsToPlayWith;


@end

@implementation SetCardGameViewController

- (Deck *)createDeck
{
    return [[SetCardDeck alloc] init];
}
/*
- (IBAction)touchCardButton:(UIButton *)sender {
    NSLog(@"karta tıklandı");
    int chosenButtonIndex = (int)[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}
*/
- (NSAttributedString *)titleForCard:(Card *)card
{
    NSString *shapeString = @"";
    NSArray *shapes = @[@"▲", @"●", @"■"];
//    NSArray *shapes = @[@"1", @"2", @"3"];
    CGFloat color1 = 0.0, color2 = 0.0, color3 = 0.0, alpha1 = 0.0, outlined = 0.0;
    
    if ([card isKindOfClass:[SetCard class]]) {
        SetCard *setCard = (SetCard *)card;
        // Select colors of our card (0 = red, 1 = green, 2 = blue)
        if (setCard.acolor == 0)
            color1 = 1.0;
        else if (setCard.acolor == 1)
            color2 = 1.0;
        else if (setCard.acolor == 2)
            color3 = 1.0;
        
        // Select shading (0 = outlined, 1 = striped or semi-transparent, 2 = solid)
        // If outlined, make background transparent
        if (setCard.shading == 0) {
            alpha1 = 1.0; outlined = 1; }
        else if (setCard.shading == 1)
            alpha1 = 0.3;
        else if (setCard.shading == 2)
            alpha1 = 1.0;
        // Select symbol and number
        for(int i=0;i<=setCard.number;i++) {
//        for (NSString *aShapeString in shapes) {
            shapeString = [shapeString stringByAppendingString:(NSString *)shapes[setCard.symbol]];
//            [shapeString stringByAppendingString:aShapeString];
//            shapeString = [shapeString stringByAppendingString:@"\n"];

        }
        NSLog(@"shape string: %@", shapeString);
        NSLog(@"symbol: %lu", setCard.symbol);
        NSLog(@"shading: %lu", setCard.shading);
        NSLog(@"color: %lu", setCard.acolor);
        NSLog(@"number: %lu", setCard.number);

    }
    
    // Set our line height of the paragraph attribute so that symbols line up nicely
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.minimumLineHeight = 12;
//    paragraphStyle.maximumLineHeight = 5.0f;
    
    // Set our color and shading accordingly
    UIColor *colorAndShading = [[UIColor alloc] initWithRed:color1 green:color2 blue:color3 alpha:alpha1];
    
    // Let's make our attributed string
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:shapeString];
    [title setAttributes:@{NSStrokeWidthAttributeName : @(outlined ? 3 : 0),
                           NSStrokeColorAttributeName : colorAndShading,
                           NSFontAttributeName: [UIFont systemFontOfSize:24],
                           NSForegroundColorAttributeName: colorAndShading,
                           NSParagraphStyleAttributeName: paragraphStyle}
                   range:NSMakeRange(0, [title length])];
    //NSLog(@"title length: %lu", (unsigned long)title.length);
    return title;
    
}
//- (void)updateUI
//{
//    for (UIButton *cardButton in self.cardButtons) {
//        int cardButtonIndex = (int)[self.cardButtons indexOfObject:cardButton];
//        SetCard *card = (SetCard *)[self.game cardAtIndex:cardButtonIndex];

        
        // And print it on each card
//        [cardButton setAttributedTitle:title
//                    forState:UIControlStateNormal];
//        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
//                              forState:UIControlStateNormal];
//        cardButton.enabled = !card.isMatched;
//    }
//    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
//    self.statusLabel.text = self.game.status;
//    NSLog(@"UI updated");
//}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.chosen ? @"setCardSelected" : @"setCard"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self updateUI];
//    self.numberOfCardsToPlayWith = 3;
}


@end
