//
//  LKHomeViewController.swift

//  Local Knowledge
//
//  Created by Dylan on 09/08/2021.
//

import UIKit

class LKHomeViewController: LKBaseViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewTheme()
  }
  
  private func setupViewTheme() {
    self.view.backgroundColor = LKConstants.appPrimaryColor
  }
}
