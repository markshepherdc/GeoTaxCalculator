//
//  calcTax.m
//  SalesTaxCalc
//
//  Created by Mark Shepherd on 3/27/14.
//  Copyright (c) 2014 Mark Shepherd. All rights reserved.
//

#import "CalcTax.h"


@implementation CalcTax


//Calculate the tax amount
-(float)calcTaxAmountwithPrice: (float)price
                     tax: (float)tax
{
    
    //Convert Percentage to decimal
    tax=tax*0.01;
    float taxAmount=tax*price;
    
    
        return [self roundToNearestCent:taxAmount] ;
}

//calculate saving amount
-(float)calcTotalSavingswithprice: (float) price
                        discount:(float) discountPercentage

{
    //Convert Percentage to decimal
    discountPercentage=discountPercentage*0.01;
    float savings = price*discountPercentage;
    return [self roundToNearestCent:savings];
}


//Calculate final price incorporating taxes and discounts
-(float)calcFinalPricewithprice: (float) price
                    tax  : (float) tax
                    discount  : (float) discount
{
    
    if(discount>0.00){
        price=price-[self calcTotalSavingswithprice:price discount:discount];
    }
    
    
    if(tax<=0.00)
    {
        return [self roundToNearestCent:price];
    }else {
        
     return [self roundToNearestCent:price+
                  [self calcTaxAmountwithPrice:price tax:tax]];
        
    }
    
    
}

//Round floats to 2 decimal places
- (float)roundToNearestCent:(float)money{
  money=roundf(money*100.0)/100.0;
    return money;

}








@end
