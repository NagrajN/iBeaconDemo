//
//  IBTFirstViewController.m
//  IBThingy
//
//  Created by nagrajn on 3/29/14.
//  Copyright (c) 2014 nagrajn. All rights reserved.
//

#import "IBTFirstViewController.h"

@interface IBTFirstViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *transmitOnSwitch;

@end

@implementation IBTFirstViewController 

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [_transmitOnSwitch addTarget:self action:@selector(setTransmitSwitchState:) forControlEvents:UIControlEventValueChanged];
    
}

-(void) setTransmitSwitchState:(id)sender
{
    if ([sender isOn]){
        
        NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"CE9E0949-F4E4-426B-BD50-1A877AA4551B"];
        
      self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:1 minor:1 identifier:@"Living Room"];
     
        self.labelIdentifier.text = self.beaconRegion.identifier;
        
        self.labelUUID.text = self.beaconRegion.proximityUUID.UUIDString;
        
        self.labelMajor.text = @"1";
        
        self.labelMinor.text = [NSString stringWithFormat:@"%@", self.beaconRegion.minor];
        
        self.beaconData = [[self beaconRegion] peripheralDataWithMeasuredPower:nil];
        
        self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
        
        
    }else {
        [self.peripheralManager stopAdvertising];
        self.labelMode.text = @"Not Transmitting";
        
    }
}


-(void) peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    if(peripheral.state == CBPeripheralManagerStatePoweredOn) {
        
        [self.peripheralManager startAdvertising:self.beaconData];
        
        self.labelMode.text = @"Transmitting Now";
        
        
    } else if(peripheral.state == CBPeripheralManagerStatePoweredOff) {

        [self.peripheralManager stopAdvertising];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
