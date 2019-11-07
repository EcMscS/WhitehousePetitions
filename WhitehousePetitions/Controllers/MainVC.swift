//
//  MainVC.swift
//  WhitehousePetitions
//
//  Created by Jeffrey Lai on 11/4/19.
//  Copyright © 2019 Jeffrey Lai. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupTabBar()
    }

    func setupNavBar() {
        title = " General Petitions"
        navigationController?.navigationBar.tintColor = .systemYellow
    }
    
    func setupTabBar() {
        let firstVC = FirstTabVC()
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        
        let secondVC = SecondTabVC()
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        
        let viewControllerList = [firstVC, secondVC]
        viewControllers = viewControllerList
        
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1 {
            title = "Featured Petitions"
        } else {
            title = "General Petitions"
        }
    }
    
}
