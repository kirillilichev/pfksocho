//
//  MainScreenCollectionViewFooter.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation
import UIKit
class MainScreenCollectionViewFooter: UICollectionReusableView {
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MainScreenCollectionViewFooter {
    func setupViews() {
        label = UILabel()
        addSubview(label)
        label.textColor = COLOR_DARK
        label.font = FONT_MAIN_BOLD.withSize(18)
        label.anchor(
            top: self.topAnchor,
            leading: self.leadingAnchor,
            bottom: self.bottomAnchor,
            trailing: self.trailingAnchor)
        label.centerInSuperviewY()
    }
}
