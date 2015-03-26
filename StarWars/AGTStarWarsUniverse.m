//
//  AGTStarWarsUniverse.m
//  StarWars
//
//  Created by Fernando Rodríguez Romero on 26/03/15.
//  Copyright (c) 2015 Agbo. All rights reserved.
//

#import "AGTStarWarsUniverse.h"

@interface AGTStarWarsUniverse ()
@property (nonatomic, strong) NSArray *rebels;
@property (nonatomic, strong) NSArray *imperials;
@end

@implementation AGTStarWarsUniverse

#pragma mark - Properties
-(NSUInteger) rebelCount{
    return [self.rebels count];
}

-(NSUInteger) imperialCount{
    return [self.imperials count];
}


#pragma mark -  Init
-(id) init{
    
    if (self = [super init]) {
        
        // creamos los personajes
        // Vader
        NSURL *vaderURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Darth_Vader"];
        
        NSBundle *b = [NSBundle mainBundle];
        NSData *vaderSound = [NSData dataWithContentsOfURL:[b URLForResource:@"vader" withExtension:@"caf"]];
        UIImage *vaderImage = [UIImage imageNamed:@"darthVader.jpg"];
        
        AGTStarWarsCharacter *vader = [[AGTStarWarsCharacter alloc]
                                       initWithName:@"Anakin Skywalker"
                                       alias:@"Darth Vader"
                                       url:vaderURL
                                       soundData:vaderSound
                                       photo:vaderImage];
        // Tarkin
        NSURL *tarkinURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Grand_Moff_Tarkin"];
        
        NSData *tarkinSound = [NSData dataWithContentsOfURL:[b URLForResource:@"tarkin" withExtension:@"caf"]];
        UIImage *tarkinImage = [UIImage imageNamed:@"tarkin.jpg"];
        
        AGTStarWarsCharacter *tarkin = [[AGTStarWarsCharacter alloc]
                                        initWithName:@"Wilhuf Tarkin"
                                        alias:@"Grand Moff Tarkin"
                                        url:tarkinURL
                                        soundData:tarkinSound
                                        photo:tarkinImage];
        
        // Palpatine
        NSURL *palpatineURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Palpatine"];
        
        NSData *palpatineSound = [NSData dataWithContentsOfURL:[b URLForResource:@"palpatine" withExtension:@"caf"]];
        UIImage *palpatineImage = [UIImage imageNamed:@"palpatine.jpg"];
        
        AGTStarWarsCharacter *palpatine = [[AGTStarWarsCharacter alloc]
                                           initWithName: @"Palpatine"
                                           alias:@"Darth Sidious"
                                           url:palpatineURL
                                           soundData:palpatineSound
                                           photo:palpatineImage];
        
        
        // Chewbacca
        NSURL *chewieURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Chewbacca"];
        
        NSData *chewieSound = [NSData dataWithContentsOfURL:[b URLForResource:@"chewbacca" withExtension:@"caf"]];
        UIImage *chewieImage = [UIImage imageNamed:@"chewbacca.jpg"];
        
        AGTStarWarsCharacter *chewie = [[AGTStarWarsCharacter alloc]
                                        initWithAlias:@"Chewbacca"
                                        url:chewieURL
                                        soundData:chewieSound
                                        photo:chewieImage];
        
        // C-3PO
        NSURL *c3poURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/C-3PO"];
        
        NSData *c3poSound = [NSData dataWithContentsOfURL:[b URLForResource:@"c3po" withExtension:@"caf"]];
        UIImage *c3poImage = [UIImage imageNamed:@"c3po.jpg"];
        
        AGTStarWarsCharacter *c3po = [[AGTStarWarsCharacter alloc]
                                      initWithAlias:@"C-3PO"
                                      url:c3poURL
                                      soundData:c3poSound
                                      photo:c3poImage];
        
        // Yoda
        NSURL *yodaURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Yoda"];
        
        
        NSData *yodaSound = [NSData dataWithContentsOfURL:[b URLForResource:@"yoda" withExtension:@"caf"]];
        UIImage *yodaImage = [UIImage imageNamed:@"yoda.jpg"];
        
        AGTStarWarsCharacter *yoda = [[AGTStarWarsCharacter alloc]
                                      initWithName:@"Minch Yoda"
                                      alias:@"Master Yoda"
                                      url:yodaURL
                                      soundData:yodaSound
                                      photo:yodaImage];
        
        // R2-D2
        NSURL *r2d2URL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/R2-D2"];
        
        NSData *r2d2Sound = [NSData dataWithContentsOfURL:[b URLForResource:@"r2-d2" withExtension:@"caf"]];
        UIImage *r2d2Image = [UIImage imageNamed:@"R2-D2.jpg"];
        
        AGTStarWarsCharacter *r2d2 = [[AGTStarWarsCharacter alloc]
                                      initWithAlias:@"R2-D2"
                                      url:r2d2URL
                                      soundData:r2d2Sound
                                      photo:r2d2Image];
        
        
        self.imperials = @[vader, palpatine, tarkin];
        self.rebels = @[chewie, c3po, r2d2, yoda];
    }
    
    return self;
}

#pragma mark - Accessors
-(AGTStarWarsCharacter *) rebelAtIndex:(NSUInteger) index{
    
    return [self.rebels objectAtIndex:index];
}

-(AGTStarWarsCharacter *) imperialAtIndex:(NSUInteger) index{
    return [self.imperials objectAtIndex:index];
}

@end
