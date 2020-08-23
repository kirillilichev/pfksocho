//
//  ViewController.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import UIKit
import Moya

class MainScreenViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.alpha = 0
        // Do any additional setup after loading the view.
        view.backgroundColor = COLOR_WHITE
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        setupCollectionView()
        setupProvider()
        buttonEmotionalSearch = setupButtonEmotionalSearch()
        setupDataOfEvents()

    }
    
    var setSelectedUpvotes = NSMutableSet()
    var events: [Event] = []
    var eventsEnemies: [Event] = []
    var provider: MoyaProvider<SochiApi>!
    var standartHeightButtonSearchMore = CGFloat(0)
    var constaintBottomButtonSearchEmo: NSLayoutConstraint!
    var buttonEmotionalSearch: UIButton!
    var matchCurrent: Match!
    var update = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if self.buttonEmotionalSearch != nil {
            self.buttonEmotionalSearch.layer.cornerRadius = self.buttonEmotionalSearch.bounds.height / 2
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if self.events.count != 0 {
            updateDataOfEvents()
        }
    }
    func setupProvider() {

        let tokenOpt: String? = "7012f6e2c4dd4619f74b8444f60eb382bba81aef"
        var plugins: [PluginType] = []
      
        plugins = [AccessTokenPlugin(tokenClosure: {_ in tokenOpt!})]

        provider = MoyaProvider<SochiApi>(plugins: plugins)
      
    }
}
 


protocol MainScreenUpvoteDelegate {
    func upvoteCell(index: Int)
    func downvoteCell(index: Int)
}
