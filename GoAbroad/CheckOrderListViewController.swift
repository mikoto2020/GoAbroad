//
//  testCustomSegmentViewController.swift
//  GoAbroad
//
//  Created by 謝宜靜 on 2020/7/26.
//  Copyright © 2020 JeanneHsieh. All rights reserved.
//

import UIKit

protocol CustomSegmentControlDelegate: class {
    func changeToIndex(index: Int)
}

class CheckOrderListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let codeSegmented = CustomSgmentControl(frame: CGRect(x: 0, y: 50, width: self.view.frame.width, height: 50), buttonTitle: ["即將到來的行程","過去行程"])
        codeSegmented.backgroundColor = .clear
        view.addSubview(codeSegmented)
    }
}

//MARK: - Custom Sgment Control
class CustomSgmentControl: UIView {
    weak var delegate: CustomSegmentControlDelegate?
    private var buttonTitles:[String]!
    private var buttons: [UIButton] = []
    private var selectorView: UIView!
    
    
    private var _selectedIndex: Int = 0
    public var selctedIndex:Int {
        return _selectedIndex
    }
    
    var textColor:UIColor = .black
    var selectorViewColor:UIColor = .red
    var selectorTextColor:UIColor = .red
    
    private func configStackView() {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stack.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stack.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stack.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    private func configSelectorView() {
        let selectorWidth = frame.width / CGFloat(self.buttonTitles.count)
        selectorView = UIView(frame: CGRect(x: 0, y: self.frame.height, width: selectorWidth, height: 2))
        selectorView.backgroundColor = selectorViewColor
        addSubview(selectorView)
    }
    
    private func createButton() {
        buttons = [UIButton]()
        buttons.removeAll()
        subviews.forEach({$0.removeFromSuperview()})
        for buttonTitle in buttonTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(CustomSgmentControl.buttonAction(sender:)), for: .touchUpInside)
            button.setTitleColor(textColor, for: .normal)
            buttons.append(button)
        }
        buttons[0].setTitleColor(selectorViewColor, for: .normal)
    }
    
    @objc func buttonAction(sender: UIButton) {
        for(buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            if btn == sender {
                let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(buttonIndex)
                delegate?.changeToIndex(index: buttonIndex)
                UIView.animate(withDuration: 0.3) {
                    self.selectorView.frame.origin.x = selectorPosition
                }
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    private func updateView() {
        createButton()
        configSelectorView()
        configStackView()
    }

    convenience init(frame: CGRect, buttonTitle:[String]) {
        self.init(frame: frame)
        self.buttonTitles = buttonTitle
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        updateView()
    }
    func setButtonTitles(buttonTitles:[String]) {
        self.buttonTitles = buttonTitles
        updateView()
    }

    func setIndex(index: Int) {
        buttons.forEach({$0.setTitleColor(textColor, for: .normal)})
        let button = buttons[index]
        _selectedIndex = index
        button.setTitleColor(selectorTextColor, for: .normal)
        let selectorPosition = frame.width / CGFloat(buttonTitles.count) * CGFloat(index)
        UIView.animate(withDuration: 0.2) {
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
}
