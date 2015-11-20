//
//  GetTaxRates.h
//  SalesTaxCalc
//
//  Created by Mark Shepherd on 10/29/15.
//  Copyright © 2015 Mark Shepherd. All rights reserved.
//

#ifndef GetTaxRates_h
#define GetTaxRates_h


#endif /* GetTaxRates_h */
@interface GetTaxRates : UIViewController

//Retrieve tax rate by zipcode
-(void)getTaxRatesbyZipCode :(NSString *) zipCode;


@property (strong, nonatomic) __block NSString *taxrate;

@end