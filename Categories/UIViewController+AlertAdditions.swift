//
//  UIViewController+AlertAdditions.swift
//  Finance
//
//  Created by Mahadev Prabhu on 30/07/17.
//  Copyright © 2017 Mahadev Prabhu. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(_ title: String) {
        self.showAlert(title, message: "")
    }
    
    func showAlert(_ title: String, message: String) {
        self.showAlert(title, message: message, onDismiss: nil)
    }
    
    func showAlert(_ title: String, message: String, onDismiss:(()->Void)?) {
        let alert = UIAlertController.init(title:title , message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: { (action) in
            onDismiss?()
        }))
        self.present(alert, animated: true, completion: nil)
    }
}





