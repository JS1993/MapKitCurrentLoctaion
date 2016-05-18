//
//  ViewController.m
//  MapKitCurrentLoctaion
//
//  Created by  江苏 on 16/5/18.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<MKMapViewDelegate,CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

/*位置管理者*/
@property(strong,nonatomic)CLLocationManager* locationM;

@end

@implementation ViewController

#pragma mark--懒加载
/*位置管理者*/
-(CLLocationManager *)locationM
{
    if (_locationM==nil) {
        _locationM=[[CLLocationManager alloc]init];
        _locationM.delegate=self;
        [_locationM requestWhenInUseAuthorization];
    }
    return _locationM;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self locationM];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //显示当前用户的位置
    self.mapView.showsUserLocation=YES;
    
}
#pragma mark--CLLocationDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
}

#pragma mark--MapKitDelegate
-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    
    //设置中心处
    [self.mapView setCenterCoordinate:userLocation.coordinate animated:YES];
    //设置跨度
    MKCoordinateSpan span=MKCoordinateSpanMake(0.05, 0.05);
    //设置区域
    MKCoordinateRegion region=MKCoordinateRegionMake(userLocation.coordinate, span);
    
    [self.mapView setRegion:region animated:YES];
}

@end
