//
//  Product.h
//  holy-cost
//
//  Created by Roman Kostyuk on 5/6/14.
//  Copyright (c) 2014 Roman Kostyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * name;

@end

@interface Product (CoreDataGeneratedAccessors)

+ (void)createProductWithName:(NSString *)productName inContext:(NSManagedObjectContext *)context;

@end
