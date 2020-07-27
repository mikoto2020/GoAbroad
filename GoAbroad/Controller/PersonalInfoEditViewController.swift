//
//  PersonalInfoEditViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/27.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

class PersonalInfoEditViewController: UIViewController, UITextFieldDelegate {
    //UI
    @IBOutlet weak var nameInputTxtField: UITextField!
    @IBOutlet weak var showEmailLabel: UILabel!
    @IBOutlet weak var phoneNumInputTxtField: UITextField!
    
    //Action

    @IBAction func submitEditBtn(_ sender: UIBarButtonItem) {
        subminBtnAction()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        showEmailLabel.text = userMail
    }
}

extension PersonalInfoEditViewController {
    func setupSubviews() {
        nameInputTxtField.text = ""
        showEmailLabel.text = ""
        phoneNumInputTxtField.text = ""
        nameInputTxtField.delegate = self
        phoneNumInputTxtField.delegate = self
    }
}

//MARK: - Keyboard
extension PersonalInfoEditViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()   //點選鍵盤上的rerurn關閉鍵盤
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)  //點選空白處關閉鍵盤
    }
}

//MARK: - 資料送出時的錯誤判斷
extension PersonalInfoEditViewController {
    func subminBtnAction() {
        userName = nameInputTxtField.text ?? ""
        userTel = phoneNumInputTxtField.text ?? ""
        //print("修改姓名：\(userName), 修改電話：\(userTel)")
        if nameInputTxtField.text == "" || phoneNumInputTxtField.text == "" {
            let alert = UIAlertController(title: "欄位不得為空", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "確定", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "個人資料修改成功", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "確定", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
}
