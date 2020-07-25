//
//  BookTwoViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/25.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

class BookTwoViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate {
    //UI
    @IBOutlet weak var dateTxtField: UITextField!
    @IBOutlet weak var timeTxtField: UITextField!
    @IBOutlet weak var terminalPickerView: UIPickerView!
    
    //Action
    @IBAction func nextBtn(_ sender: UIButton) {
        nextBtnLogic()
    }

    //Data
    let terminal = ["請選擇航廈","第一航廈","第二航廈"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        orderTerminalNum = "請選擇航廈"
    }
}

extension BookTwoViewController {
    func setupSubviews() {
        terminalPickerView.dataSource = self
        terminalPickerView.delegate = self
        dateTxtField.delegate = self
        timeTxtField.delegate = self
    }
}

//MARK: - Picker view Data Source
extension BookTwoViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return terminal.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return terminal[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //let selectTerminal = terminal[row]
        orderTerminalNum = terminal[row]
    }
}

//MARK: - Text view Delegate
extension BookTwoViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()   //點選鍵盤上的rerurn關閉鍵盤
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        timeTxtField.keyboardType = .numbersAndPunctuation
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)  //點選空白處關閉鍵盤
    }
}

//MARK: - Next page Button
extension BookTwoViewController {
    func nextBtnLogic() {
        orderBoardTime = timeTxtField.text ?? ""
        orderBoardDate = dateTxtField.text ?? ""
        print("搭車日期：\(orderBoardDate)，搭車時間：\(orderBoardTime)，抵達航廈：\(orderTerminalNum)")
        if orderBoardTime == "" || orderBoardDate == "" || orderTerminalNum == "請選擇航廈" {
            let alert = UIAlertController(title: "請輸入正確資訊", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "確定", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            self.performSegue(withIdentifier: "BookTwoToBookThree", sender: self)
        }
    }
}
