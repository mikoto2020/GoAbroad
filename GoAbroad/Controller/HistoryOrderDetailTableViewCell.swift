//
//  HistoryOrderDetailTableViewCell.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/8/4.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

class HistoryOrderDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var goOrBackDateTimeLabel: UILabel!
    @IBOutlet weak var showFromLabel: UILabel!
    @IBOutlet weak var showToLabel: UILabel!
    @IBOutlet weak var showImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
