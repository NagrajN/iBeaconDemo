//
//  IBTFirstViewController.h
//  IBThingy
//
//  Created by nagrajn on 3/29/14.
//  Copyright (c) 2014 nagrajn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <CoreLocation/CoreLocation.h>

@interface IBTFirstViewController : UIViewController <CBPeripheralManagerDelegate>

@property (nonatomic, strong) CLBeaconRegion *beaconRegion;
@property (nonatomic, strong) NSDictionary *beaconData;
@property (nonatomic, strong) CBPeripheralManager *peripheralManager;
@property (weak, nonatomic) IBOutlet UILabel *labelUUID;
@property (weak, nonatomic) IBOutlet UILabel *labelMajor;
@property (weak, nonatomic) IBOutlet UILabel *labelMinor;
@property (weak, nonatomic) IBOutlet UILabel *labelIdentifier;
@property (weak, nonatomic) IBOutlet UILabel *labelMode;

@end
