//
//  TicketViewController.swift
//  pfksochi
//
//  Created by  kirill on 23.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation
import UIKit
class TicketViewController: UIViewController {
    var buttonBack: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonBack()
    }
    
    @IBOutlet weak var buttonFood: UIButton!
    @IBOutlet weak var buttonApplePay: UIButton!
    @IBAction func buttonFood(_ sender: Any) {
    }
    func setupButtonBack() {
        buttonBack = UIButton(type: .custom)
        buttonBack.setImage(UIImage(named: "button_back_black"), for: .normal)
        view.addSubview(buttonBack)
        
        buttonBack.anchor(
            top: self.view.safeAreaLayoutGuide.topAnchor,
            leading: self.view.leadingAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 20, left: 12, bottom: 0, right: 0),
            size: CGSize(width: 36, height: 36))
        
        buttonBack.addTarget(self, action: #selector(pressedButtonBack), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        buttonFood.layer.cornerRadius = buttonFood.bounds.height / 2
        buttonApplePay.layer.cornerRadius = buttonApplePay.bounds.height / 2
    }
    
    @objc func pressedButtonBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
