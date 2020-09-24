//
//  CardDetailViewController.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/9/18.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

class CardDetailViewController: UIViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    var dimissClosure: (()->())?
    var interactiveStartingPoint: CGPoint?
    
    var draggingDownToDissmiss = false
    
    var cell: TodayTableViewCell
    
    private lazy var dimissPanGesture: UIPanGestureRecognizer = {
        let ges = UIPanGestureRecognizer()
        ges.maximumNumberOfTouches = 1
        ges.addTarget(self, action: #selector(handleDismissPan(gesture:)))
        ges.delegate = self
        return ges;
    }()
    
    lazy var scrollView: DetailScrollView = {
        let frame = self.view.bounds
        let view = DetailScrollView(frame: frame)
        view.delegate = self
        return view
    }()
    
    lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: kScreenW - 20 - 30, y: 20, width: 30, height: 30)
        btn.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        btn.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return btn
    }()
    
    
    init(cell: TodayTableViewCell) {
        self.cell = cell
        super.init(nibName: nil, bundle: nil)
        self.setupTranstion()
    }
    
    private func setupTranstion(){
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func handleDismissPan(gesture: UIPanGestureRecognizer) {
        if !draggingDownToDissmiss {
            return
        }
         let startingPoint: CGPoint
        
        if let p = interactiveStartingPoint {
            startingPoint = p
        } else {
            startingPoint = gesture.location(in: nil)
            interactiveStartingPoint = startingPoint
        }
        
        let currentLocation = gesture.location(in: nil)
        
        var progress = (currentLocation.y - startingPoint.y) / 100
        
        if currentLocation.y <= startingPoint.y {
            progress = 0
        }

        if progress >= 1.0 {
            dismiss(animated: true, completion: nil)
            dimissClosure?()
            stopDismissPanGesture(gesture)
            return
        }
        
        let targetShrinkScale: CGFloat = 0.86
        let currentScale: CGFloat = 1 - (1 - targetShrinkScale) * progress
        
        switch gesture.state {
        case .began, .changed:
            scrollView.isScrollEnabled = false
            gesture.view?.transform = CGAffineTransform(scaleX: currentScale, y: currentScale)
            gesture.view?.layer.cornerRadius = GlobalConstants.toDayCardCornerRadius * (progress)
            scrollView.showsVerticalScrollIndicator = false
            break
        case .cancelled, .ended:
            scrollView.isScrollEnabled = true
            stopDismissPanGesture(gesture)
            break
        default:
            break
        }
    }
    
    //当下拉Offset超过100或取消下拉手势时，执行此方法
    private func stopDismissPanGesture(_ gesture: UIPanGestureRecognizer) {
        draggingDownToDissmiss = false
        interactiveStartingPoint = nil
        scrollView.showsVerticalScrollIndicator = true
        
        UIView.animate(withDuration: 0.2) {
            gesture.view?.transform = CGAffineTransform.identity
        }
    }
    
    @objc private func closeAction() {
        dismiss(animated: true, completion: nil)
        dimissClosure?()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getImageFromCell()

        // Do any additional setup after loading the view.
    }
    private func setupUI() {
        self.view.backgroundColor = .red
        self.view.layer.masksToBounds = true
        view.addSubview(scrollView)
        view.addSubview(closeBtn)
        view.addGestureRecognizer(dimissPanGesture)
        
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    
   private func getImageFromCell() {
        scrollView.imageView.image = cell.bgImageView.image;
    }
    
    
}

// MARK: UIViewControllerTransitioningDelegate
extension CardDetailViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        TodayAnimationTransition(animationType: .present)
    }

    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        TodayAnimationTransition(animationType: .dismiss)
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CardPresentationController(presentedViewController: presented, presenting: presenting)
    }

}

extension CardDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            scrollView.contentOffset = .zero
            draggingDownToDissmiss = true
        }
    }
}



extension CardDetailViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    /*
     //手指触摸屏幕后回调的方法，返回NO则不再进行手势识别，方法触发等
     - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;
     //开始进行手势识别时调用的方法，返回NO则结束，不再触发手势
     - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer;
     //是否支持多时候触发，返回YES，则可以多个手势一起触发方法，返回NO则为互斥
     - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;
     //下面这个两个方法也是用来控制手势的互斥执行的
     //这个方法返回YES，第一个手势和第二个互斥时，第一个会失效
     - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_AVAILABLE_IOS(7_0);
     //这个方法返回YES，第一个和第二个互斥时，第二个会失效
     - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer NS_AVAILABLE_IOS(7_0);

     */
}


