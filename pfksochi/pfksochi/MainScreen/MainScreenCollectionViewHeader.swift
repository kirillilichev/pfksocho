//
//  MainScreenCollectionViewHeader.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation
import UIKit
class MainScreenCollectionViewHeader: UICollectionReusableView {

    var labelTitle: UILabel!
    var labelShortInfo: UILabel!
    var imageViewHome: UIImageView!
    var imageViewGuest: UIImageView!
    var labelHome: UILabel!
    var labelGuest: UILabel!
    var labelCityHome: UILabel!
    var labelCityGuest: UILabel!
    var labelBottom: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        labelTitle = UILabel()
        labelShortInfo = UILabel()
        imageViewHome = UIImageView()
        imageViewGuest = UIImageView()
        labelHome = UILabel()
        labelGuest = UILabel()
        labelCityHome = UILabel()
        labelCityGuest = UILabel()
        labelBottom = UILabel()
        
        addSubview(labelTitle)
        addSubview(labelShortInfo)
        addSubview(imageViewHome)
        addSubview(imageViewGuest)
        addSubview(labelHome)
        addSubview(labelGuest)
        addSubview(labelCityHome)
        addSubview(labelCityGuest)
        addSubview(labelBottom)

        setupSubviews()
        backgroundColor = .clear
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSubviews() {
        setupLabelTitle()
        setupLabelShortInfo()
        setupImageViewHome()
        setupImageViewGuest()
        setupLabelHome()
        setupLabelGuest()
        setupLabelHomeCity()
        setupLabelGuestCity()
        setupLabelBottom()
    }
    
    func setupLabelShortInfo() {
        labelShortInfo.font = FONT_MAIN_LIGHT
        labelShortInfo.textColor = COLOR_DARK
        labelShortInfo.numberOfLines = 0
        self.addSubview(labelTitle)
        labelShortInfo.textAlignment = .center
        labelShortInfo.anchor(
            top: labelTitle.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 180, height: 60))
        labelShortInfo.centerInSuperviewX()
    }
    func setupLabelTitle() {
        labelTitle.font = FONT_MAIN_BOLD
        labelTitle.textColor = COLOR_DARK

        self.addSubview(labelTitle)
        labelTitle.textAlignment = .center
        labelTitle.anchor(
            top: self.topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: self.trailingAnchor,
            padding: UIEdgeInsets(top: 16, left: 32, bottom: 0, right: 24),
            size: CGSize(width: 0, height: 24))

        
    }
    
    
    func setupImageViewHome() {
        imageViewHome.contentMode = .scaleAspectFit
        imageViewHome.anchor(
            top: self.labelShortInfo.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: self.centerXAnchor,
            padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 24),
            size: CGSize(width: UIScreen.main.bounds.width * 0.25, height: 50))
    }
    
    func setupImageViewGuest() {
        imageViewGuest.contentMode = .scaleAspectFit
        imageViewGuest.anchor(
            top: self.labelShortInfo.bottomAnchor,
            leading: self.centerXAnchor,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 8, left: 24, bottom: 0, right: 0),
            size: CGSize(width: UIScreen.main.bounds.width * 0.25, height: 50))
    }
    
    func setupLabelHome() {
        labelHome.font = FONT_MAIN_SEMI_BOLD
        labelHome.textColor = COLOR_DARK

        self.addSubview(labelHome)
        labelHome.textAlignment = .center
        labelHome.anchor(
            top: self.imageViewHome.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 80, height: 16))
        self.addConstraint(
            NSLayoutConstraint(
                item: labelHome,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: imageViewHome,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            )
        )
    }
    
    func setupLabelGuest() {
        labelGuest.font = FONT_MAIN_SEMI_BOLD
        labelGuest.textColor = COLOR_DARK

        self.addSubview(labelHome)
        labelGuest.textAlignment = .center
        labelGuest.anchor(
            top: self.imageViewGuest.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 80, height: 16))
        self.addConstraint(
            NSLayoutConstraint(
                item: labelGuest,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: imageViewGuest,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            )
        )
    }
    
    
    func setupLabelHomeCity() {
        labelCityHome.font = FONT_MAIN_LIGHT
        labelCityHome.textColor = COLOR_DARK.withAlphaComponent(0.6)

        labelCityHome.textAlignment = .center
        labelCityHome.anchor(
            top: self.labelHome.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 80, height: 14))
        self.addConstraint(
            NSLayoutConstraint(
                item: labelCityHome,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: labelHome,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            )
        )
    }

    func setupLabelGuestCity() {
        labelCityGuest.font = FONT_MAIN_LIGHT
        labelCityGuest.textColor = COLOR_DARK.withAlphaComponent(0.6)

        labelCityGuest.textAlignment = .center
        labelCityGuest.anchor(
            top: self.labelGuest.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 80, height: 14))
        self.addConstraint(
            NSLayoutConstraint(
                item: labelCityGuest,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: labelGuest,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            )
        )
    }
    
    func setupLabelBottom() {
        labelBottom.font = FONT_MAIN_BOLD.withSize(18)
        labelBottom.textColor = COLOR_DARK
        

        labelBottom.anchor(
            top: nil,
            leading: self.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            size: CGSize(width: 0, height: 20))

    }
}
