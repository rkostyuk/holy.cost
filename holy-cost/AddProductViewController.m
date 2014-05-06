//
//  AddProductViewController.m
//  holy-cost
//
//  Created by Roman Kostyuk on 5/6/14.
//  Copyright (c) 2014 Roman Kostyuk. All rights reserved.
//

#import "AppDelegate.h"
#import "TabBarController.h"
#import "AddProductViewController.h"
#import "ListViewController.h"
#import "Product.h"
#import "Purchase.h"

@interface AddProductViewController ()

@property (nonatomic, retain) IBOutlet UITextField *productNameInput;
@property (nonatomic, retain) IBOutlet UITextField *productPriceInput;
@property (nonatomic, retain) IBOutlet UIButton    *addProduct;

@end

@implementation AddProductViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


# pragma mark - IBActions

- (IBAction)addProduct:(id)sender
{
    
//    Product *product = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
//    [product setValue:self.productNameInput.text forKey:@"name"];
    
    
    Purchase *purchase = [NSEntityDescription insertNewObjectForEntityForName:@"Purchase" inManagedObjectContext:self.managedObjectContext];
    [purchase setValue:[self numberFormatter:self.productPriceInput.text] forKey:@"price"];
    [purchase setValue:[NSDate date] forKey:@"created_at"];
    
    NSError *error;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    NSLog(@"%@", purchase);

    [self.productNameInput resignFirstResponder];
    [self.productPriceInput resignFirstResponder];

}

#pragma mark - Fetch Objects

//- (Product *)getProduct
//{
//    NSFetchRequest *fetchRequest = [NSFetchRequest new];
//    NSEntityDescription *product = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
//    
//    [fetchRequest setEntity:product];
//    
//    NSError *error = nil;
//    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
//    
//    NSLog(@"%@", fetchedObjects);
//    return [fetchedObjects firstObject];
//}


# pragma mark - UITextField Delegate

//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    
//}
//
//-(BOOL)textFieldShouldReturn:(UITextField*)textField;
//{
//    if (textField == self.productNameInput) {
//        [textField resignFirstResponder];
//    } else if (textField == self.productPriceInput) {
//        [self.productNameInput becomeFirstResponder];
//    }
//    return YES;
//}

- (NSNumber *)numberFormatter:(NSString *)price
{
    NSNumberFormatter *numberFormater = [NSNumberFormatter new];
    [numberFormater setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *number = [numberFormater numberFromString:price];
    return number;
}

@end
