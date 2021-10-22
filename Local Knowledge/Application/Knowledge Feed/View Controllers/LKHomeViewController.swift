//
//  LKHomeViewController.swift

//  Local Knowledge
//
//  Created by Dylan on 09/08/2021.
//

import UIKit
import CoreLocation

class LKHomeViewController: LKBaseViewController {
  
  let locationService = LKLocationService.shared
  let knowledgeFeedViewModel = LKKnowledgeFeedViewModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewTheme()
    setupDelegates()
    requestLocationServicesAccess()
  }
  
  private func setupDelegates() {
    self.locationService.delegate = self
  }
  
  private func requestLocationServicesAccess() {
    if !knowledgeFeedViewModel.hasUserAllowedWhenInUseLocationServices() {
      knowledgeFeedViewModel.requestLocationServicesPermission()
    }
  }
  
  private func setupViewTheme() {
    self.view.backgroundColor = LKConstants.appPrimaryColor
  }
}

extension LKHomeViewController: LKLocationServiceDelegate {
  
  func locationAuthorizationStatusChanged(authorisationStatus: CLAuthorizationStatus) {
    if knowledgeFeedViewModel.hasUserAllowedWhenInUseLocationServices() {
      //Populate feed with location based data
    } else {
      //Ask for manual location input
    }
  }
  
  
}
