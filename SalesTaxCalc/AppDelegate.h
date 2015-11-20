//
//  AppDelegate.h
//  SalesTaxCalc
//
//  Created by Mark Shepherd on 3/27/14.
//  Copyright (c) 2014 Mark Shepherd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+(void)downloadDataFromURL:(NSURL *)url withCompletionHandler:(void (^)(NSData *))completionHandler;

@end
