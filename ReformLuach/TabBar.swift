//
//  UITabBar.swift
//  ReformLuach
//
//  Created by u-sss18 on 8/22/17.
//  Copyright © 2017 u-sss18. All rights reserved.
//

import Foundation
import UIKit

//struct ScreenSize
//{
    let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
//}

//struct DeviceType
//{
    let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    let IS_IPHONE_6_7          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    let IS_IPHONE_6P_7P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
      let IS_IPHONE_X         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 812.0
    let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
//
//    class TabBar: UITabBarController {
//
//        override func viewDidLoad()
//        {
//            let tabFrame = self.tabBar.frame
//            self.tabBar.frame = tabFrame
//
//            let appearance = UITabBarItem.appearance()
////            let attributes = [NSFontAttributeName:UIFont(name: "Roboto-Medium", size: IS_IPAD ? 15 : 11)]
//            let attributes = [NSFontAttributeName:UIFont(name: "Roboto-Regular", size: IS_IPAD ? 14 : 11)]
//
//            appearance.setTitleTextAttributes(attributes, for: .normal)
//        }
//
//    override func viewWillLayoutSubviews()
//    {
//        //Makes the selected tabBarItem gray
//        tabBar.tintColor = UIColor(red: 0/255, green: 184/255, blue: 211/255, alpha: 1)
//        //Renders the Unselected title purple as of the icon
////        UITabBarItem.appearance().setTitleTextAttributes([
////            NSForegroundColorAttributeName: UIColor(red: 0/255, green: 184/255, blue: 211/255, alpha: 1),
////            NSFontAttributeName: UIFont(name: "Roboto-Medium", size: 15)
////            ], for:.normal)
////        UITabBar.appearance().barTintColor = UIColor.black
//
//
//        //Renders the selected title same as tint Color
//
//        let value = UIInterfaceOrientation.portrait.rawValue
//        UIDevice.current.setValue(value, forKey: "orientation")
//
//        var tabFrame = self.tabBar.frame
//        // - 40 is editable , the default value is 49 px, below lowers the tabbar and above increases the tab bar size
//
//        if IS_IPAD || IS_IPAD_PRO
//        {
//            tabFrame.size.height = 70
//            tabFrame.origin.y = self.view.frame.size.height-70
//        }
//        if IS_IPHONE_X
//        {
//            tabFrame.size.height = 90
//            tabFrame.origin.y = self.view.frame.size.height-90
//
//        }
//        else
//        {
//            tabFrame.size.height = 55
//            tabFrame.origin.y = self.view.frame.size.height-55
//        }
//
////        tabFrame.size.height = 55
////        tabFrame.origin.y = self.view.frame.size.height-55
//        self.tabBar.frame = tabFrame
//
//        let appearance = UITabBarItem.appearance()
//        let attributes = [NSFontAttributeName:UIFont(name: "Roboto-Regular", size: IS_IPAD ? 14 : 11)]
//        appearance.setTitleTextAttributes(attributes, for: .normal)
//
//    }
//
//
//
//}

class ScrollingTabBarControllerDelegate: NSObject, UITabBarControllerDelegate
{
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ScrollingTransitionAnimator(tabBarController: tabBarController, lastIndex: tabBarController.selectedIndex)
    }
}

class ScrollingTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    weak var transitionContext: UIViewControllerContextTransitioning?
    var tabBarController: UITabBarController!
    var lastIndex = 0
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    init(tabBarController: UITabBarController, lastIndex: Int) {
        self.tabBarController = tabBarController
        self.lastIndex = lastIndex
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        
        let containerView = transitionContext.containerView
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        
        containerView.addSubview(toViewController!.view)
        
        var viewWidth = toViewController!.view.bounds.width
        
        if tabBarController.selectedIndex < lastIndex {
            viewWidth = -viewWidth
        }
        
        toViewController!.view.transform = CGAffineTransform(translationX: viewWidth, y: 0)
        
        UIView.animate(withDuration: self.transitionDuration(using: (self.transitionContext)), delay: 0.0, usingSpringWithDamping: 1.2, initialSpringVelocity: 2.5, options: .overrideInheritedOptions, animations: {
            toViewController!.view.transform = CGAffineTransform.identity
            fromViewController!.view.transform = CGAffineTransform(translationX: -viewWidth, y: 0)
        }, completion: { _ in
            self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled)
            fromViewController!.view.transform = CGAffineTransform.identity
        })
    }
}

