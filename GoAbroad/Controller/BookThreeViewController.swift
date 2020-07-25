//
//  BookThreeViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/25.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

class BookThreeViewController: UIViewController {
    
    var overload = false

    //UI
    @IBOutlet weak var adultNumLabel: UILabel!
    @IBOutlet weak var childNumLabel: UILabel!
    @IBOutlet weak var luggageNumLabel: UILabel!
    @IBOutlet weak var totalPersonLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    //Action
    @IBAction func adultStepper(_ sender: UIStepper) {
        let count = Int(sender.value)
        adultNumLabel.text = "\(count)"
        totalPerson()
        totalPrice()
    }
    
    @IBAction func childSteppr(_ sender: UIStepper) {
        let count = Int(sender.value)
        childNumLabel.text = "\(count)"
        totalPerson()
        totalPrice()
    }
    
    @IBAction func luggageStepper(_ sender: UIStepper) {
        let count = Int(sender.value)
        luggageNumLabel.text = "\(count)"
    }

    @IBAction func nextBtn(_ sender: UIButton) {
        nextBtnLogic()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
    }
}

extension BookThreeViewController {
    func initData() {
        orderAdult = "0"
        orderChild = "0"
        orderLuggage = "0"
    }
}

extension BookThreeViewController {
    func totalPrice() {
        let personNum = Int(totalPersonLabel.text ?? "0") ?? 0
        print("總人數：\(personNum)")
        if personNum == 0 {
            totalPriceLabel.text = "0"
            overload = false
        } else if personNum <= 4 {
            overload = false
            totalPriceLabel.text = "1,000"
        } else if personNum <= 7 {
            overload = false
            totalPriceLabel.text = "1,500"
        } else {
            overload = true
            totalPriceLabel.text = "N/A"
        }
    }
    
    func totalPerson() {
        if let adult = Int(adultNumLabel.text ?? "0"), let child = Int(childNumLabel.text ?? "0") {
            let totalman = adult + child
            totalPersonLabel.text = "\(totalman)"
        }
    }
}

//MARK: - Next page Button
extension BookThreeViewController {
    func nextBtnLogic() {
        orderAdult = adultNumLabel.text ?? ""
        orderChild = childNumLabel.text ?? ""
        orderTotalPessenger = totalPersonLabel.text ?? ""
        orderPrice = totalPriceLabel.text ?? ""
        orderLuggage = luggageNumLabel.text ?? ""
        
        if orderAdult == "0" {
            print("error")
            let alert = UIAlertController(title: "請選擇乘車人數", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "確定", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else if overload {
            let alert = UIAlertController(title: "乘車人數大於七人，請聯繫客服", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "確定", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            self.performSegue(withIdentifier: "BookThreeToBookFour", sender: self)
        }
    }
}
