//
//  ViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/24.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController {
    
    @IBAction func reserveBtn(_ sender: UIButton) {
        tapReserveBtn()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        cleanBarShadow()
        print("page1")
    }

    @IBAction func mailto(_ sender: UIButton) {
        sendEmail()
    }
    @IBAction func phoneCall(_ sender: UIButton) {
        makeAPhoneCall()
    }
}

extension ViewController {
    func cleanBarShadow() {  //清除Navigator Bar的陰影
        let image = UIImage()
        navigationController?.navigationBar.setBackgroundImage(image, for: .default)
        navigationController?.navigationBar.shadowImage = image
    }
}

extension ViewController {
    func tapReserveBtn() {
        //點選訂車時，判斷用戶是否已登入
        if hasLogin == true {
            //已登入，進入訂車流程
            self.performSegue(withIdentifier: "goToReserve", sender: self)
        } else {
            //未登入，頁面跳轉至登入頁面
            self.performSegue(withIdentifier: "goToLogin", sender: self)
        }
    }
}

//MARK: - Mail compose view Controller Delegate
extension ViewController: MFMailComposeViewControllerDelegate {
    func sendEmail() {
        let emailTitle = "意見回饋"
        let messageBody = "感謝您的寶貴意見，我們將會於三至五個工作天內回覆您。"
        let recipient = ["aaa@aaa.com"]
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setSubject(emailTitle)
            mail.setMessageBody(messageBody, isHTML: false)
            mail.setToRecipients(recipient)
            self.present(mail, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "沒有「郵件」APP", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

//MARK: - Phone call
extension ViewController {
    func makeAPhoneCall() {
        let phoneNumber = "0908123456"
        if let phoneCallURL = URL(string: "tel:\(phoneNumber)") {
            let app = UIApplication.shared
            if (app.canOpenURL(phoneCallURL)) {
                let alert = UIAlertController(title: "是否要聯繫客服？", message: nil, preferredStyle: .alert)
                let yes = UIAlertAction(title: "確定", style: .default, handler: { (action) in
                    app.open(phoneCallURL, options: [:], completionHandler: nil)
                })
                let no = UIAlertAction(title: "取消", style: .default, handler: { (action) in

                })
                alert.addAction(yes)
                alert.addAction(no)
                present(alert, animated: true, completion: nil)
            }
        }
    }
}

