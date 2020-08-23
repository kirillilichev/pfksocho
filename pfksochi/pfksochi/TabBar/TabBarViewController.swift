

import Foundation
import UIKit
import AHKNavigationController
class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarAppearance()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let mainScreenViewController = storyboard.instantiateViewController(identifier: "MainScreenViewController") as! MainScreenViewController
        let mainNavViewController = AHKNavigationController(rootViewController: mainScreenViewController)
        let calendarViewController = MainScreenViewController()
        let calendarNavViewController = AHKNavigationController(rootViewController: calendarViewController)
        let shopViewController = MainScreenViewController()
        let shopNavViewController = AHKNavigationController(rootViewController: shopViewController)
        
        let profileViewController = MainScreenViewController()
        let profileNavViewController = AHKNavigationController(rootViewController: profileViewController)
        
        
        self.viewControllers = [
            mainNavViewController,
//            calendarNavViewController,
//            shopNavViewController,
//            profileNavViewController
        ]
        
        let tabBarItemToday = UITabBarItem(title: nil, image: UIImage(named: "Calendar_Tab"), selectedImage: nil)

        tabBarItemToday.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
       
        
        calendarViewController.tabBarItem = tabBarItemToday
        
        let tabBarItemComp = UITabBarItem(title: nil, image: UIImage(named: "home 1"), selectedImage: nil)

        tabBarItemComp.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        mainNavViewController.tabBarItem = tabBarItemComp

        
        let tabBarItemShop = UITabBarItem(title: nil, image: UIImage(named: "Shop_Tab"), selectedImage: nil)

        tabBarItemShop.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        shopNavViewController.tabBarItem = tabBarItemShop

        
        let tabBarItemProfile = UITabBarItem(title: nil, image: UIImage(named: "profile 1"), selectedImage: nil)

        tabBarItemProfile.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)

        profileNavViewController.tabBarItem = tabBarItemProfile

        
        

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            if traitCollection.userInterfaceStyle == .light {
                return .darkContent
            } else {
                return .darkContent
            }
        } else {
            return .darkContent
        }
    }
}

extension TabBarViewController {
    func setupTabBarAppearance() {

        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = COLOR_PRIMARY
        self.tabBar.unselectedItemTintColor = COLOR_WHITE
        self.tabBar.tintColor = COLOR_ACCENT
    }
}




extension UIApplication {

var statusBarView: UIView? {
    return value(forKey: "statusBar") as? UIView
   }
}
