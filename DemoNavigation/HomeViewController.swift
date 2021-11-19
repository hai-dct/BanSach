//
//  HomeViewController.swift
//  DemoNavigation
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 9/19/21.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var homeLabel: UILabel!
    var userName: String?

    deinit {
        print("Deinit")
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("Init")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View did load")
        // Do any additional setup after loading the view.
//        title = "Home"

        let leftButton = UIButton(type: .custom)
        leftButton.setImage(UIImage(named: "previous"), for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonTouchUpInside), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
        homeLabel?.text = "Wellcome to \(userName)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("View did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("View will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("View did disappear")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("ViewDidLayoutSubviews")
    }
    
    
    
    @objc func leftButtonTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func detailButtonTouchUpInside() {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
