//
//  SubmitViewController.swift
//  pfksochi
//
//  Created by  kirill on 23.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation
import UIKit
import Moya

class SubmitViewController: UIViewController {
    @IBOutlet weak var textViewName: UITextView!
    
    @IBOutlet weak var textViewDesc: UITextView!
    var buttonBack: UIButton!
    @IBOutlet weak var buttonCreateEvent: UIButton!
    @IBOutlet weak var buttonAddPhotos: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonBack()
        setupProvider()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        gesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(gesture)
    }
    @IBAction func pressedButtonEvent(_ sender: Any) {
        if textViewName.text == "" || textViewDesc.text == "" || textViewDesc.text == "Напишите описание акции..." || textViewName.text == "Напишите название акции..." { return }
        provider.request(.createEvent(userId: 1, name: textViewName.text, description: textViewDesc.text, photo: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Fisht_Olympic_Stadium_2017.jpg/600px-Fisht_Olympic_Stadium_2017.jpg")) { (result) in
            switch result {
            case .success(let resp):
                print(resp.statusCode)
                self.navigationController?.popViewController(animated: true)
            case .failure(let error):
                print(error)
            }
        }
    }
    @IBAction func pressedButtonAddPhotos(_ sender: Any) {
    }
    
    var provider: MoyaProvider<SochiApi>!
    
    func setupProvider() {

        let tokenOpt: String? = "7012f6e2c4dd4619f74b8444f60eb382bba81aef"
        var plugins: [PluginType] = []
      
        plugins = [AccessTokenPlugin(tokenClosure: {_ in tokenOpt!})]

        provider = MoyaProvider<SochiApi>(plugins: plugins)
      
    }
    
    @objc func tappedView() {
        if self.textViewName.isFirstResponder {
            self.textViewName.resignFirstResponder()

        }
        if self.textViewDesc.isFirstResponder {
            self.textViewDesc.resignFirstResponder()

        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.textViewName.layer.cornerRadius = 15
        self.textViewName.delegate = self
        self.textViewDesc.delegate = self
        self.textViewDesc.layer.cornerRadius = 15
        self.buttonAddPhotos.layer.cornerRadius = buttonAddPhotos.bounds.height / 2
        self.buttonCreateEvent.layer.cornerRadius = buttonCreateEvent.bounds.height / 2
        
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
    
    @objc func pressedButtonBack() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension SubmitViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
}
