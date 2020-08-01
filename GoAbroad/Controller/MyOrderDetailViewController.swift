//
//  MyOrderDetailViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/26.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit
import Firebase

class MyOrderDetailViewController: UIViewController {
    @IBOutlet weak var showOrderView: UIView!
    @IBOutlet weak var showboardDateLabel: UILabel!
    @IBOutlet weak var showSetOffTimeLabel: UILabel!
    @IBOutlet weak var cityShowLabel: UILabel!
    @IBOutlet weak var addressShowLabel: UILabel!
    @IBOutlet weak var airportShowLabel: UILabel!
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tt = UserDefaults.standard.object(forKey: "userTel") as? String {
            userTel = tt
        }
        self.showOrderView.isHidden = true
        print(hasOrder)
        getOrder()
    }
}

extension MyOrderDetailViewController {
    func getOrder() {
        print(hasOrder)
        //判斷是否有訂單
        if hasOrder == false {
            print("NO!")
        } else {
            db.collection("GoAbroad").document(userMail).collection("order").order(by: "orderBoardDate", descending: true).getDocuments{ (querySnapshot, error) in
                
                if let querySnapshot = querySnapshot {
                    
                    print("拿firebase的訂單")
                    print(querySnapshot.documents[0].data())
                    
                    let orderBoardDate = querySnapshot.documents[0].data()["orderBoardDate"] as? String
                    let orderBoardTime = querySnapshot.documents[0].data()["orderBoardTime"] as? String
                    let orderUserCity = querySnapshot.documents[0].data()["orderUserCity"] as? String
                    let orderUserDist = querySnapshot.documents[0].data()["orderUserDist"] as? String
                    let orderDetailAddr = querySnapshot.documents[0].data()["orderDetailAddr"] as? String
                    let orderUserAirport = querySnapshot.documents[0].data()["orderUserAirport"] as? String
                    let orderTerminalNum = querySnapshot.documents[0].data()["orderTerminalNum"] as? String
                    
                    self.showboardDateLabel.text = orderBoardDate
                    self.showSetOffTimeLabel.text = orderBoardTime
                    self.cityShowLabel.text = orderUserCity! + orderUserDist!
                    self.addressShowLabel.text = orderDetailAddr
                    self.airportShowLabel.text = orderUserAirport! + orderTerminalNum!
                    self.showOrderView.isHidden = false
                }
            }
        }
    }
}


