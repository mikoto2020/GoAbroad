//
//  RegisterPageViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/29.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterPageViewController: UIViewController, UITextFieldDelegate {
    //UI
    @IBOutlet weak var regisMailTxtField: UITextField!
    @IBOutlet weak var regisPassTxtField: UITextField!

    
    @IBAction func checkRegisterBtn(_ sender: UIButton) {
        checkRegister()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        regisPassTxtField.delegate = self
        regisMailTxtField.delegate = self
    }
}

extension RegisterPageViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()   //點選鍵盤上的rerurn關閉鍵盤
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)  //點選空白處關閉鍵盤
    }
}

extension RegisterPageViewController {
    func checkRegister() {
        Auth.auth().createUser(withEmail: regisMailTxtField.text!, password: regisPassTxtField.text!) { (user, error) in
            if error != nil {
                let alert = UIAlertController(title: "欄位不得為空", message: error?.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "確定", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            } else {
                self.performSegue(withIdentifier: "registerToRegisterInfo", sender: self)
                userMail = self.regisMailTxtField.text!
                UserDefaults.standard.set(userMail, forKey: "userMail")
            }
        }
    }
}
