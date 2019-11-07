//
//  SecondTabVC.swift
//  WhitehousePetitions
//
//  Created by Jeffrey Lai on 11/6/19.
//  Copyright © 2019 Jeffrey Lai. All rights reserved.
//

import UIKit

class SecondTabVC: UITableViewController {

    var petitions = [Petition]()
    let whitehousePetitionURL = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
    let workingURL:String = "https://www.hackingwithswift.com/samples/petitions-2.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
        fetchData()
    }

    
    func setupView() {
        view.backgroundColor = .systemBackground
        title = "Featured Petitions"
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func fetchData() {
        let urlString = whitehousePetitionURL
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                //It's ok to Parse JSON Data
                parse(json: data)
            }
        }
    }
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let petition = petitions[indexPath.row]
        
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewVC()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    deinit {
        petitions = [Petition]()
    }

}
