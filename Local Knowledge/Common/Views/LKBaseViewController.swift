//
//  LKBaseViewController.swift
//  Local Knowledge
//
//  Created by Dylan on 09/08/2021.
//

import UIKit

class LKBaseViewController: UIViewController {

  var contentScrollView: UIScrollView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTheme()
    configureBackButton()
    configureScrollView()
      // Do any additional setup after loading the view.
    }
    
    private func configureTheme() {
      self.view.backgroundColor = LKConstants.appPrimaryColor
    }
    
    private func configureBackButton() {
      
    }
    
    private func configureScrollView() {
      contentScrollView = UIScrollView()
      let containerView = UIView()
      contentScrollView.delegate = self
      let screenSize = UIScreen.main.bounds
      contentScrollView.contentSize = CGSize(width: screenSize.width, height: screenSize.height)
      contentScrollView.addSubview(containerView)
      view.addSubview(contentScrollView)
    }

}

extension LKBaseViewController: UIScrollViewDelegate {
  
}
