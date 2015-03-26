//
//  AGTCharacterViewController.h
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 24/03/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

@import UIKit;

#import "AGTStarWarsCharacter.h"
#import "CafPLayer.h"

@interface AGTCharacterViewController : UIViewController<UISplitViewControllerDelegate>

@property (nonatomic, strong) CafPlayer *player;
@property (nonatomic, strong) AGTStarWarsCharacter *model;
@property (nonatomic, weak) IBOutlet UIImageView *photoView;


-(IBAction)playSound:(id)sender;
-(IBAction)displayWiki:(id)sender;

-(id) initWithModel:(AGTStarWarsCharacter *) model;


@end
