//
//  MainScreenCollectionViewCell.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation
import UIKit
import LGButton

class MainScreenCollectionViewCell: UICollectionViewCell {
    var imageViewPoster: UIImageView!
    var label: UILabel!
    var buttonUpvote: LGButton!
    var labelSecondary: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        imageViewPoster.layer.cornerRadius = 2
    }
}

extension MainScreenCollectionViewCell {
    
    func setupSubviews() {
        imageViewPoster = UIImageView()
        label = UILabel()
        buttonUpvote = LGButton()
        labelSecondary = UILabel()
        
        addSubview(imageViewPoster)
        addSubview(label)
        addSubview(buttonUpvote)
        addSubview(labelSecondary)

        setupImageView()
        setupLabel()
        setupButtonUpvote()
        setupLabelSecondary()
    }
    
    func setupImageView() {
        imageViewPoster.anchor(
            top: nil,
            leading: self.leadingAnchor,
            bottom: nil,
            trailing: nil,
        padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0))
        self.addConstraint(
            NSLayoutConstraint(item: imageViewPoster, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: -8)
        )
        self.addConstraint(
            NSLayoutConstraint(item: imageViewPoster, attribute: .width, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 1.6)
        )
        imageViewPoster.centerInSuperviewY()
        imageViewPoster.contentMode = .scaleAspectFit
        imageViewPoster.layer.masksToBounds = true
    }
    
    func setupLabel() {
        label.font = FONT_MAIN_SEMI_BOLD
        label.textColor = COLOR_DARK
        label.anchor(
            top: nil,
            leading: imageViewPoster.trailingAnchor ,
            bottom: nil,
            trailing: buttonUpvote.leadingAnchor,
            padding: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0),
            size: CGSize(width: 0, height: 16))
        
        label.centerInSuperviewY(with: -8)
    }
    
    func setupLabelSecondary() {
        labelSecondary.font = FONT_MAIN_MEDIUM
        labelSecondary.textColor = COLOR_DARK
        labelSecondary.text = "Подробнее"
        labelSecondary.anchor(
            top: label.bottomAnchor,
            leading: imageViewPoster.trailingAnchor ,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0),
            size: CGSize(width: "Подробнее".width(withConstrainedHeight: 12, font: FONT_MAIN_MEDIUM), height: 12))

    }
    
    func setupButtonUpvote() {
        let button = buttonUpvote!
        let paddingLeftOrRight = CGFloat(16)
        button.bgColor = .clear

        button.titleColor = COLOR_DARK
        button.leftImageHeight = 16
        button.leftImageWidth = 16
        button.spacingLeading = 10
        button.spacingTrailing = 10
        button.spacingTitleIcon = 2
        button.fullyRoundedCorners = true
        button.leftImageSrc = UIImage(named: "Upvote")
//        button.titleString =
        let widthButton = 80
        button.titleFontSize = 16
        button.titleFontName = "OpenSans-SemiBold"
        button.addTarget(self, action: #selector(pressedButtonLike(_:)), for: .touchUpInside)
        button.anchor(
            top: nil,
            leading: nil,
            bottom: nil,
            trailing: self.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: paddingLeftOrRight),
            size: CGSize(width: widthButton, height: 36)
        )
        button.centerInSuperviewY()

    }
    
    @objc func pressedButtonLike(_ sender: Any?) {
        
    }
}
