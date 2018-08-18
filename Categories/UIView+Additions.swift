//
//  UIView+Additions.swift
//  Finance
//
//  Created by Mahadev Prabhu on 08/07/17.
//  Copyright © 2017 Mahadev Prabhu. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIView {
    
    func takeScreenshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
    
    func showHud() {
        MBProgressHUD.showAdded(to: self, animated: true)
    }
    
    func showHud(_ title:String) {
        let hud = MBProgressHUD.showAdded(to: self, animated: true)
        hud.label.text = title
    }
    
    func hideHud() {
        MBProgressHUD.hide(for: self, animated: true)
    }
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue.init(cgPoint: CGPoint.init(x: self.center.x - 10, y: self.center.y))
        animation.toValue = NSValue.init(cgPoint: CGPoint.init(x: self.center.x + 10, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    func applyCornerRadius() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.layer.frame.height/2
        self.layer.borderColor = UIColor.clear.cgColor
    }
    
    func applyCornerRadiusForButtons() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 4
    }
    
    func applyCornerRadiusForProfileImage() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.layer.frame.height/2
    }
    
    func applyShadowWithCornerRadius() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 6
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.33
        self.layer.shadowOffset = CGSize(width: 1, height: -1)
        self.layer.shadowRadius = 6
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func applyShadowWithCornerRadiusForDealList() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 0, height: 0.33)
        self.layer.shadowRadius = 6
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func makeRounded() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        clipsToBounds = true
    }
    
    func applyShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.10
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    func dropShadow() {
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 274, height: self.frame.height))
        self.layer.cornerRadius = 2
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 30, height: 1);  //Here you control x and y
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2 //Here your control your blur
        self.layer.masksToBounds =  false
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    func applyShadowWithCornerRadiusForClaimDeal() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 6
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func applyShadowWithCornerRadiusForViewReciept() {
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.15
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 6
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
}
