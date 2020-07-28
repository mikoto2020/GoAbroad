//
//  PersonalInfoTableViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/27.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

class PersonalInfoTableViewController: UITableViewController {
    //UI
    @IBOutlet weak var personalName: UILabel!
    @IBOutlet weak var personalPhoneNum: UILabel!
    @IBOutlet weak var personalMail: UILabel!
//    @IBAction func GoToRegister(_ sender: UIButton) {
//
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        if let userName = UserDefaults.standard.object(forKey: "userName") as? String {
            personalName.text = userName
        }
        if let userTel = UserDefaults.standard.object(forKey: "userTel") as? String {
            personalPhoneNum.text = userTel
        }
    }

    // MARK: - TableView DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
}
