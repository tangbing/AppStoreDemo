//
//  DownloadViewController.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/10/22.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

class DownloadViewController: UIViewController {
   
    

    var model: GameTopicModel?

    private lazy var bottomView: DownloadBottomView = {
        let view = DownloadBottomView.setupDownloadBttomView()
        let height = 260 + tabbarExtraH
        view.frame = CGRect(x: 0, y: kScreenH - height, width: kScreenW, height: height)
        view.delegate = self
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setStatusBarColor(UIColor.white.withAlphaComponent(0))
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setStatusBarColor(.white)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let model = model {
            bottomView.model = model
        }
        view.addSubview(bottomView)

        
    }
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension DownloadViewController: DownloadBottomViewDelegate {
    func downloadBottomViewDidClickCancel(_ bottom: DownloadBottomView) {
        dismiss(animated: true, completion: nil)
    }
}

extension DownloadViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
           return DownloadTransitioning(isPresenting: true, transitionDuration: 0.3)
    }

    
     func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
            return DownloadTransitioning(isPresenting: false, transitionDuration: 0.3)
     }

    
//     func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?
//
//
//     func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning?

    
     func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
         return DownloadPresentationController(presentedViewController: presented, presenting: presenting)
     }
}
