//
//  ProductTableViewController.h
//  holy-cost
//
//  Created by Roman Kostyuk on 5/16/14.
//  Copyright (c) 2014 Roman Kostyuk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"



@interface ProductTableViewController : UIViewController <NSFetchedResultsControllerDelegate,
                                        UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
