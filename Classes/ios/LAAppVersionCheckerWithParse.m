//
//  LAAppVersionCheckerWithParse.m
//  Lilly Apps
//
//  Created by Tom Erik Støwer on 24.07.13.
//  Copyright (c) 2013 Lilly Apps. All rights reserved.
//

#import "LAAppVersionCheckerWithParse.h"
#import "Parse.h"

@interface LAAppVersionCheckerWithParse()

@property (strong, nonatomic) UIAlertView *updateAlertView;
@property (strong, nonatomic) NSURL *appStoreURL;

@end

@implementation LAAppVersionCheckerWithParse

- (id)initWithAppStoreURL:(NSURL *)appStoreURL {
    self = [super init];
    self.appStoreURL = appStoreURL;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    return self;
}

- (void)applicationDidBecomeActive {
    [self checkAppVersion];
}

- (void)checkAppVersion {
    NSString *currentVersion = [LAAppVersionCheckerWithParse appVersion];
    
    NSDictionary *params = [[NSDictionary alloc] initWithObjects:@[currentVersion] forKeys:@[@"currentVersion"]];
    
    [PFCloud callFunctionInBackground:@"check_app_version"
                       withParameters:params block:^(NSDictionary *result, NSError *error) {
                           if([[result objectForKey:@"updateAvailable"] boolValue]) {
                               BOOL required = NO;
                               if([[result objectForKey:@"updateRequired"] boolValue]) {
                                   required = YES;
                               }
                               NSString *availableVersion = [result objectForKey:@"availableVersion"];
                               NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                               if (!required
                                   && [[defaults objectForKey:@"availableAppVersionChecked"] isEqual: availableVersion]) {
                                   // version is not required and user has already been notified about this version
                               } else {
                                   [self showUpdateAlertRequired:required];
                                   [defaults setObject:availableVersion forKey:@"availableAppVersionChecked"];
                               }

                           }
                       }];
    
}

#define fLocalizedStringTableName @"LAAppVersionCheckerWithParse-Localizable"

- (void)showUpdateAlertRequired: (BOOL)required {
    if(!self.updateAlertView) {
        NSString *cancelButtonTitle = nil;
        if (!required)
            cancelButtonTitle = NSLocalizedStringFromTable(@"Cancel", fLocalizedStringTableName, @"Alert cancel button text");
        
        self.updateAlertView = [[UIAlertView alloc]
                                initWithTitle:NSLocalizedStringFromTable(@"Update available", fLocalizedStringTableName, @"Alert header text")
                                message:NSLocalizedStringFromTable(@"There is a newer version of the app available in App Store!", fLocalizedStringTableName, @"Alert message text")
                                delegate:self
                                cancelButtonTitle:cancelButtonTitle
                                otherButtonTitles:NSLocalizedStringFromTable(@"Update now", fLocalizedStringTableName, @"Alert update button text"), nil];
        
        [self.updateAlertView show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    self.updateAlertView = nil;
    if (buttonIndex > 0 || alertView.cancelButtonIndex < 0) {
        [[UIApplication sharedApplication] openURL:self.appStoreURL];
    }
}

+ (NSString *) appVersion
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
}

@end
