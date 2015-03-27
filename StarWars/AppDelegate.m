//
//  AppDelegate.m
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 24/03/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AppDelegate.h"

#import "AGTStarWarsCharacter.h"
#import "AGTCharacterViewController.h"
#import "AGTWikiViewController.h"
#import "AGTStarWarsUniverse.h"
#import "AGTUniverseTableViewController.h"
#import "Settings.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Valor por defecto para último personaje seleccionado
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    if (![def objectForKey:LAST_SELECTED_CHARACTER]) {
        
        // guardamos un valor por defecto
        [def setObject:@[@(IMPERIAL_SECTION), @0]
                forKey:LAST_SELECTED_CHARACTER];
        
        // Por si acaso...
        [def synchronize];
        
    }
    
    
    // Creamos una vista de tipo UIWindow
    [self setWindow:[[UIWindow alloc]
                     initWithFrame:[[UIScreen mainScreen] bounds]]];
    
    
    
    // Creamos un modelo
    AGTStarWarsUniverse *universe = [AGTStarWarsUniverse new];
    
    
    // Detectamos el tipo de pantalla
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        // Tipo tableta
        [self configureForPadWithModel:universe];
    }else{
        // Tipo teléfono
        [self configureForPhoneWithModel:universe];
        
    }
    
    
    
    
    
    // La mostramos
    [[self window] makeKeyAndVisible];
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



-(void) configureForPadWithModel:(AGTStarWarsUniverse*)universe{
    
    // Creamos los controladores
    AGTUniverseTableViewController *uVC = [[AGTUniverseTableViewController alloc] initWithModel:universe style:UITableViewStylePlain];
    
    AGTCharacterViewController *charVC = [[AGTCharacterViewController alloc] initWithModel:[self lastSelectedCharacterInModel:universe]];
    
    // Creamos los navigationControllers
    UINavigationController *uNav = [UINavigationController new];
    [uNav pushViewController:uVC animated:NO];
    
    UINavigationController *cNav = [UINavigationController new];
    [cNav pushViewController:charVC animated:NO];
    
    // Creo el combinador
    UISplitViewController *splitVC = [[UISplitViewController alloc]init];
    splitVC.viewControllers = @[uNav, cNav];
    
    // Asignamos delegados
    splitVC.delegate = charVC;
    uVC.delegate = charVC;
    
    
    // Lo hago root
    self.window.rootViewController = splitVC;

}

-(void) configureForPhoneWithModel:(AGTStarWarsUniverse*)universe{
    
    // Creamos el controlador
    AGTUniverseTableViewController *uVC = [[AGTUniverseTableViewController alloc]
                                           initWithModel:universe
                                           style:UITableViewStylePlain];
    // Creamos el combinador
    UINavigationController *navVC = [UINavigationController new];
    [navVC pushViewController:uVC
                     animated:NO];
    
    // Asignamos delegados
    uVC.delegate = uVC;
    
    // Lo hacemos root
    self.window.rootViewController = navVC;
}


-(AGTStarWarsCharacter*)lastSelectedCharacterInModel:(AGTStarWarsUniverse*)u{
    
    // Obtengo el NSUserDefaults
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    // Saco las coordenadas del último personaje
    NSArray *coords = [def objectForKey:LAST_SELECTED_CHARACTER];
    NSUInteger section = [[coords objectAtIndex:0] integerValue];
    NSUInteger pos = [[coords objectAtIndex:1] integerValue];
    
    // Obtengo el personaje
    AGTStarWarsCharacter *character;
    if (section == IMPERIAL_SECTION) {
        character = [u imperialAtIndex:pos];
    }else{
        character = [u rebelAtIndex:pos];
    }
    
    // Lo devuelvo
    return character;
}







@end
