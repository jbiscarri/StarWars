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

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    // Creamos una vista de tipo UIWindow
    [self setWindow:[[UIWindow alloc]
                     initWithFrame:[[UIScreen mainScreen] bounds]]];
    
    [[self window] setBackgroundColor:[UIColor orangeColor]];
    self.window.backgroundColor = [UIColor orangeColor];
    
    
    // Creamos un modelo
    AGTStarWarsUniverse *universe = [AGTStarWarsUniverse new];
    
    // Creamos los controladores
    AGTUniverseTableViewController *uVC = [[AGTUniverseTableViewController alloc] initWithModel:universe style:UITableViewStylePlain];
    
    AGTCharacterViewController *charVC = [[AGTCharacterViewController alloc] initWithModel:[universe imperialAtIndex:0]];
    
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
    
    // Lo hago root
    self.window.rootViewController = splitVC;
    
    
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












@end
