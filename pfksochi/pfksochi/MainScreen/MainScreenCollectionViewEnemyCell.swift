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

class MainScreenCollectionViewEnemyCell: UICollectionViewCell {
    var imageViewPoster: UIImageView!
    var label: UILabel!
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

extension MainScreenCollectionViewEnemyCell {
    
    func setupSubviews() {
        imageViewPoster = UIImageView()
        label = UILabel()
        
        addSubview(imageViewPoster)
        addSubview(label)

        setupImageView()
        setupLabel()
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
        label.numberOfLines = 0
        label.anchor(
            top: nil,
            leading: imageViewPoster.trailingAnchor ,
            bottom: nil,
            trailing: self.trailingAnchor,
            padding: UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0),
            size: CGSize(width: 0, height: 40))
        
        label.centerInSuperviewY(with: 0)
    }

  }
