//
//  KeyboardObserver.swift
//  AviasalesTestApp
//
//  Created by Olga Dudina on 20.07.2021.
//

import UIKit

@objc protocol KeyboardObserver {
    @objc func keyboardWillChangeFrameNotification(_ notification: NSNotification)
}

extension KeyboardObserver {
    func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillChangeFrameNotification(_:)),
                                               name: UIWindow.keyboardWillChangeFrameNotification,
                                               object: nil)
    }
    
    func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self,
                                                  name:UIWindow.keyboardWillChangeFrameNotification,
                                                  object: nil)
    }
}

extension UIViewController {
    @objc func keyboardWillChangeFrameNotification(_ notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        let keyboardFrameInView = view.convert(keyboardFrame, from: nil)
        let safeAreaFrame = view.safeAreaLayoutGuide.layoutFrame.insetBy(dx: 0, dy: -additionalSafeAreaInsets.bottom)
        let intersection = safeAreaFrame.intersection(keyboardFrameInView)
        
        UIView.animate(withDuration: 0.5) {
            self.additionalSafeAreaInsets.bottom = intersection.height
            self.view.layoutIfNeeded()
        }
    }
}
