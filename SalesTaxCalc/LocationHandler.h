//
//  LocationHandler.h
//  FindMyVehicle1.0
//
//  Created by Mark Shepherd on 4/27/15.
//  Copyright (c) 2015 Mark Shepherd. All rights reserved.
//



#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>






@interface LocationHandler : CLLocationManager<CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet CLLocationManager *locationManager;
@property (strong, nonatomic) IBOutlet CLGeocoder *geocoder;
@property (strong, nonatomic) IBOutlet CLPlacemark *placemark;
@property (strong, nonatomic) IBOutlet CLLocation *currentLocation;
@property (strong, nonatomic) IBOutlet NSString *zipCode;


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error;
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation;
@end

