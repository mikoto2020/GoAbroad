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
        personalMail.text = userMail
    }
    
    override func viewWillAppear(_ animated: Bool) {
        personalName.text = userName
        personalPhoneNum.text = userTel
    }

    // MARK: - TableView DataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
}
