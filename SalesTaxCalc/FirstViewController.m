//
//  FirstViewController.m
//  SalesTaxCalc
//
//  Created by Mark Shepherd on 3/27/14.
//  Copyright (c) 2014 Mark Shepherd. All rights reserved.
//

#import "FirstViewController.h"
#import "CalcTax.h"
#import "GetTaxRates.h"
#import "LocationHandler.h"


@interface FirstViewController ()

@end

@implementation FirstViewController{
    
    CalcTax *taxControl;
    GetTaxRates *pullTaxRate;
    NSString *taxRate;
    LocationHandler *locHandl;
    NSString *zipCode;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]];
    
   
    
    
    taxControl = [[CalcTax alloc] init];
    pullTaxRate = [[GetTaxRates alloc] init];
    
	// Do any additional setup after loading the view, typically from a nib.

    self.itemTotal.text=@"0.00";
    
    self.taxTotal.text=@"0.00";
    self.taxTotal.text = @"0.00";
    self.savingsTotal.text=@"0.00";
    self.taxAmount.text=@"0.00";
    self.zipCodeLabel.text=@"";

    
 //   self.totalSavings.textColor = [UIColor blueColor];
    self.itemTotal.textColor = [UIColor blueColor];
    self.taxTotal.textColor = [UIColor blueColor];
    self.savingsTotal.textColor = [UIColor blueColor];
    self.taxAmount.textColor = [UIColor blueColor];
    
    
    self.priceInput.keyboardType = UIKeyboardTypeDecimalPad;
    self.priceInput.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    self.discountPercentage.keyboardType = UIKeyboardTypeDecimalPad;
    self.discountPercentage.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //Update location when app starts
    [locHandl startUpdatingLocation];
    
    
     zipCode=locHandl.zipCode;
    if(zipCode!=nil){
        //Get tax rate for zip code received
        [pullTaxRate getTaxRatesbyZipCode:zipCode];
    }
    
    

    [self.priceInput becomeFirstResponder];
    
}
#pragma actions

- (IBAction)calculateTotal:(id)sender {
    

    self.zipCodeLabel.text=zipCode;
    
    
    
    if (pullTaxRate !=nil) {
        self.taxTotal.text= [NSString stringWithFormat:@"%@",pullTaxRate.taxrate];

    }
    
    self.savingsTotal.text = [NSString stringWithFormat:@"$%.02f",
                               [taxControl calcTotalSavingswithprice:[self.priceInput.text floatValue] discount:[self.discountPercentage.text floatValue]]];
    
    self.taxAmount.text = [NSString stringWithFormat:@"$%.02f",
                            [taxControl calcTaxAmountwithPrice:[self.priceInput.text floatValue] tax:[self.taxTotal.text floatValue]]];
    
    self.itemTotal.text = [NSString stringWithFormat:@"$%.02f",
                           [taxControl calcFinalPricewithprice:[self.priceInput.text floatValue]
                                                           tax:[self.taxTotal.text floatValue]
                                                      discount:[self.discountPercentage.text floatValue]]];
    
 

}

- (IBAction)updateZipCode:(id)sender {
    
    [self updateZipCodeData];
}


- (void)updateZipCodeData {
    
    [locHandl startUpdatingLocation];
    
    
    zipCode=locHandl.zipCode;
    
    //Check if there is a zip code to check for taxrate with
    if(zipCode!=nil){
        //Get tax rate for zip code received
        [pullTaxRate getTaxRatesbyZipCode:zipCode];
        //Check if a tax rate is returneed
        if(pullTaxRate.taxrate!=nil){
            self.taxTotal.text=pullTaxRate.taxrate;
        }
        
    }
    
    //If it doesnt workout, enter zipcode manually
    if(zipCode==nil || pullTaxRate.taxrate==nil){
        
        
        
        
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Get Location"
                                  message:@"Please enter your ZipCode:"
                                  delegate:self
                                  cancelButtonTitle: nil
                                  otherButtonTitles: @"Continue", nil];
        [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
        // Display a numerical keypad for this text field
        UITextField *zipCodetextField = [alertView textFieldAtIndex:0];
        zipCodetextField.keyboardType = UIKeyboardTypeNumberPad;
        zipCode=zipCodetextField.text;

        [alertView show];
        

    }
    
    
}

- (IBAction)clearFields:(id)sender{
    self.priceInput.text=@"";
    self.discountPercentage.text=@"";
    // self.taxInput.text=@"";
    self.itemTotal.text=@"0.00";
    self.taxTotal.text=@"0.00";
    self.taxAmount.text=@"0.00";
    self.savingsTotal.text=@"0.00";
   

}

#pragma UIAlertView Delegates
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        
        if (pullTaxRate.taxrate==nil) {
            alertView.message= (@"invalid zipcode, please enter again");
            
        }
        
        
    }
    
}


- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    UITextField *textField = [alertView textFieldAtIndex:0];
    if ([textField.text length] != 5){
        return NO;
    }
    zipCode=textField.text;
    [pullTaxRate getTaxRatesbyZipCode:zipCode];
    return YES;
}



#pragma delegate Methods
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(zipCode==nil){
        
        
        [self performSelectorOnMainThread:@selector(updateZipCodeData) withObject:nil waitUntilDone:YES];
        //   [self updateZipCodeData];
    }
    return YES;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
 //   [self.priceInput resignFirstResponder];
//   [self.discountPercentage resignFirstResponder];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
