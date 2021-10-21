//
//  LKBaseNavigationController.swift
//  Local Knowledge
//
//  Created by Dylan on 09/08/2021.
//

import UIKit

class LKBaseNavigationController: UINavigationController {

  override func viewDidLoad() {
      super.viewDidLoad()
      configureLayout()
    }
    
    private func configureLayout() {
      self.view.clipsToBounds = true
    }
    
    //MARK: - Required
    
    override init(rootViewController: UIViewController) {
      super.init(rootViewController: rootViewController)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
      super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

}
