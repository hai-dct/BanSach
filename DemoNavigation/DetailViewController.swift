//
//  DetailViewController.swift
//  DemoNavigation
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 9/19/21.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        title = "Detail"
        navigationItem.setHidesBackButton(true, animated:true)
    }

    
    
    @IBAction func popButtonTouchUpInside() {
        // Login -> Home -> Detail
        // Detail -> Home -> Login
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func popToRootButtonTouchUpInside() {
        // Login -> Home -> Detail
        // Detail -> Login
        navigationController?.popToRootViewController(animated: true)
    }
}
