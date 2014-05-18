//
//  ProductViewController.m
//  holy-cost
//
//  Created by Roman Kostyuk on 5/17/14.
//  Copyright (c) 2014 Roman Kostyuk. All rights reserved.
//

#import "ProductViewController.h"
#import "Product.h"
#import "Purchase.h"

@interface ProductViewController ()

@property (nonatomic, retain) IBOutlet UITextField *productPriceInput;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *addProductPrice;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *cancelButton;

@end

@implementation ProductViewController

@synthesize product;
@synthesize managedObjectContext;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.product.name;
    self.productPriceInput.delegate = self;
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)addPriceToPRoduct:(id)sender
{
    [Purchase createPurchaseToProduct:[self numberFormatter:self.productPriceInput.text] withProduct:self.product inContext:self.managedObjectContext];
    [self.productPriceInput resignFirstResponder];
    self.navigationItem.rightBarButtonItem = nil;
    self.productPriceInput.text = @"";
    self.title = @"Created";
}

- (IBAction)cancel:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - TextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (string.length > 0){
        self.navigationItem.rightBarButtonItem = self.addProductPrice;
    }else{
        self.navigationItem.rightBarButtonItem = nil;
    }
    
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
    [self.productPriceInput resignFirstResponder];
    
    if (self.productPriceInput.text.length > 0){
        self.navigationItem.rightBarButtonItem = self.addProductPrice;
    }else{
        self.navigationItem.rightBarButtonItem = nil;
    }
}


@end
