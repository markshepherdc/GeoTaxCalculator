//
//  LocationHandler.m
//  FindMyVehicle1.0
//
//  Created by Mark Shepherd on 4/27/15.
//  Copyright (c) 2015 Mark Shepherd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocationHandler.h"

@implementation LocationHandler{
    
}

-(id)init{
    
    self =[super init];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.geocoder = [[CLGeocoder alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
    
    
    return self;
    
}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    self.currentLocation = newLocation;
    
    if (self.currentLocation != nil) {
        
        [self.geocoder reverseGeocodeLocation:self.currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
            if (error == nil && [placemarks count] > 0) {
                self.placemark = [placemarks lastObject];
                
                self.zipCode  = [NSString stringWithFormat:@"%@", self.placemark.postalCode];
                
            } else {
                NSLog(@"%@", error.debugDescription);
            }
        } ];
    }
    [self.locationManager stopUpdatingLocation];
    
    
    // Reverse Geocoding to get zip code
    NSLog(@"Resolving the Address");

    
}





@end