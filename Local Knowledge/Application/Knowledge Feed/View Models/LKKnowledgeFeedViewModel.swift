//
//  LKKnowledgeFeedViewModel.swift
//  Local Knowledge
//
//  Created by Dylan on 22/10/2021.
//

import Foundation
import MapKit
import CoreLocation

class LKKnowledgeFeedViewModel {
  
  var usersLocationCoordinates: CLLocation
  let locationService = LKLocationService.shared
  
  init() {
    usersLocationCoordinates = CLLocation()
  }
  
  func requestLocationServicesPermission() {
    let hasUserEnabledLocationServices = locationService.hasUserAllowedLocationAccess()
    if !hasUserEnabledLocationServices {
      locationService.requestWhenInUseLocationAccess()
    }
  }
  
  func hasUserAllowedWhenInUseLocationServices() -> Bool {
    return locationService.hasUserAllowedLocationAccess()
  }
  
}
