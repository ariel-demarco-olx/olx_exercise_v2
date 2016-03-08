//
//  ProductDetailViewController.h
//  TestOlx
//
//  Created by OLX - Ariel Demarco on 3/8/16.
//  Copyright © 2016 OLX - Ariel Demarco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@class ProductDetailViewController;

@protocol ProductDetailViewControllerDelegate <NSObject>

- (void)productDetailViewControllerDelegateDidCancel:(ProductDetailViewController *)controller;

@end

@interface ProductDetailViewController : UIViewController

@property (nonatomic, strong) Product *productDetail;
@property (nonatomic, strong) IBOutlet UIImageView *imagePortrait;
@property (nonatomic, strong) IBOutlet UILabel *productTitle;
@property (nonatomic, strong) IBOutlet  UITextView *productDescription;
@property (nonatomic, strong) IBOutlet  UILabel *productPrice;
@property (nonatomic,weak) id <ProductDetailViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;
@end
