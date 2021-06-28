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
    @IBOutlet weak var checkMarkEmail: UIImageView!
    @IBOutlet weak var checkMark: UIImageView!
    @IBOutlet weak var createAccLabel: UILabel!

    // private var isValidName = false
    private var isValidEmail = false
    private var isPassConfirm = false
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
       self.signUpButton.layer.cornerRadius = signUpButton.bounds.height / 2
    }

    @IBAction func emailChanged(_ sender: UITextField) {
        guard let email = sender.text else { return }
        invalidEmailLabel.isHidden = VerificationFlow.isValidEmail(email: email)
        checkMarkEmail.isHidden = !VerificationFlow.isValidEmail(email: email)
        checkMarkEmail.backgroundColor = .none
        checkMarkEmail.tintColor = .green
        
        updateButtonState()
    }

   @IBAction func nameChanged(_ sender: UITextField) {
   }
        /*: guard let name = sender.text else { return }
        checkMarkName.isHidden = !VerificationFlow.isValidName(name: name)
        checkMarkName.backgroundColor = .none
        checkMarkName.tintColor = .green

    }*/

    @IBAction func confirmPassTFChanged(_ sender: UITextField) {
        guard let pass1 = passwordTF.text,
            let pass2 = sender.text else { return }
        checkMark.isHidden = !VerificationFlow.isPassConfirm(pass1: pass1, pass2: pass2)
        checkMark.backgroundColor = .none
        checkMark.tintColor = .green

        updateButtonState()
        
        /*: if passwordTF.text == confirmPassTF.text {
            checkMark.isHidden = false
            checkMark.backgroundColor = .none
            checkMark.tintColor = .green

        } else {
            checkMark.isHidden = true
        }*/

    }

    @IBAction func passwordChanged(_ sender: UITextField) {
        guard let password = sender.text else { return }
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
        
        updateButtonState()
    }

    private func updateButtonState() {
        signUpButton.isEnabled = isValidEmail &&
        isPassConfirm &&
            (passStrength != .unreliable)
    }
}

