//
//  IBTSecondViewController.m
//  IBThingy
//
//  Created by nagrajn on 3/29/14.
//  Copyright (c) 2014 nagrajn. All rights reserved.
//

#import "IBTSecondViewController.h"

@interface IBTSecondViewController ()

@end

@implementation IBTSecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.locationManager = [[CLLocationManager alloc] init];
    
    self.locationManager.delegate = self;
    
    [_trackSwitch addTarget:self action:@selector(setTrackSwitchState:) forControlEvents:UIControlEventValueChanged];
    
    
}


- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
    
    self.labelFound.text = @"MONITORING";
    
    
}

-(void) setTrackSwitchState:(id)sender
{
    if ([sender isOn]){
        
        NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"CE9E0949-F4E4-426B-BD50-1A877AA4551B"];
        
        self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:1 minor:1 identifier:@"Living Room"];
        
        [self.locationManager startMonitoringForRegion:self.beaconRegion];
        
        
        self.beaconRegion.notifyEntryStateOnDisplay = YES;
        

        [self locationManager:self.locationManager didStartMonitoringForRegion:self.beaconRegion];
        
        [self.locationManager requestStateForRegion:self.beaconRegion];
         
         
        
    }else {
       
        
    }
}

-(void) locationManager:(CLLocationManager *)manager monitoringDidFailForRegion:(CLRegion *)region withError:(NSError *)error

{
    NSLog(@"didFailWithError: %@", error);
}

-(void) locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region
{
    
}


-(void) locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
    
    self.labelFound.text = @"FOUND";

}


-(void) locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {

    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];

    self.labelFound.text = @"NOT FOUND";

    
}


-(void) locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    
     self.labelFound.text = @"FOUND";
    
    self.labelUUIS.text = region.proximityUUID.UUIDString;
    
    CLBeacon *beacon = [[CLBeacon alloc] init];
    
    beacon = [beacons lastObject];
    
    if (beacon.proximity == CLProximityUnknown) {
        self.labelDistance.text = @"Unknown Proximity";
    } else if (beacon.proximity == CLProximityImmediate) {
        self.labelDistance.text = @"Immediate";
    } else if (beacon.proximity == CLProximityNear) {
        self.labelDistance.text = @"Near";
    } else if (beacon.proximity == CLProximityFar) {
        self.labelDistance.text = @"Far";
    }
    
    self.labelRssi.text = [NSString stringWithFormat:@"%li", (long)beacon.rssi];
    
    self.labelAccuracy.text = [NSString stringWithFormat:@"%f", beacon.accuracy];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
