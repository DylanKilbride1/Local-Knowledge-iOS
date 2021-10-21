//
//  LKLocationService.swift
//  Local Knowledge
//
//  Created by Dylan on 21/10/2021.
//

import Foundation
import CoreLocation
import MapKit

class LKLocationService: NSObject {
  
  static let shared = LKLocationService()
  
  private let locationManager = CLLocationManager()
  
  private override init() {
    super.init()
    locationManager.requestWhenInUseAuthorization()
    if CLLocationManager.locationServicesEnabled() {
      locationManager.delegate = self
      locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
      locationManager.startUpdatingLocation()
    }
  }
  
  private func fetchCityAndCountry(from location: CLLocation,
                                   completion: @escaping (_ city: String?,
                                                          _ country:  String?,
                                                          _ error: Error?) -> ()) {
    CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
      completion(placemarks?.first?.locality,
                 placemarks?.first?.country,
                 error)
    }
  }

}

extension LKLocationService: CLLocationManagerDelegate {
 
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let locationCoordinates: CLLocation = manager.location else { return }
    
    fetchCityAndCountry(from: locationCoordinates) { city, country, error in
      guard let city = city, let country = country, error == nil else { return } //Maybe handle user alert here if location cannot be found
      self.locationManager.stopUpdatingLocation()
      print(city + ", " + country)
    }
  }
  
}
