//
//  VerificationFlow.swift
//  HomeWork13_Registration
//
//  Created by Nata on 26.06.2021.
//

import Foundation

enum PasswordStrengthLevel: Int {
    case unreliable
    case weak
    case medium
    case strong
    case unbreakeable
}
class VerificationFlow {

    static var weakRegex = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
    static var mediumRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$"
    static var strongRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
    static var unbreakableRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"

    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    /*: static func isValidName(name: String) -> Bool {
        let nameRegEx = "^[a-zA-Z](?:[a-zA-Z\\s][^\n]*)[a-zA-Z]$"
        let namePred = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: name)
    } */

    static func isValidPassword(password: String) -> PasswordStrengthLevel {
        if NSPredicate(format: "SELF MATCHES %@", weakRegex).evaluate(with: password) {
            return .weak
        } else if NSPredicate(format: "SELF MATCHES %@", mediumRegex).evaluate(with: password) {
            return .medium
        } else if NSPredicate(format: "SELF MATCHES %@", strongRegex).evaluate(with: password) {
            return .strong
        } else if NSPredicate(format: "SELF MATCHES %@", unbreakableRegex).evaluate(with: password) {
            return .unbreakeable
        } else {
            return .unreliable
        }
    }

    static func isPassConfirm(pass1: String, pass2: String) -> Bool {
        return pass1 == pass2
    }


}
