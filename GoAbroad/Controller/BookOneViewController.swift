//
//  BookOneViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/24.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

class BookOneViewController: UIViewController, UITextFieldDelegate {
    //UI
    @IBOutlet weak var airportPickerView: UIPickerView!
    @IBOutlet weak var addressTxtField: UITextField!
    @IBOutlet weak var cityPickerView: UIPickerView!
    @IBOutlet weak var showLabel: UILabel!
    
    //Action
    @IBAction func segmentHandler(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            showLabel.text = "請輸入送機上車地址"
            segmentSelect = "送機"
        } else {
            showLabel.text = "請輸入接機上車地址"
            segmentSelect = "接機"
        }
    }
    
    @IBAction func nextBtn(_ sender: UIButton) {
        nextBtnLogic()

    }

    //Data
    let dataDefault = ["none"]
    let cities =  ["請選擇城市","台北市","新北市","基隆市"]
    let dataCitys =  [
        "請選擇城市":["請選擇行政區"],"台北市":["大安區","士林區","內湖區","文山區","北投區","中山區","信義區","松山區","萬華區","中正區","大同區","南港區"],"新北市":["板橋區","中和區","永和區","土城區","三峽區","鶯歌區","樹林區","新莊區","三重區","蘆洲區","五股區","泰山區","林口區","八里區","淡水區","三芝區","石門區","金山區","萬里區","汐止區","瑞芳區","貢寮區","平溪區","雙溪區","新店區","深坑區","石碇區","坪林區","烏來區"],"基隆市":["中正區","中山區","信義區","仁愛區","安樂區","七堵區","暖暖區"]]
    let dataAirports = ["請選擇機場","桃園國際機場(TPE)","松山機場(TSA)"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        initData()
    }
}

extension BookOneViewController {
    func initData() {
        userCity = "請選擇城市"
        userDist = "請選擇行政區"
        userAirport = "請選擇機場"
    }
    func nextBtnLogic() {
        userDetailAddr = addressTxtField.text ?? ""
        print("12345"+userDetailAddr+userCity+userDist+userAirport)
        if userDetailAddr == "" || userCity == "請選擇城市" || userDist == "請選擇行政區" || userAirport == "請選擇機場" {
            
            let alert = UIAlertController(title: "請輸入正確資訊", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {

            print(userCity+userDist+userDetailAddr+userAirport)

            self.performSegue(withIdentifier: "BookOneToBookTwo", sender: self)
        }
    }
}

extension BookOneViewController {
    func setupSubviews() {
        cityPickerView.dataSource = self
        cityPickerView.delegate = self
        airportPickerView.dataSource = self
        airportPickerView.delegate = self
        addressTxtField.delegate = self
    }
}

extension BookOneViewController: UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()   //點選鍵盤上的rerurn關閉鍵盤
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)  //點選空白處關閉鍵盤
    }
    
}

extension BookOneViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView.tag == 11{
            return 2
        }
        if pickerView.tag == 12 {
            return 1
        }
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 11 && component == 0 {
            return dataCitys.count
        }
        if pickerView.tag == 11 && component == 1 {
            let selectedIdx = pickerView.selectedRow(inComponent: 0)
            let city = cities[selectedIdx]
            if let distList = dataCitys[city] {
                return distList.count
            }
        }
        if pickerView.tag == 12 {
            return dataAirports.count
        }
            return dataDefault.count
    }
}

extension BookOneViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                if pickerView.tag == 11 && component == 0 {
                    return cities[row]
                }
                if pickerView.tag == 11 && component == 1 {
                    let selectedIdx = pickerView.selectedRow(inComponent: 0)
                    let city = cities[selectedIdx]
                    if let distList = dataCitys[city] {
                        return distList[row]
                    }
                    return ""
                }
                if pickerView.tag == 12 {
                    return dataAirports[row]
                }
                return dataDefault[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 11 {
            if component == 0 {
                let city = cities[row]
                userCity = city
                if let distList = dataCitys[city] {
                    userDist = distList[0]
                }
                pickerView.reloadComponent(1)
                pickerView.selectRow(0, inComponent: 1, animated: true)
            } else {
                let selectedIdx = pickerView.selectedRow(inComponent: 0)
                let city = cities[selectedIdx]
                if let distList = dataCitys[city] {
                    userDist = distList[row]
                }
            }
        }
        if pickerView.tag == 12 {
            let airports = dataAirports[row]
            userAirport = airports
        }
    }
}


var userCity = ""
var userDist = ""
var userDetailAddr = ""
var userAirport = ""
var segmentSelect: String = ""   //儲存segment選項傳送至firebase
