//
//  Car.h
//  TestOlx
//
//  Created by OLX - Ariel Demarco on 3/7/16.
//  Copyright © 2016 OLX - Ariel Demarco. All rights reserved.
//
#import "ProductPrice.h"
#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSURL *image;
@property (strong, nonatomic) NSURL *thumbnail;
@property (strong, nonatomic) ProductPrice *price;
@end
