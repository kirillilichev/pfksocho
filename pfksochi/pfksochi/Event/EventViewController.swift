//
//  EventViewController.swift
//  pfksochi
//
//  Created by  kirill on 23.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation
import UIKit
import Moya

class EventViewController: UIViewController {
    @IBOutlet weak var imageViewUpvote: UIImageView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    var eventCurrent: Event!
    @IBOutlet weak var labelTagFirst: UILabel!
    var buttonBack: UIButton!
    
    @IBOutlet weak var constraintHeightScrollView: NSLayoutConstraint!
    @IBOutlet weak var constraintHeightTextView: NSLayoutConstraint!
    @IBOutlet weak var labelTagSecond: UILabel!
    @IBOutlet weak var textViewEvent: UITextView!
    @IBOutlet weak var labelCountOfUpvotes: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageViewTop: UIImageView!
    var provider: MoyaProvider<SochiApi>!
    override func viewDidLoad() {
        super.viewDidLoad()
        if pressed {
            self.labelCountOfUpvotes.textColor = COLOR_YELLOW
            self.imageViewUpvote.image = UIImage(named: "downvote")
        }
        setupButtonBack()
        setupProvider()
        labelTitle.text = eventCurrent.name
        textViewEvent.text = eventCurrent.description
        labelCountOfUpvotes.text = String(eventCurrent.likes!)
        imageViewTop.kf.setImage(with: URL(string: eventCurrent.photo!))
        let heightTextView = textViewEvent.sizeThatFits(CGSize(width: view.bounds.width - 32, height: CGFloat.greatestFiniteMagnitude)).height
        constraintHeightTextView.constant = heightTextView
        self.view.layoutSubviews()
        scrollView.delegate = self
        buttonEmotionalSearch = setupButtonEmotionalSearch()
    }
    
    var standartHeightButtonSearchMore = CGFloat(0)
    var constaintBottomButtonSearchEmo: NSLayoutConstraint!
    var buttonEmotionalSearch: UIButton!
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        labelTagFirst.layer.borderWidth = 1
        labelTagSecond.layer.borderWidth = 1
        labelTagFirst.layer.cornerRadius = 20
        labelTagSecond.layer.cornerRadius = 20
        labelTagFirst.layer.borderColor = COLOR_DARK.cgColor
        labelTagSecond.layer.borderColor = COLOR_DARK.cgColor

        labelTagFirst.text = "Интересное"
        if self.eventCurrent.tags != nil {
            if self.eventCurrent.tags!.count > 0 {
                labelTagSecond.text = self.eventCurrent.tags![0].name
                
                switch self.eventCurrent.tags![0].type! {
                case 0:
                    labelTagSecond.layer.borderColor = COLOR_DARK.cgColor
                case 1:
                    labelTagSecond.layer.borderColor = COLOR_GREEN.cgColor

                default:
                    labelTagSecond.layer.borderColor = COLOR_RED.cgColor

                }
            }
        }
        if buttonEmotionalSearch != nil {
            buttonEmotionalSearch.layer.cornerRadius = buttonEmotionalSearch.bounds.height / 2
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if constraintHeightScrollView.constant != self.labelTagSecond.frame.maxY + 90 {
            constraintHeightScrollView.constant = self.labelTagSecond.frame.maxY + 90
            self.view.layoutSubviews()

        }
    }
    
    func setupProvider() {

        let tokenOpt: String? = "7012f6e2c4dd4619f74b8444f60eb382bba81aef"
        var plugins: [PluginType] = []
      
        plugins = [AccessTokenPlugin(tokenClosure: {_ in tokenOpt!})]

        provider = MoyaProvider<SochiApi>(plugins: plugins)
      
    }
    var pressed = false
}

extension EventViewController: UIScrollViewDelegate {
    
    func setupButtonEmotionalSearch() -> UIButton {
        let button = UIButton(type: .custom)
        button.alpha = 0

        let tabBarHeight = (self.tabBarController?.tabBar.bounds.height)!
        button.setTitle("Проголосовать", for: .normal)
        button.setTitleColor(COLOR_DARK, for: .normal)
        button.titleLabel!.font = FONT_MAIN_BOLD.withSize(14)
        standartHeightButtonSearchMore = view.bounds.height - tabBarHeight - 16


        self.view.addSubview(button)

        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        let bottomOffset = self.getButtonEmotionalBottomOffset()

        constaintBottomButtonSearchEmo = self.view.bottomAnchor
            .constraint(equalTo: button.bottomAnchor, constant: bottomOffset)

        constaintBottomButtonSearchEmo.isActive = true
        button.backgroundColor = COLOR_YELLOW
        button.addTarget(self, action: #selector(pressedButtonEmotionalSearch), for: .touchUpInside)
        button.anchor(
            top: nil,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            size: CGSize(width: "Купить билет".width(withConstrainedHeight: 18, font: FONT_MAIN_BOLD) + 90, height: 50)
        )
        return button

    }
    func getButtonEmotionalBottomOffset() -> CGFloat {
        let tabBarHeight = (self.tabBarController?.tabBar.bounds.height)!

        if tabBarHeight == 83 {
            return 20
        } else {
            return 20
        }
    }
    
    @objc func pressedButtonEmotionalSearch() {
        self.pressed = true
        hideButtonEmotionalSearch()
        imageViewUpvote.image = UIImage(named: "downvote")
        labelCountOfUpvotes.text = String(Int(labelCountOfUpvotes.text!)! + 1)
        labelCountOfUpvotes.textColor = COLOR_YELLOW
        
        provider.request(.sendLike(userId: 1, eventId: self.eventCurrent.id!)) { (result) in
            switch result {
            case .success(let resp):
                print(resp.statusCode)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func showButtonEmotionalSearch() {

        UIView.animate(withDuration: 0.2, animations: {

            self.view.bringSubviewToFront(self.buttonEmotionalSearch)
            self.buttonEmotionalSearch.alpha = 1
            self.constaintBottomButtonSearchEmo.constant = self.getButtonEmotionalBottomOffset()
            self.view.layoutSubviews()

        })

      
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 40 && !self.pressed {
            showButtonEmotionalSearch()
        } else {
            hideButtonEmotionalSearch()
        }
    }
    
    func hideButtonEmotionalSearch() {


        UIView.animate(withDuration: 0.2, delay: 0.1, animations: {
            self.view.bringSubviewToFront(self.buttonEmotionalSearch)

            // hide
            self.constaintBottomButtonSearchEmo.constant = -100

            self.view.layoutSubviews()
           
        }) { (_) in
            self.buttonEmotionalSearch.alpha = 1
        }

    }
    
    func setupButtonBack() {
        buttonBack = UIButton(type: .custom)
        buttonBack.setImage(UIImage(named: "back_button"), for: .normal)
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
