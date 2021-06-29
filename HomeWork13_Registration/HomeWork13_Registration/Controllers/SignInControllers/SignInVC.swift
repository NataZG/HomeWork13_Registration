//
//  SignInVC.swift
//  HomeWork13_Registration
//
//  Created by Nata on 25.06.2021.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        startKeyboardObserver()
        setUpSignInButton()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func signInButtonTapped() {
        guard let email = emailTF.text,
              let pass = passwordTF.text else {return}
        if checkUser(email: email, pass: pass) {
            print("go to Sign In")
        }
    }
    
    
    private func setUpSignInButton() {
        self.signInButton.layer.cornerRadius = self.signInButton.bounds.height / 2
    }

    private func checkUser(email: String, pass: String) -> Bool {
        let emailSaved = UserDefaults.standard.object(forKey: Constants.email) as! String
        let passSaved = UserDefaults.standard.object(forKey: Constants.pass) as! String
        let userFound = (email == emailSaved) && (pass == passSaved)
        errorLabel.isHidden = userFound
        return userFound
    }
    
    private func startKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(SignInVC.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(SignInVC.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow (notification: Notification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)? .cgRectValue else {return}
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillHide (notification: Notification) {
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
}
}
