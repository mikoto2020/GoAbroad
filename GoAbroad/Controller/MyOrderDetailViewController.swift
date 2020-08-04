//
//  MyOrderDetailViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/26.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseDatabase

class MyOrderDetailViewController: UIViewController {
    @IBOutlet weak var showOrderView: UIView!
    @IBOutlet weak var showboardDateLabel: UILabel!
    @IBOutlet weak var showSetOffTimeLabel: UILabel!
    @IBOutlet weak var cityShowLabel: UILabel!
    @IBOutlet weak var addressShowLabel: UILabel!
    @IBOutlet weak var airportShowLabel: UILabel!
    @IBOutlet weak var terminalLabel: UILabel!
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showOrderView.isHidden = true
        getOrderFromFirebase()
        

        //從Firebase撈取document中的特定值（是否有訂單的判斷）
//        let docRef = db.collection("GoAbroad").document(userMail)
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let property = document.get("hasOrder") as! Bool
//                print("TEST: \(property)")
//                hasOrder = property
//            } else {
//                print("Document does not exist")
//            }
//        }
//        if hasOrder == true{
//        getOrderFromFirebase()
//        }else{
//           print("NO Order!")
//        }
    }
}

extension MyOrderDetailViewController {
    func getOrderFromFirebase() {

            db.collection("GoAbroad").document(userMail).collection("order").order(by: "orderBoardDate", descending: true).getDocuments{ (querySnapshot, error) in
                
                if let querySnapshot = querySnapshot {
                    
                    print("拿firebase的訂單")
                    print("data: \(querySnapshot.documents[0].data())")
                    
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
                    self.airportShowLabel.text = orderUserAirport!
                    self.terminalLabel.text = orderTerminalNum!
                    self.showOrderView.isHidden = false
            }
        }
    }
}


