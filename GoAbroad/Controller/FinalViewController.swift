//
//  FinalViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/26.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

class FinalViewController: UIViewController {

    @IBAction func backToTopBtn(_ sender: UIButton) {
        nextBtnLogic()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK: - Next page Button
extension FinalViewController {
    func nextBtnLogic() {
        self.performSegue(withIdentifier: "finalBackToTop", sender: self)
    }
}
