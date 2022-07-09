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
    @Published var iteration : Int = 0
    @Published var running = false
    
    let arrivalPoint = CLLocation(latitude: 43.87129718258763, longitude: 10.689921986450328)
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    func currentDistance() -> CLLocationDistance{
        if let safeLoc = location{
            return safeLoc.distance(from: arrivalPoint)
        }else{
            return CLLocationDistance()
        }
        
    }
    
    func requestAuthorization(){
        // Use requestAlwaysAuthorization if you need location
        // updates even when your app is running in the background
        locationManager.requestAlwaysAuthorization()
        
    }
    
    func retriveCurrentUserPosition(){
        // Request a user’s location once
        //locationManager.requestLocation()
     
        locationManager.startUpdatingLocation()
        
    }
    
    func stopUpdatingLocation(){
        locationManager.stopUpdatingLocation()
        running = false
    }
    
   
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.running = true
        self.iteration += 1 
        
        if let location = locations.last {
            self.location = location
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        stopUpdatingLocation()
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
