//
//  HomeViewController.m
//  TestOlx
//
//  Created by OLX - Ariel Demarco on 3/7/16.
//  Copyright © 2016 OLX - Ariel Demarco. All rights reserved.
#import "ListingViewController.h"
#import "ProductPrice.h"
#import "Product.h"
#import <RestKit/RestKit.h>
#import "HomeViewController.h"

@interface HomeViewController ()

@property (strong, nonatomic) NSArray *products;

@end

@implementation HomeViewController

- (IBAction)searchTapped:(id)sender{
    //BOOL shouldPerformSegue = [self shouldPerformSegueWithIdentifier:@"searchProductSegue" sender:self];
    //if(shouldPerformSegue == YES){
    if([self validateSearch]){
        [self searchProducts];
    }
    //}
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self configureRestKit];
}

- (void)configureRestKit{
    NSURL *baseUrl = [NSURL URLWithString:@"https://api-v2.olx.com"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseUrl];
    
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    
    RKObjectMapping *productMapping = [RKObjectMapping mappingForClass:[Product class]];
    [productMapping addAttributeMappingsFromDictionary:@{@"thumbnail": @"thumbnail", @"description": @"desc", @"title": @"title", @"fullImage": @"image"}];
   
    RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:productMapping method:RKRequestMethodGET pathPattern:@"/items" keyPath:@"data" statusCodes:[NSIndexSet indexSetWithIndex:200]];
    
    [objectManager addResponseDescriptor:responseDescriptor];
    
    RKObjectMapping *priceMapping = [RKObjectMapping mappingForClass:[ProductPrice class]];
    [priceMapping addAttributeMappingsFromDictionary:@{@"amount": @"amount", @"preCurrency": @"preCurrency"}];
    
    [productMapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"price" toKeyPath:@"price" withMapping:priceMapping]];

}

- (void)searchProducts{
    NSString *location = @"www.olx.com.ar";
    NSString *searchTerm = (NSString *)self.product.text;
    NSDictionary *queryParams = @{ @"location" : location, @"searchTerm" : searchTerm };
    [[RKObjectManager sharedManager] getObjectsAtPath:@"/items" parameters:queryParams success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        
        ListingViewController *detailController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"searchResultScene"];
        detailController.products = mappingResult.array;
        //detailController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        //[self pus:detailController animated:YES completion:nil];
        [self.navigationController pushViewController:detailController animated:YES];
        
        //[self.tableView reloadData];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"HTTP Error - API : %@", error);
    }];
}


- (BOOL)validateSearch{
    if(self.product.text.length < 1){
        
        UIAlertController * alert=  [UIAlertController
                                      alertControllerWithTitle:@"Error"
                                      message:@"Enter the product you want to search"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 [alert dismissViewControllerAnimated:YES completion:nil];
                                 
                             }];
        
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
        return NO;
    }
    return YES;
}






@end
