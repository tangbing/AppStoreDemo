//
//  TodayAnimationTransition.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/9/23.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

fileprivate let transitionDuration: TimeInterval = 0.7

enum AnimationType {
    case present
    case dismiss
}

class TodayAnimationTransition: NSObject {
    let animationType: AnimationType!
    
    //Property 'self.animationType' not initialized at super.init call
    init(animationType: AnimationType) {
        self.animationType = animationType
        super.init()
    }
    
}

extension TodayAnimationTransition : UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.75
    }
    
    
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if animationType == .present  {
           animationForPresent(using: transitionContext)
        } else {
            animationForDismiss(using: transitionContext)
        }
    }
    
    func animationForPresent(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        guard let fromVC = transitionContext.viewController(forKey: .from) as? UITabBarController else { return }
        guard let tableViewController = fromVC.viewControllers?.first as? TodayTableViewController else { return }
        guard let toVC = transitionContext.viewController(forKey: .to) as? CardDetailViewController else { return }
        guard let selectedCell = tableViewController.selectCell else { return }
        
        let frame = selectedCell.convert(selectedCell.bgBackView.frame, to: fromVC.view)
        toVC.view.frame = frame
        toVC.scrollView.imageView.frame.size.width = GlobalConstants.todayCardSize.width
        toVC.scrollView.imageView.frame.size.height = GlobalConstants.todayCardSize.height
        
        containerView.addSubview(toVC.view)
        
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            
            toVC.view.frame = UIScreen.main.bounds
            toVC.scrollView.imageView.frame.size.width = kScreenW
            toVC.scrollView.imageView.frame.size.height = GlobalConstants.cardDetailTopImageH
            toVC.closeBtn.alpha = 1
            
            fromVC.tabBar.frame.origin.y = kScreenH
            
        }) { completed in
            transitionContext.completeTransition(completed)
        }
    }
    
    
    func animationForDismiss(using transitionContext: UIViewControllerContextTransitioning) {
        
                
        guard let fromVC = transitionContext.viewController(forKey: .from) as? CardDetailViewController else {return}
        guard let toVc = transitionContext.viewController(forKey: .to) as? UITabBarController else {return}
        
        guard let tableviewController = toVc.viewControllers?.first as? TodayTableViewController  else {return}
        guard let selectCell = tableviewController.selectCell else {
            return
        }
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: {
            let frame = selectCell.convert(selectCell.bgBackView.frame, to: toVc.view)
            fromVC.view.frame = frame
            fromVC.view.layer.cornerRadius = GlobalConstants.toDayCardCornerRadius
            fromVC.scrollView.imageView.frame.size.width = GlobalConstants.todayCardSize.width
            fromVC.scrollView.imageView.frame.size.height = GlobalConstants.todayCardSize.height
            fromVC.closeBtn.alpha = 0
            
            toVc.tabBar.frame.origin.y = kScreenH - toVc.tabBar.frame.height
            
            
        }) { completed in
            transitionContext.completeTransition(completed)
            toVc.view.addSubview(toVc.tabBar)
            
        }
        
        
    }
    
    
    
}
