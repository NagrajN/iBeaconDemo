//
//  IBTSecondViewController.h
//  IBThingy
//
//  Created by nagrajn on 3/29/14.
//  Copyright (c) 2014 nagrajn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface IBTSecondViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelUUIS;
@property (weak, nonatomic) IBOutlet UILabel *labelAccuracy;
@property (weak, nonatomic) IBOutlet UILabel *labelDistance;
@property (weak, nonatomic) IBOutlet UILabel *labelFound;

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;

@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UISwitch *trackSwitch;
@property (weak, nonatomic) IBOutlet UILabel *labelRssi;

@end
