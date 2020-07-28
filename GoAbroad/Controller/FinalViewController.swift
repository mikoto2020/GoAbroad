//
//  FinalViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/26.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet weak var waitingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var confirmDetailLabel: UILabel!
    @IBOutlet weak var confirmLabel: UILabel!
    @IBAction func backToTopBtn(_ sender: UIButton) {
        nextBtnLogic()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        confirmLabel.text = "訂單正在確認中"
        waitingIndicator.startAnimating()
        confirmDetailLabel.text = ""
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sleep(5)
        confirmLabel.text = "已收到您的訂單"
        waitingIndicator.stopAnimating()
        confirmDetailLabel.text = "火速為您派車中，感謝您的使用"
    }
}

//MARK: - Next page Button
extension FinalViewController {
    func nextBtnLogic() {
        self.performSegue(withIdentifier: "finalBackToTop", sender: self)
    }
}

