//
//  FinalViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/26.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit
import Firebase

class FinalViewController: UIViewController {
    //UI
    @IBOutlet weak var waitingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var confirmDetailLabel: UILabel!
    @IBOutlet weak var confirmLabel: UILabel!

    //Action
    @IBAction func backToTopBtn(_ sender: UIButton) {
        nextBtnLogic()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        confirmLabel.text = "訂單正在確認中"
        waitingIndicator.startAnimating()
        confirmDetailLabel.text = ""
        //sendToFirebase()
        //saveToUserDefaults()
        saveToSQLdb()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sleep(5)
        confirmLabel.text = "已收到您的訂單"
        waitingIndicator.stopAnimating()
        confirmDetailLabel.text = "火速為您派車中，感謝您的使用"
    }
}

//MARK: - Next page
extension FinalViewController {
    func nextBtnLogic() {
        self.performSegue(withIdentifier: "finalBackToTop", sender: self)
    }
}

//MARK: - Save to database
extension FinalViewController {
    func saveToUserDefaults() {
        let newOrder = UserOrder()
        print(newOrder)
    }
    func sendToFirebase() {
        let db = Firestore.firestore()
        //從UserDefault中取出值
        if let warp = UserDefaults.standard.object(forKey: "userName") as? String {
            userName = warp
        }
        if let warp = UserDefaults.standard.object(forKey: "userTel") as? String {
            userTel = warp
        }
        if let warp = UserDefaults.standard.object(forKey: "userMail") as? String {
            userMail = warp
        }
        //print("測試 \(String(describing: userName))")
        //print("測試 \(String(describing: userTel))")
        //print("測試 \(String(describing: userMail))")
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyy-MM-dd a hh:mm"
        let orderDay = DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .long)
        let data: [String: Any] = [
            "userOrderTime": orderDay,
            "userName": userName,
            "userTel": userTel,
            "userMail": userMail,
            "orderUserCity": orderUserCity,
            "orderUserDist": orderUserDist,
            "orderGoorBack": orderGoOrBack,
            "orderBoardTime": orderBoardTime,
            "orderBoardDate": orderBoardDate,
            "orderDetailAddr": orderDetailAddr,
            "orderUserAirport": orderUserAirport,
            "orderTerminalNum": orderTerminalNum,
            "orderAdult": orderAdult,
            "orderChild": orderChild,
            "orderTotalPessenger":orderTotalPessenger,
            "orderLuggage": orderLuggage,
            "orderPrice": orderPrice]
        db.collection("GoAbroad").document(userMail).collection("order").document(orderDay).setData(data)
        //addDocument(data: data)
        print("order sent!")
        //送出訂單後更改firebase上hasOrder的狀態
        UserDefaults.standard.set(true, forKey: "hasOrder")
        print("UserDefaults set!")
        db.collection("GoAbroad").document(userMail).setData(["hasOrder" : true])
    }
    func saveToSQLdb() {
        let dao = UserOrderDAO.shared
        let data = UserOrder()
            dao.insert(data: data)
            //print(dao.getAllContacts().count)
    }
}

