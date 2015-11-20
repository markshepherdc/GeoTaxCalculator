

//
//  GetTaxRates.m
//  SalesTaxCalc
//
//  Created by Mark Shepherd on 10/29/15.
//  Copyright © 2015 Mark Shepherd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "GetTaxRates.h"




@implementation GetTaxRates
@synthesize taxrate;

-(void)getTaxRatesbyZipCode :(NSString *) zipCode{
    
 //  __block NSString* taxrate= @"88";
    NSString *URLString = [NSString stringWithFormat:@"https://taxrates.api.avalara.com/postal?country=usa&postal=%@&apikey=iqtTThfaMbPkT22BXZleqDWxqlca%%2BZpIjVvc0CQqaPBz%%2FW0YU%%2FXs348einJgFrJY7ogzQk6xTzfLvhCxEOBl2w%%3D%%3D",zipCode];

    
    NSURL *url = [NSURL URLWithString:URLString];
    [AppDelegate downloadDataFromURL:url withCompletionHandler:^(NSData *data) {
        // Check if any data returned.
        if (data != nil) {
            // Convert the returned data into a dictionary.
            NSError *error;
            NSMutableDictionary *returnedDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            
            if (error != nil) {
                NSLog(@"%@", [error localizedDescription]);
            }
            else{
                
          //      return [returnedDict objectForKey:@"totalRate"];
            //    NSLog(@"%@",[returnedDict objectForKey:@"totalRate"]);
                
     
                 dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                 taxrate=[returnedDict objectForKey:@"totalRate"];

                });

            
                
                
            }
        }
    }];
  
}




@end