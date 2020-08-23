//
//  RegisterPageTwoViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/30.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

class RegisterPageTwoViewController: UIViewController, UITextFieldDelegate {
    //UI
    @IBOutlet weak var registerNameTxtField: UITextField!
    @IBOutlet weak var registerPhoneTxtField: UITextField!
    
    //Action
    @IBAction func sendRegister(_ sender: UIButton) {
        toTopPage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerPhoneTxtField.delegate = self
        registerNameTxtField.delegate = self
    }
}

//MARK: - Keyboard
extension RegisterPageTwoViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()   //點選鍵盤上的rerurn關閉鍵盤
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)  //點選空白處關閉鍵盤
    }
}

extension RegisterPageTwoViewController {
    func toTopPage() {
        //判斷是否有輸入資料
        if registerNameTxtField.text == "" || registerPhoneTxtField.text == "" {
            let alert = UIAlertController(title: "還有欄位沒填完", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction(title: "確定", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        } else {
            //將用戶輸入資料賦值到全域變數
            userName = self.registerNameTxtField.text!
            userTel = self.registerPhoneTxtField.text!
            //儲存至UserDefault
            UserDefaults.standard.set(userName, forKey: "userName")
            UserDefaults.standard.set(userTel, forKey: "userTel")
            //跳頁
            self.performSegue(withIdentifier: "toTopPage", sender: self)
        }
    }
}
