//
//  LoginPageViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/29.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginPageViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginIdTxtField: UITextField!
    @IBOutlet weak var loginPassTxtField: UITextField!
    
    @IBAction func toRegisterBtn(_ sender: UIButton) {
        toRegister()
    }
    @IBAction func loginBtn(_ sender: UIButton) {
        login()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        loginPassTxtField.delegate = self
        loginIdTxtField.delegate = self
        
    }
}

extension LoginPageViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()   //點選鍵盤上的rerurn關閉鍵盤
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)  //點選空白處關閉鍵盤
    }
}

extension LoginPageViewController {
    func login() {
        Auth.auth().signIn(withEmail: loginIdTxtField.text!, password: loginPassTxtField.text!) { (user, error) in
            if error != nil {
                let alert = UIAlertController(title: "登入失敗，請重新嘗試", message: error?.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "確定", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: "loginToTopPage", sender: self)
            }
        }
    }
    
    func toRegister() {
        self.performSegue(withIdentifier: "goToRegister", sender: self)
    }
}

