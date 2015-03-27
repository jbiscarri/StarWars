//
//  AGTUniverseTableViewController.m
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 26/03/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTUniverseTableViewController.h"
#import "AGTCharacterViewController.h"
#import "AGTStarWarsUniverse.h"
#import "Settings.h"

@interface AGTUniverseTableViewController ()

@end

@implementation AGTUniverseTableViewController

-(id) initWithModel:(AGTStarWarsUniverse*) model
              style:(UITableViewStyle)style{
    
    if (self = [super initWithStyle:style]) {
        _model = model;
        self.title = @"StarWars Universe";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {

    if (section == IMPERIAL_SECTION) {
        return self.model.imperialCount;
    }else{
        return self.model.rebelCount;
    }
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView
       cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    // Averiguar de qué modelo (personaje) me está hablando
    AGTStarWarsCharacter *character = nil;
    
    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialAtIndex:indexPath.row];
    }else{
        character = [self.model rebelAtIndex:indexPath.row];
    }
    
    
    // Crear una celda
    static NSString *cellId = @"StarWarsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        // La tenemos que crear nosotros desde cero
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleSubtitle
                reuseIdentifier:cellId];
    }
    
    // Configurarla
    // Sincronizar modelo (personaje) -> vista (celda)
    cell.imageView.image = character.photo;
    cell.textLabel.text  = character.alias;
    cell.detailTextLabel.text = character.name;
    
    // Devolverla
    return cell;
    
}


-(NSString*) tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    
    if (section == IMPERIAL_SECTION) {
        return @"Imperials";
    }else{
        return @"Rebels";
    }
}


#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // Averiguar de qué modelo(personaje) me están hablando
    // Deberes: -(AGTStarWarsCharacter *) characteratIndexPath:(NSIndexPath*)
    AGTStarWarsCharacter *character;
    if (indexPath.section == IMPERIAL_SECTION) {
        character = [self.model imperialAtIndex:indexPath.row];
    }else{
        character = [self.model rebelAtIndex:indexPath.row];
    }
    
    
    // Avisar al delegado (siempre y cuando entienda
    // el mensaje)
    if ([self.delegate respondsToSelector:@selector(universeTableViewController:didSelectCharacter:)]) {
        
        // te lo mando
        [self.delegate universeTableViewController:self
                                didSelectCharacter:character];
    }
    
    // mandamos una notificación
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    NSDictionary *dict = @{CHARACTER_KEY : character};
    NSNotification *n = [NSNotification
                         notificationWithName:CHARACTER_DID_CHANGE_NOTIFICATION_NAME
                         object:self
                         userInfo:dict];
    
    [nc postNotification:n];
    
    
    // Guardamos las coordenadas del último personaje
    NSArray *coords = @[@(indexPath.section), @(indexPath.row)];
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setObject:coords
            forKey:LAST_SELECTED_CHARACTER];
    [def synchronize];
    
}

#pragma mark - AGTUniverseTableViewControllerDelegate
-(void) universeTableViewController:(AGTUniverseTableViewController *)uVC
                 didSelectCharacter:(AGTStarWarsCharacter *)character{
    
    
    // Creamos un CharacterVC
    AGTCharacterViewController *charVC = [[AGTCharacterViewController alloc] initWithModel:character];
    
    // Hago un push
    [self.navigationController pushViewController:charVC
                                         animated:YES];
    
    
}




@end






