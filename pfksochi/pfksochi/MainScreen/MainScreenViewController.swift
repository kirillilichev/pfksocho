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
        setupDataOfEventsEnemies()
        setupCollectionView()
        
        buttonEmotionalSearch = setupButtonEmotionalSearch()
    }
    
    var setSelectedUpvotes = NSMutableSet()
    var events: [Event] = []
    var eventsEnemies: [Event] = []
    
    var standartHeightButtonSearchMore = CGFloat(0)
    var constaintBottomButtonSearchEmo: NSLayoutConstraint!
    var buttonEmotionalSearch: UIButton!
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if self.buttonEmotionalSearch != nil {
            self.buttonEmotionalSearch.layer.cornerRadius = self.buttonEmotionalSearch.bounds.height / 2
        }
    }

}



protocol MainScreenUpvoteDelegate {
    func upvoteCell(index: Int)
    func downvoteCell(index: Int)
}
