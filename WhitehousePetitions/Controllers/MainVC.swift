//
//  MainVC.swift
//  WhitehousePetitions
//
//  Created by Jeffrey Lai on 11/4/19.
//  Copyright © 2019 Jeffrey Lai. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {

    let mainTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViews()
        setupNavBar()
        setupTabBar()
    }
    
    func setupTableView() {
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
        mainTableView.backgroundColor = .systemBackground
    }

    func setupNavBar() {
        title = "Petitions"
        navigationController?.navigationBar.tintColor = .systemYellow
    }
    
    func setupTabBar() {
        let firstVC = UIViewController()
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        
        let secondVC = UIViewController()
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
        
        let viewControllerList = [firstVC, secondVC]
        viewControllers = viewControllerList.map {
            UINavigationController(rootViewController: $0)
        }
        
    }
    
    func setupViews() {
        view.addSubview(mainTableView)
        
        mainTableView.translatesAutoresizingMaskIntoConstraints = false
        mainTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        mainTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        //mainTableView.bottomAnchor.constraint(equalTo: , constant: 0).isActive = true
        
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //TODO
        return UITableViewCell()
    }
    
    
}

//extension MainVC: UITabBarControllerDelegate {
//
//}
