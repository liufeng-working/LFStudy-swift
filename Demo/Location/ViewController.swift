//
//  ViewController.swift
//  Location
//
//  Created by 刘丰 on 2017/10/11.
//  Copyright © 2017年 liufeng. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet fileprivate weak var label: UILabel!

    lazy fileprivate var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        @IBOutlet weak var imageView: UIImageView!
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
//        manager.allowsBackgroundLocationUpdates = true
        return manager
    }()
    
    lazy fileprivate var geoCode: CLGeocoder = {
        let geo = CLGeocoder()
        return geo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let region = CLCircularRegion(center: CLLocationCoordinate2D(latitude: 31.476045, longitude: 120.279609), radius: 100, identifier: "region")
        self.locationManager.startMonitoring(for: region)
    }
    
    @available (iOS 9.3, *)
    func test() {
        print(123)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.locationManager.startUpdatingLocation()
    }
}

//MARK: - 地址编码
extension ViewController {
    fileprivate func geo(location: CLLocation) {
        self.geoCode.reverseGeocodeLocation(location) { (placemarks: [CLPlacemark]?, error: Error?) in
            if let placemark = placemarks?.first {
                let country = placemark.country ?? ""
                let administrativeArea = placemark.administrativeArea ?? ""
                let inlandWater = placemark.inlandWater ?? ""
                let thoroughfare = placemark.thoroughfare ?? ""
                let name = placemark.name ?? ""
                
                
                self.label.text = country + administrativeArea + inlandWater + thoroughfare + name
            }
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let newLocation = locations.last else {
            return
        }
        
        self.geo(location: newLocation)
//        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print(111)
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("进入区域")
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("离开区域")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
