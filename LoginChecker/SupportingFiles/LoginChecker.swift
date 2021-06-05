//
//  LoginChecker.swift
//  LoginChecker
//
//  Created by Sergey Golovin on 05.06.2021.
//

import UIKit

class LoginChecker {
    
    var delegate: LoginCheckerDelegate?
    
    private var regex = "^[-a-zA-Z0-9@[.]]{3,32}$" 
    
    func check(login: String) {
        guard containsLettersOrNumbersOrMinusOrDot(string: login) else {
            showAlert(with: "Login can contain from 3 to 32 Latinic letters, numbers, minus or dot")
            return
        }
        
        guard isCorrectBeginning(of: login) else { return }
        
        showAlert(with: "Loggin is correct😃")
    }
    
    private func containsLettersOrNumbersOrMinusOrDot(string: String) -> Bool {
        if string.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil {
            return true
        }
        return false
    }
    
    private func isCorrectBeginning(of string: String) -> Bool {
        let string = string.trimmingCharacters(in: .whitespacesAndNewlines)
        let chr = String(string.first ?? " ")
        let message = "Login should start with letter"
        
        if (chr >= "0" && chr <= "9") {
            showAlert(with: message)
            return false
        }
        
        if (chr == "." || chr == "-") {
            showAlert(with: message)
            return false
        }
        
        return true
    }
    
    private func showAlert(with messsage: String) {
        delegate?.showAlert(with: messsage)
    }
}
