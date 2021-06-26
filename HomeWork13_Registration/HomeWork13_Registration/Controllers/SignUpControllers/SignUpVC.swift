//
//  SignUpVC.swift
//  HomeWork13_Registration
//
//  Created by Nata on 26.06.2021.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var invalidEmailLabel: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordLevelLabel: UILabel!
    @IBOutlet var passwordStrength: [UIView]!
    @IBOutlet weak var confirmPassTF: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    private var isValidEmail = false
    private var passStrength: PasswordStrengthLevel = .unreliable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSignUpButton()

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func setUpSignUpButton() {
        self.signUpButton.layer.cornerRadius = signUpButton.bounds.height/2
    }
    
    @IBAction func emailChanged(_ sender: UITextField) {
        guard let email = sender.text else {return}
        invalidEmailLabel.isHidden = VerificationFlow.isValidEmail(email: email)
    }
    
    @IBAction func nameChanged(_ sender: UITextField) {
    }
    
    @IBAction func passwordChanged(_ sender: UITextField) {
        guard let password = sender.text else {return}
        passStrength = VerificationFlow.isValidPassword(password: password)
        passwordLevelLabel.isHidden = !(passStrength == .unreliable)
        passwordLevelLabel.text = "Invalid"
        passwordStrength.enumerated().forEach { (index, view) in
            if (index <= (passStrength.rawValue)) {
                view.alpha = 1
            } else {
                view.alpha = 0.1
            }
        }
    }
    
    @IBAction func passwordConfirmed(_ sender: UITextField) {
    }
    @IBAction func signUpButton(_ sender: UIButton) {
    }
}
