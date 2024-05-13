//
//  LeaguesTableViewController.swift
//  SportSync
//
//  Created by Hussien on 11/05/2024.
//

import UIKit
import Kingfisher
class LeaguesTableViewController: UITableViewController {
    let names :[String] = ["mohamed" , "ahmed","anas"]
    var viewModel : LeaguesViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsSelection = true
        viewModel?.fetchLeagues(completionHandler: { leagues, error in
            if leagues != nil {
                self.tableView.reloadData()
                print("success")
            }else{
                print("error")
            }
        })
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return viewModel?.getResult().count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell
        let currentLeague = viewModel?.getResult()[indexPath.section]
        print(currentLeague?.leagueLogo)
        cell.leagueImage.kf.setImage(with: URL(string: currentLeague?.leagueLogo ?? " ") , placeholder: UIImage(named: "league"))
        cell.leagueTitle.text = currentLeague?.leagueName
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "leagueDetails") as! ViewController
        
        self.present(viewController, animated: true, completion: nil)
        print("Row selected")
    }
 

}
