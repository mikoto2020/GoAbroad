//
//  MyOrderDetailViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/26.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

class MyOrderDetailViewController: UIViewController {
    @IBOutlet weak var showOrderView: UIView!
    @IBOutlet weak var showboardDateLabel: UILabel!
    @IBOutlet weak var showSetOffTimeLabel: UILabel!
    @IBOutlet weak var cityShowLabel: UILabel!
    @IBOutlet weak var addressShowLabel: UILabel!
    @IBOutlet weak var airportShowLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyOrderDetailViewController {
    func setupSubviews() {
        showboardDateLabel.text = orderBoardDate
        showSetOffTimeLabel.text = orderBoardTime
        cityShowLabel.text = orderUserCity + orderUserDist
        addressShowLabel.text = orderDetailAddr
        airportShowLabel.text = orderUserAirport
        showOrderView.isHidden = true
    }
}


