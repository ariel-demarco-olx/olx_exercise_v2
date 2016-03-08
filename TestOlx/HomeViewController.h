//
//  HomeViewController.h
//  TestOlx
//
//  Created by OLX - Ariel Demarco on 3/7/16.
//  Copyright © 2016 OLX - Ariel Demarco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *product;
- (IBAction)searchTapped:(id)sender;

@end
