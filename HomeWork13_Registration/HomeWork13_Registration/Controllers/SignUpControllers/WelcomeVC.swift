//
//  WelcomeVC.swift
//  HomeWork13_Registration
//
//  Created by Nata on 29.06.2021.
//

import UIKit

class WelcomeVC: UIViewController {

    var email: String?
    var name: String?
    var pass: String?

    @IBAction func continueButtonTapped() {
        guard let email = email,
            let name = name,
            let pass = pass else { return }
        UserDefaults.standard.set(email, forKey: Constants.email)
        UserDefaults.standard.set(name, forKey: Constants.name)
        UserDefaults.standard.set(pass, forKey: Constants.pass)
        navigationController?.popToRootViewController(animated: true)
    }

    
}
