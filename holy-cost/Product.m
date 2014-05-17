//
//  Product.m
//  holy-cost
//
//  Created by Roman Kostyuk on 5/6/14.
//  Copyright (c) 2014 Roman Kostyuk. All rights reserved.
//

#import "Product.h"


@implementation Product

@dynamic name;

+ (void)createProductWithName:(NSString *)productName inContext:(NSManagedObjectContext *)context;
{
    Product *product = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:context];
    [product setValue:productName forKey:@"name"];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
}

@end
