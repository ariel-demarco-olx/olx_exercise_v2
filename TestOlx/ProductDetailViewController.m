//
//  ProductDetailViewController.m
//  TestOlx
//
//  Created by OLX - Ariel Demarco on 3/8/16.
//  Copyright © 2016 OLX - Ariel Demarco. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()

@end

@implementation ProductDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillSubViews];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender{
    [self.delegate productDetailViewControllerDelegateDidCancel:self];
}

- (void)fillSubViews{
    self.imagePortrait.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:_productDetail.thumbnail]];
    self.productTitle.text = [NSString stringWithFormat:@"%@", _productDetail.title];
    self.productDescription.text = [NSString stringWithFormat:@"%@", _productDetail.desc];
    NSMutableString *price = [NSMutableString stringWithFormat:@"%@", _productDetail.price.preCurrency];
    [price appendString:@" "];
    [price appendString: [[NSNumber numberWithFloat:_productDetail.price.amount] stringValue]];
    self.productPrice.text = [NSString stringWithFormat:@"%@", price];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
