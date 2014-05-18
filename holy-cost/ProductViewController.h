//
//  ProductViewController.h
//  holy-cost
//
//  Created by Roman Kostyuk on 5/17/14.
//  Copyright (c) 2014 Roman Kostyuk. All rights reserved.
//

//#import <UIKit/UIKit.h>

@class Product;

@interface ProductViewController : UIViewController

@property (strong, nonatomic) Product *product;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
