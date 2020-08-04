//
//  HistoryViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/8/3.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    let dao = UserOrderDAO.shared
    var orderArray = [UserOrder]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as!
            HistoryOrderDetailTableViewCell
        cell.goOrBackDateTimeLabel.text = orderArray[indexPath.row].goorback + "  " +
             orderArray[indexPath.row].date + "  " + orderArray[indexPath.row].time
        //接送類別為接機時，改變圖片與字體顏色
        if orderArray[indexPath.row].goorback == "接機" {
            cell.showFromLabel.text = orderArray[indexPath.row].airport + orderArray[indexPath.row].terminal
            cell.showToLabel.text = orderArray[indexPath.row].city + orderArray[indexPath.row].district + orderArray[indexPath.row].address
            let image = UIImage(named: "image-travel")
            cell.showImageView.image = image
            let color = UIColor(red: 109/255, green: 208/255, blue: 205/255, alpha: 1)
            cell.goOrBackDateTimeLabel.textColor = color
        } else {
            cell.showFromLabel.text = orderArray[indexPath.row].city + orderArray[indexPath.row].district + orderArray[indexPath.row].address
            cell.showToLabel.text = orderArray[indexPath.row].airport + orderArray[indexPath.row].terminal
        }
        return cell
    }

    @IBOutlet weak var historyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.delegate = self
        historyTableView.dataSource = self
        orderArray = dao.getAllUserOrder()
    }
}
