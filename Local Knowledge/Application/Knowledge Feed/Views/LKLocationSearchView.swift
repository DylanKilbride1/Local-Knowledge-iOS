//
//  LKLocationSearchView.swift
//  Local Knowledge
//
//  Created by Dylan on 13/08/2021.
//

import UIKit

class LKLocationSearchView: LKBaseView {
  
  @IBOutlet var contentView: UIView!
   @IBOutlet weak var searchField: UITextField!
   @IBOutlet weak var clearFieldIcon: UIButton!
   @IBOutlet weak var searchIcon: UIImageView!
   @IBOutlet weak var searchInputFieldLeadingEdgeConstraint: NSLayoutConstraint!
   
   let genericSearchFieldHint: String = NSLocalizedString("product.search.field.hint.generic", comment: "")
   
   override func awakeFromNib() {
     configureSearchBar()
     configureDelegates()
   }
   
   @IBAction func clearIconTapped(_ sender: Any) {
     searchField.text = ""
     hideClearFieldIcon()
   }
   
   private func configureSearchBar() {
     searchField.isEnabled = true
     searchField.placeholder = genericSearchFieldHint
     clearFieldIcon.isHidden = true
   }
   
   private func configureDelegates() {
     searchField.delegate = self
   }
   
   private func hideClearFieldIcon() {
     clearFieldIcon.isHidden = true
   }
   
   private func showClearFieldIcon() {
     clearFieldIcon.isHidden = false
   }
   
   func addCategoryToSearchFieldHint(productCategory: String) {
     let searchFieldHint = genericSearchFieldHint + productCategory
     searchField.placeholder = searchFieldHint
   }
   
   private func animateEditingBeginning() {
     searchInputFieldLeadingEdgeConstraint.constant = 10
     UIView.animate(withDuration: 0.5,
                    delay: 0,
                    usingSpringWithDamping: 1,
                    initialSpringVelocity: 1,
                    options: .curveEaseOut,
                    animations: {
       self.searchIcon.alpha = 0
       self.contentView.layoutIfNeeded()
     }, completion: nil)
   }
   
   private func animateEditingFinishing() {
     searchInputFieldLeadingEdgeConstraint.constant = 50
     UIView.animate(withDuration: 0.5,
                    delay: 0,
                    usingSpringWithDamping: 1,
                    initialSpringVelocity: 1,
                    options: .curveEaseOut,
                    animations: {
       self.searchIcon.alpha = 1
       self.contentView.layoutIfNeeded()
     }, completion: nil)
   }
   
 }

 extension LKLocationSearchView: UITextFieldDelegate {
   
   func textFieldDidChangeSelection(_ textField: UITextField) {
     textField.text!.count < 1 ? hideClearFieldIcon() : showClearFieldIcon()
   }
   
   func textFieldDidBeginEditing(_ textField: UITextField) {
     animateEditingBeginning()
   }
   
   func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
     animateEditingFinishing()
     return true
   }
   
  
}
