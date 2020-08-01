//
//  CheckMyOrderListTableViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/26.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit
import Firebase

class CheckMyOrderListTableViewController: UITableViewController {

    @IBOutlet weak var showCominOrder: UILabel!
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkOrder()
        print(hasOrder)
        
        let dao = UserOrderDAO.shared
        //let data = UserOrder()
        dao.delete(fid: 4)
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
