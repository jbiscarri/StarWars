//
//  AGTCharacterViewController.m
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 24/03/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTCharacterViewController.h"
#import "AGTWikiViewController.h"

@implementation AGTCharacterViewController

#pragma mark - Init
-(id) initWithModel:(AGTStarWarsCharacter *) model{
    
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = model;
        self.title = [model alias];
    }
    
    return self;
}

#pragma mark - View Lifecycle

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // Asegurarse de que no se ocupa toda la pantalla
    // cuando estás en un combinador
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    
    // Sincronizar modelo -> vista
    self.photoView.image = self.model.photo;
    
    
}

#pragma mark - Memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
-(IBAction)playSound:(id)sender{
    
    // Sacamos el sonido del modelo
    // Lo reproducimos
    self.player = [CafPlayer cafPlayer];
    [self.player playSoundData:self.model.soundData];
    
    
}


-(IBAction)displayWiki:(id)sender{
    
    // Crear un WikiVC
    AGTWikiViewController *wVC = [[AGTWikiViewController alloc]
                                  initWithModel:self.model];
    // Hacer un push
    [self.navigationController pushViewController:wVC
                                         animated:YES];
    
}


#pragma mark - UISplitViewControllerDelegate
-(void) splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    
    // Averiguar si la tabla se ve o no
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        
        // La tabla está oculta y cuelga del botón
        // Ponemos ese botón en mi barra de navegación
        self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem;
    }else{
        // Se muestra la tabla: oculto el botón de la
        // barra de navegación
        self.navigationItem.leftBarButtonItem = nil;
    }
    
    
}























@end
