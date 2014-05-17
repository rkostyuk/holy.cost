//
//  Purchase.m
//  holy-cost
//
//  Created by Roman Kostyuk on 5/6/14.
//  Copyright (c) 2014 Roman Kostyuk. All rights reserved.
//

#import "Purchase.h"


@implementation Purchase

@dynamic price;
@dynamic longitude;
@dynamic latitude;
@dynamic created_at;

+ (void)createPurchaseToProduct:(NSNumber *)price withProduct:(Product *)product inContext:(NSManagedObjectContext *)context;
{
    Purchase *purchase = [NSEntityDescription insertNewObjectForEntityForName:@"Purchase" inManagedObjectContext:context];
    [purchase setValue:price forKey:@"price"];
    [purchase setValue:[NSDate date] forKey:@"created_at"];
    [purchase setValue:product forKey:@"product"];
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
}

@end
