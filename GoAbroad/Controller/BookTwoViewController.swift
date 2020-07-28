//
//  BookTwoViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/25.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

class BookTwoViewController: UIViewController, UIPickerViewDelegate {
    //UI
    @IBOutlet weak var showSelectedDate: UILabel!
    @IBOutlet weak var showSelectedTime: UILabel!
    @IBOutlet weak var terminalPickerView: UIPickerView!
    var dateAndTimepicker = UIDatePicker()
    
    //Action
    @IBAction func nextBtn(_ sender: UIButton) {
        nextBtnLogic()
    }

    //Data
    let terminal = ["請選擇航廈","第一航廈","第二航廈"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        tapAction()
        initData()
    }
}

extension BookTwoViewController {
    func initData() {
        orderTerminalNum = "請選擇航廈"
        showSelectedDate.text = "點擊選擇日期"
        showSelectedTime.text = "點擊選擇時間"
    }
    func setupSubviews() {
        terminalPickerView.dataSource = self
        terminalPickerView.delegate = self
    }
}

extension BookTwoViewController {
    func tapAction() {
        let TapDate: UITapGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(pressedDateLabel)) // 加入觸發條件
        let TapTime: UITapGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(pressedTimeLabel))
        showSelectedDate.addGestureRecognizer(TapDate) // 加入觸發動作
        showSelectedTime.addGestureRecognizer(TapTime) // 加入觸發動作
    }
    
    @objc func pressedDateLabel(){
        let alert = UIAlertController(title: "\n\n\n\n\n\n", message: "", preferredStyle: .actionSheet)
        //設定日期選擇器
        dateAndTimepicker.frame = CGRect(x: 0, y: 0,width: 414, height: 180)
        dateAndTimepicker.datePickerMode = .date
        dateAndTimepicker.locale = Locale(identifier:"zh_TW")
        //設定最短三天後（72小時後）
        dateAndTimepicker.minimumDate = Date() + 86400 * 3
        //設定60天內
        dateAndTimepicker.maximumDate = Date() + 86400 * 60
        //加入日期選擇器
        alert.view.addSubview(self.dateAndTimepicker)
        //日期格式化
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyy-MM-dd"
        //加入AlertController按鈕
        let ok = UIAlertAction(title: "確定", style: .default){(action)in
            let result = dateformat.string(from: self.dateAndTimepicker.date)
            self.showSelectedDate.text = result //將用戶選擇結果輸入至label
        }
        let cancel = UIAlertAction(title: "取消", style: .destructive) {(action) in
            self.showSelectedDate.text = "點擊選擇日期"
        }
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func pressedTimeLabel(){
        let alert = UIAlertController(title: "\n\n\n\n\n\n", message: "", preferredStyle: .actionSheet)
        //設定時間選擇器
        dateAndTimepicker.frame = CGRect(x: 0, y: 0,width: 414, height: 180)
        dateAndTimepicker.datePickerMode = .time
        dateAndTimepicker.locale = Locale(identifier:"zh_TW")
        //加入時間選擇器
        alert.view.addSubview(self.dateAndTimepicker)
        //日期格式化
        let dateformat = DateFormatter()
        dateformat.dateFormat = "a hh:mm"
        dateformat.amSymbol = "上午"
        dateformat.pmSymbol = "下午"
        //加入AlertController按鈕
        let ok = UIAlertAction(title: "確定", style: .default){(action)in

            let result = dateformat.string(from: self.dateAndTimepicker.date)
            self.showSelectedTime.text = result   //將用戶選擇結果輸入至label
        }
        
        let cancel = UIAlertAction(title: "取消", style: .destructive) {(action) in self.showSelectedTime.text = "點擊選擇時間"}
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }

}

//MARK: - PickerView DataSource
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

//MARK: - Next page Button
extension BookTwoViewController {
    func nextBtnLogic() {
        orderBoardDate = showSelectedDate.text ?? ""
        orderBoardTime = showSelectedTime.text ?? ""
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
