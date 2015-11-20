//
//  FirstViewController.h
//  SalesTaxCalc
//
//  Created by Mark Shepherd on 3/27/14.
//  Copyright (c) 2014 Mark Shepherd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *itemTotal;
@property (strong, nonatomic) IBOutlet UILabel *taxTotal;
@property (strong, nonatomic) IBOutlet UILabel *savingsTotal;

@property (strong, nonatomic) IBOutlet UITextField *discountPercentage;
@property (strong, nonatomic) IBOutlet UITextField *priceInput;
@property (strong, nonatomic) IBOutlet UILabel *taxAmount;
@property (strong, nonatomic) IBOutlet UILabel*zipCodeLabel;

- (IBAction)clearFields:(id)sender;
- (IBAction)calculateTotal:(id)sender;
- (IBAction)updateZipCode:(id)sender;


@end
