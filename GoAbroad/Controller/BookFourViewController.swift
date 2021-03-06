//
//  BookFourViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/26.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit


class BookFourViewController: UIViewController {
    //UI
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userTelLabel: UILabel!
    @IBOutlet weak var userMailLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var detailAddrLabel: UILabel!
    @IBOutlet weak var airportLabel: UILabel!
    @IBOutlet weak var totalManLabel: UILabel!
    @IBOutlet weak var luggageLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var placeOne: UILabel!
    @IBOutlet weak var placeTwo: UILabel!

    //Action
    @IBAction func nextBtn(_ sender: UIButton) {
        nextBtnLogic()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let userName = UserDefaults.standard.object(forKey: "userName") as? String {
            userNameLabel.text = userName
            print("姓名：\(userName)")
        }
        if let userTel = UserDefaults.standard.object(forKey: "userTel") as? String {
            userTelLabel.text = userTel
            print("電話：\(userTel)")
        }
        if let userMail = UserDefaults.standard.object(forKey: "userMail") as? String {
            userMailLabel.text = userMail
            print("信箱：\(userMail)")
        }
    }
}

extension BookFourViewController {
    func initData() {
        dateLabel.text = orderBoardDate
        timeLabel.text = orderBoardTime
        cityLabel.text = orderUserCity + orderUserDist
        detailAddrLabel.text = orderDetailAddr
        airportLabel.text = orderUserAirport + orderTerminalNum
        
        totalManLabel.text = orderTotalPessenger
        luggageLabel.text = orderLuggage
        totalPriceLabel.text = orderPrice

        if orderGoOrBack == "接機" {
            placeOne.text = "下車地點"
            placeTwo.text = "上車地點"
        }
    }
    
}

//MARK: - Next page Button
extension BookFourViewController {
    func nextBtnLogic() {
        self.performSegue(withIdentifier: "BookFourToFinal", sender: self)
        //self.navigationController?.popViewController(animated: true)
    }
    
}
