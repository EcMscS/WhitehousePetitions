//
//  FirstTabVC.swift
//  WhitehousePetitions
//
//  Created by Jeffrey Lai on 11/6/19.
//  Copyright © 2019 Jeffrey Lai. All rights reserved.
//

import UIKit

class FirstTabVC: UITableViewController {

    var petitions = [Petition]()
    let whitehousePetitionURL = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
    let workingURL:String = "https://www.hackingwithswift.com/samples/petitions-1.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupTableView()
        fetchData()
    }

    
    func setupView() {
        view.backgroundColor = .systemBackground
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func fetchData() {
        let urlString = workingURL
        
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


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
