//
//  Purchase.h
//  holy-cost
//
//  Created by Roman Kostyuk on 5/6/14.
//  Copyright (c) 2014 Roman Kostyuk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Product;

@interface Purchase : NSManagedObject

@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSDate   * created_at;
@end

@interface Purchase (CoreDataGeneratedAccessors)

+ (void)createPurchaseToProduct:(NSNumber *)price withProduct:(Product *)product inContext:(NSManagedObjectContext *)context;

@end
