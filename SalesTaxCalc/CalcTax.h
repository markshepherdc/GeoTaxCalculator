//
//  calcTax.h
//  SalesTaxCalc
//
//  Created by Mark Shepherd on 3/27/14.
//  Copyright (c) 2014 Mark Shepherd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalcTax : NSObject{
 
}


//Calculation Method
-(float)calcFinalPricewithprice: (float) price
                          tax  : (float) tax
                     discount  : (float) discount;

-(float)calcTotalSavingswithprice: (float) price
                            discount :(float) discountPercentage;


-(float)calcTaxAmountwithPrice: (float)price
                           tax: (float)tax;


@end



