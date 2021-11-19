//
//  LoginViewController.swift
//  DemoNavigation
//
//  Created by Hai Nguyen H.P.[3] VN.Danang on 9/19/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        title = "Login"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(123)
    }

    @IBAction func loginButtonTouchUpInside(_ sender: Any) {
        let text = userNameTextField.text
        let homeVC = HomeViewController()
        homeVC.modalPresentationStyle = .fullScreen

        homeVC.userName = text
//        navigationController?.pushViewController(homeVC, animated: true)
        present(homeVC, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
