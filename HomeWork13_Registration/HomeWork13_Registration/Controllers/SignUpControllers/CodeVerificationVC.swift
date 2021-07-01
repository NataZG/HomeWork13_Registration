//
//  CodeVerificationVC.swift
//  HomeWork13_Registration
//
//  Created by Nata on 29.06.2021.
//

import UIKit

class CodeVerificationVC: UIViewController {

    var email: String?
    var name: String?
    var pass: String?

    var passCodeGenerated: String {
        let pass = Int.random(in: 10000...99999)
        return String(pass)
    }

    var passCode: String?

    @IBOutlet weak var secretCodeLabel: UILabel!
    @IBOutlet weak var codeTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        passCode = passCodeGenerated
        setUpUI()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let email = email,
            let name = name,
            let pass = pass,
            let destVC = segue.destination as? WelcomeVC else { return }

        destVC.email = email
        destVC.name = name
        destVC.pass = pass
    }


    @IBAction func codeTFChanged(_ sender: UITextField) {
        guard let code = passCode,
            let ourCode = sender.text else { return }
        if isCodeValid(code: code, ourCode: ourCode) {
            performSegue(withIdentifier: "showWelcomeVC", sender: nil)
        }
    }

    private func setUpUI() {
        secretCodeLabel.text = """
 " \(passCode ?? "") " from \(email ?? "")
 """
    }
    private func isCodeValid(code: String, ourCode: String) -> Bool {
        return code == ourCode
    }

}
