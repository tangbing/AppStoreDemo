
//
//  DownloadTransitioning.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/10/22.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

class DownloadTransitioning: NSObject {

    var isPresenting: Bool
    var transitionDuration: TimeInterval
    let dismissHeight: CGFloat?

    init(isPresenting: Bool, transitionDuration: TimeInterval, dismissHeight: CGFloat? = nil) {
        self.isPresenting = isPresenting
        self.transitionDuration = transitionDuration
        self.dismissHeight = dismissHeight
    }
}

extension DownloadTransitioning: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        transitionDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresenting {
            animationForPresent(using: transitionContext)
        } else {
            animationForDismiss(using: transitionContext)
        }
    }
}

extension DownloadTransitioning {
    private func animationForDismiss(using transitionContext: UIViewControllerContextTransitioning) {
        //guard let presentedVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? DownloadViewController else {return}
        guard let presentView = transitionContext.view(forKey: UITransitionContextViewKey.from) else {return}
        
        let containerView = transitionContext.containerView
        
        UIView.animate(withDuration: transitionDuration, animations: {
            if let height = self.dismissHeight {
                presentView.center.y += height
            } else {
                presentView.center.y += containerView.bounds.size.height
            }
        }) { (completed: Bool) in
            transitionContext.completeTransition(completed)
            
        }
        
    }
    private func animationForPresent(using transitionContext: UIViewControllerContextTransitioning) {
        guard let presentedVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? DownloadViewController else {return}
        
        guard let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to) else {return}
        
        let containerView = transitionContext.containerView
        
        presentedView.frame = transitionContext.finalFrame(for: presentedVC)
        presentedView.center.y += containerView.bounds.size.height
        containerView.addSubview(presentedView)
        
        UIView.animate(withDuration: transitionDuration, animations: {
            presentedView.center.y -= containerView.bounds.size.height

        }) { (completed: Bool) in
            transitionContext.completeTransition(completed)
        }
    }
}
