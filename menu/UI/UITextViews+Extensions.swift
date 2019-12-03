//
//  UITextViews+Extensions.swift
//  Renturcar
//
//  Created by OSX on 12/07/17.
//  Copyright © 2017 Macrew. All rights reserved.


import UIKit

extension UITextField {
   
//  func addDatePicker(withTitle returnTitle: String = "Done", valueChangeSelector: Selector, doneSelector: Selector?, cancelSelector: Selector?, maximumDate: Date? = nil, minimumDate: Date? = nil)-> UIDatePicker {
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .date
//        datePicker.addTarget(nil, action: valueChangeSelector, for: UIControl.Event.valueChanged)
//        self.addToolbar(withReturnTitle: returnTitle, doneSelector: doneSelector, cancelSelector: cancelSelector)
//        self.inputView = datePicker
//        datePicker.maximumDate = maximumDate
//        datePicker.minimumDate = minimumDate
//        return datePicker
//    }
}

extension UITextView {
	func addToolbar(withReturnTitle returnTitle: String = "Done", doneSelector: Selector?, cancelSelector: Selector?) {
		let flexBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
		let doneBarButton = UIBarButtonItem(title: returnTitle, style: UIBarButtonItem.Style.done, target: nil, action: doneSelector)
		let cancelBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel , target: nil, action: cancelSelector)
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        keyboardToolbar.items = [cancelBarButton,flexBarButton, doneBarButton]
        self.inputAccessoryView = keyboardToolbar
    }
}
