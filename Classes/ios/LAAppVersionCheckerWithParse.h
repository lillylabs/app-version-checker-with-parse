//
//  LAAppVersionCheckerWithParse.h
//  Lilly Apps
//
//  Created by Tom Erik Støwer on 24.07.13.
//  Copyright (c) 2013 Lilly Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parse.h"

@interface LAAppVersionCheckerWithParse : NSObject <UIAlertViewDelegate>

- (id)initWithAppStoreURL:(NSURL *)myAppStoreURL;

@end
