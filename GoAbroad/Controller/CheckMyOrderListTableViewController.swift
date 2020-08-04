//
//  CheckMyOrderListTableViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/26.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

class CheckMyOrderListTableViewController: UITableViewController {

    
    @IBOutlet weak var comingLabel: UILabel!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkOrder()
        print(hasOrder)
        print("\(NSHomeDirectory())/Documents/database.db")
        tapComingLabel()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func checkOrder() {
        if userMail == "" {
            print("no userMail")
            return
        }
        print(userMail)
        db.collection("GoAbroad").document(userMail).getDocument { (document, error) in
            //如果有訂單就改狀態
            if let document = document, document.exists {
                hasOrder = (document.data()!["hasOrder"] as? Bool)!
            }
        }
    }
}
extension CheckMyOrderListTableViewController {
    func tapComingLabel() {
        let TapLabel: UITapGestureRecognizer = UITapGestureRecognizer(target: self,action: #selector(pressedComingLabel)) // 加入觸發條件
        comingLabel.addGestureRecognizer(TapLabel) // 加入觸發動作
    }
    
    @objc func pressedComingLabel(){
        if hasLogin == false {
             let alert = UIAlertController(title: "請先登入", message: nil, preferredStyle: .alert)
             let ok = UIAlertAction(title: "確定", style: .default) { (action) in
                self.performSegue(withIdentifier: "orderToLoginPage", sender: self)
             }
             let cancel = UIAlertAction(title: "取消", style: .destructive, handler: nil)
             alert.addAction(ok)
             alert.addAction(cancel)
             present(alert, animated: true, completion: nil)
        } else {
            checkHasOrder()
            
            if hasOrder == true{
                self.performSegue(withIdentifier: "toDetail", sender: self)
            } else {
                print("NO ORDER")
            }
            
            
        }
 
    }
    
    func checkHasOrder() {
        let docRef = db.collection("GoAbroad").document(userMail)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let property = document.get("hasOrder") as! Bool
                print("TEST: \(property)")
                hasOrder = property
            } else {
                print("Document does not exist")
            }
        }
    }
}
