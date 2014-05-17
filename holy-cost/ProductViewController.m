//
//  ProductViewController.m
//  holy-cost
//
//  Created by Roman Kostyuk on 5/17/14.
//  Copyright (c) 2014 Roman Kostyuk. All rights reserved.
//

#import "ProductViewController.h"

@interface ProductViewController ()

@end

@implementation ProductViewController

@synthesize product;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", self.product);
//    self.title = self.product.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
