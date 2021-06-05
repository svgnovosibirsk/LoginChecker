//
//  ViewController.swift
//  LoginChecker
//
//  Created by Sergey Golovin on 05.06.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    private var login = ""
    
    let loginChecker = LoginChecker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        loginChecker.delegate = self
    }

    @IBAction func submitBtnPressed(_ sender: UIButton) {
        login = textField.text ?? ""
        loginChecker.check(login: login)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ViewController: LoginCheckerDelegate {
    func showAlert(with messsage: String) {
        let ac = UIAlertController(title: nil, message: messsage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(ac, animated: true)
    }
}
