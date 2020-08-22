//
//  ViewController.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = COLOR_WHITE
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupDataOfEvents()
        setupCollectionView()
    }
    
    var events: [Event] = []

    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

}



