//
//  DetailViewController.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/10/22.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.setNavigationBarHidden(true, animated: true)
           setStatusBarColor(UIColor.white.withAlphaComponent(0))
       }
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           navigationController?.setNavigationBarHidden(false, animated: true)
       }


}
