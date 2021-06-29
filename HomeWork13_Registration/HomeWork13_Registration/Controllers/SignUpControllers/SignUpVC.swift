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
    private var isValidEmail = true
    private var isPassConfirm = true
    private var passStrength: PasswordStrengthLevel = .unreliable

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSignUpButton()
        updateButtonState()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = emailTF.text,
            let name = nameTF.text,
            let pass = passwordTF.text,
            let destVC = segue.destination as? CodeVerificationVC else { return }

        destVC.email = email
        destVC.name = name
        destVC.pass = pass
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


    @IBAction func signUpButtonTouched(_ sender: UIButton) {
        performSegue(withIdentifier: "showCodeVC", sender: nil)
    }

    private func setUpSignUpButton() {
        self.signUpButton.layer.cornerRadius = signUpButton.bounds.height / 2
    }

    private func updateButtonState() {
        signUpButton.isEnabled = isValidEmail &&
            isPassConfirm && (passStrength != .unreliable)
    }
}

