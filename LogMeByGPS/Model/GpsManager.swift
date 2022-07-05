//
//  GpsManager.swift
//  LogMeByGPS
//
//  Created by Marco Spicciani on 05/07/22.
//

import Foundation
import CoreLocation

class GpsManager : NSObject, ObservableObject, CLLocationManagerDelegate{
    // Create a CLLocationManager and assign a delegate
    let locationManager = CLLocationManager()
    @Published var location : CLLocation?
    
    override init() {
        
    }
    
    func requestAuthorization(){
        locationManager.delegate = self

        // Use requestAlwaysAuthorization if you need location
        // updates even when your app is running in the background
        locationManager.requestAlwaysAuthorization()
    }
    
    func retriveCurrentUserPosition(){
        // Create a CLLocationManager and assign a delegate
        let locationManager = CLLocationManager()
        locationManager.delegate = self

        // Request a user’s location once
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
                //let latitude = location.coordinate.latitude
                //let longitude = location.coordinate.longitude
                
            self.location = location
            
            }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func checkPermissionStatus() -> Bool{
        // Get the current location permissions
        let manager = CLLocationManager()
        return manager.authorizationStatus == .authorizedAlways || manager.authorizationStatus == .authorizedWhenInUse
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didChangeAuthorization status: CLAuthorizationStatus
    ) {
        // Handle changes if location permissions
    }

    
}
