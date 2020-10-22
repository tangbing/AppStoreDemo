//
//  DownloadPresentationController.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/10/22.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

class DownloadPresentationController: UIPresentationController {

    private lazy var dimmingView: UIView = {
       let iv = UIView()
        iv.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7)
        iv.alpha = 0.7
        return iv
    }()
    
    override func presentationTransitionWillBegin() {
        guard
            let containerView = containerView,
            let presentedView = presentedView
        else {
            return
        }
        dimmingView.frame = containerView.bounds
        containerView.addSubview(dimmingView)
        containerView.addSubview(presentedView)
        
        presentingViewController.beginAppearanceTransition(false, animated: false)
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (ctx) in
            self.dimmingView.alpha = 1
        }, completion: { (ctx) in
            
        })
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        presentingViewController.endAppearanceTransition()
    }
    
    override func dismissalTransitionWillBegin() {
        presentingViewController.beginAppearanceTransition(true, animated: true)
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { (ctx) in
            self.dimmingView.alpha = 0.0
        }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        presentingViewController.endAppearanceTransition()
        if completed {
            dimmingView.removeFromSuperview()
        }
    }

}
