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
#import "ProductTableViewController.h"
#import "ListViewController.h"
#import "Product.h"
#import "Purchase.h"

@interface AddProductViewController ()

@property (nonatomic, retain) IBOutlet UITextField *productNameInput;
@property (nonatomic, retain) IBOutlet UIBarButtonItem    *addProductButton;
@property (nonatomic, retain) IBOutlet UIBarButtonItem    *cancelButton;

@end

@implementation AddProductViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.productNameInput.delegate = self;
    [self.productNameInput becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addProduct:(id)sender
{
    [Product createProductWithName:self.productNameInput.text inContext:self.managedObjectContext];
//    [Purchase createPurchaseToProduct:[self numberFormatter:self.productPriceInput.text] withProduct:product inContext:self.managedObjectContext];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark Navigation

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"goToProduct"]){
//        ProductTableViewController *destionationViewController = segue.destinationViewController;
//        destionationViewController.product = [self getProduct];
//    }
//}



# pragma mark - UITextField Delegate

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    [self.productNameInput resignFirstResponder];
    return YES;
}

#pragma mark - Emplement

- (NSNumber *)numberFormatter:(NSString *)price
{
    NSNumberFormatter *numberFormater = [NSNumberFormatter new];
    [numberFormater setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *number = [numberFormater numberFromString:price];
    return number;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.productNameInput resignFirstResponder];
}

@end
