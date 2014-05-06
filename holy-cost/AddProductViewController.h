//
//  AddProductViewController.h
//  holy-cost
//
//  Created by Roman Kostyuk on 5/6/14.
//  Copyright (c) 2014 Roman Kostyuk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddProductViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@end
