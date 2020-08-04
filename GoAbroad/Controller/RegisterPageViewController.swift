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

    //Action
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
                let alert = UIAlertController(title: "註冊失敗", message: error?.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "確定", style: .default, handler: nil)
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
            } else {
                hasLogin = true
                userMail = self.regisMailTxtField.text!
                userPass = self.regisPassTxtField.text!
                UserDefaults.standard.set(userMail, forKey: "userMail")
                UserDefaults.standard.set(userPass, forKey: "userPass")
                //註冊成功後，先在firebase中加入沒有訂單的判斷
                let db = Firestore.firestore()
                db.collection("GoAbroad").document(self.regisMailTxtField.text!).setData(["hasOrder" : false])
                self.performSegue(withIdentifier: "registerToRegisterInfo", sender: self)
            }
        }
    }
}
