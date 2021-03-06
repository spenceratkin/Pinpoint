//
//  MapViewController.h
//  Pinpoint
//
//  Created by Spencer Atkin on 8/1/15.
//  Copyright (c) 2015 Pinpoint-DCHacks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic) NSString *recipientId;
@end
