//
//  AGTUniverseTableViewController.h
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 26/03/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#define IMPERIAL_SECTION 0
#define REBEL_SECTION 1

#define CHARACTER_DID_CHANGE_NOTIFICATION_NAME @"characterDidChangeNotification"
#define CHARACTER_KEY @"characterKey"

@import UIKit;

@class AGTStarWarsUniverse;
@class AGTStarWarsCharacter;
@class AGTUniverseTableViewController;

@protocol AGTUniverseTableViewControllerDelegate <NSObject>

@optional
-(void) universeTableViewController:(AGTUniverseTableViewController*)
uVC didSelectCharacter:(AGTStarWarsCharacter *) character;

@end


@interface AGTUniverseTableViewController : UITableViewController

@property (strong, nonatomic) AGTStarWarsUniverse *model;
@property (weak, nonatomic) id<AGTUniverseTableViewControllerDelegate> delegate;

-(id) initWithModel:(AGTStarWarsUniverse*) model
              style:(UITableViewStyle)style;

@end

