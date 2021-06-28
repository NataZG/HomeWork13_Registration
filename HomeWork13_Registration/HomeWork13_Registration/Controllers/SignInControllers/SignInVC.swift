//
//  SignInVC.swift
//  HomeWork13_Registration
//
//  Created by Nata on 25.06.2021.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSignInButton()

        // Do any additional setup after loading the view.
    }

    
    private func setUpSignInButton() {
        self.signInButton.layer.cornerRadius = self.signInButton.bounds.height / 2
    }

    @IBAction func emailTFChanged(_ sender: UITextField) {
    }

    @IBAction func passwordTFChanged(_ sender: UITextField) {
    }
}
