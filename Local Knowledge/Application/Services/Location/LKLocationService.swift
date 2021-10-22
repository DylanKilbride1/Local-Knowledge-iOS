//
//  LKLocationService.swift
//  Local Knowledge
//
//  Created by Dylan on 21/10/2021.
//

import Foundation
import CoreLocation
import MapKit

protocol LKLocationServiceDelegate {
  func locationAuthorizationStatusChanged(authorisationStatus: CLAuthorizationStatus)
}

class LKLocationService: NSObject {
  
  static let shared = LKLocationService()
  
  private let locationManager = CLLocationManager()
  private var locationCoordinates = CLLocation()
  var delegate: LKLocationServiceDelegate?
  
  private override init() {
    super.init()
    locationManager.requestWhenInUseAuthorization()
    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
    }
  }
  
  func requestWhenInUseLocationAccess() {
    locationManager.requestWhenInUseAuthorization()
  }
  
  func hasUserAllowedLocationAccess() -> Bool {
    if CLLocationManager.locationServicesEnabled() {
      if #available(iOS 14.0, *) {
        switch locationManager.authorizationStatus {
          case .notDetermined, .restricted, .denied:
            return false
          case .authorizedAlways, .authorizedWhenInUse:
            return true
          @unknown default:
            return false
            break
        }
      } else {
        switch CLLocationManager.authorizationStatus() {
          case .notDetermined, .restricted, .denied:
            return false
          case .authorizedAlways, .authorizedWhenInUse:
            return true
          @unknown default:
            return false
            break
        }
      }
    } else {
      print("Location services are not enabled")
      return false
    }
  }
  
  func fetchCoordinates() -> CLLocation {
    locationManager.startUpdatingLocation()
    return locationCoordinates
  }
  
//   func fetchCityAndCountry(from location: CLLocation,
//                                   completion: @escaping (_ city: String?,
//                                                          _ country:  String?,
//                                                          _ error: Error?) -> ()) {
//    CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
//      completion(placemarks?.first?.locality,
//                 placemarks?.first?.country,
//                 error)
//    }
//  }
  

}

extension LKLocationService: CLLocationManagerDelegate {
 
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let coordinates: CLLocation = manager.location else { return }
    locationCoordinates = coordinates
    locationManager.stopUpdatingLocation()
    
    
//    fetchCityAndCountry(from: locationCoordinates) { city, country, error in
//      guard let city = city, let country = country, error == nil else { return }
//      self.locationManager.stopUpdatingLocation()
//      print(city + ", " + country)
//    }
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    // Handle failure to get a user’s location
  }
  
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    let authStatus: CLAuthorizationStatus
    authStatus = CLLocationManager.authorizationStatus()
    if let delegate = delegate {
      delegate.locationAuthorizationStatusChanged(authorisationStatus: authStatus)
    }
  }
  

  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    let authStatus: CLAuthorizationStatus
    if #available(iOS 14.0, *) {
      authStatus = locationManager.authorizationStatus
      if let delegate = delegate {
        delegate.locationAuthorizationStatusChanged(authorisationStatus: authStatus)
      }
    }
  }
  
}
