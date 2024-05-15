//
//  TeamDetailsViewController.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 14/05/2024.
//

import UIKit


class TeamDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var sportName: UILabel!
    @IBOutlet weak var leagueName: UILabel!

    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var playerTableView: UITableView!
    var teamViewModel: TeamViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        playerTableView.dataSource = self
        playerTableView.delegate = self
        
      
        playerTableView.register(UINib(nibName:Constants.tableViewCell, bundle: nil), forCellReuseIdentifier:Constants.tableViewCell)
   
        
        teamImageView.kf.setImage(with: URL(string: teamViewModel.teamDetails.team_logo ?? ""), placeholder: UIImage(named: "leauge"))
        sportName.text = teamViewModel.sport
        leagueName.text = teamViewModel.leagueName
        teamImageView.makeCircular()
        teamImageView.addShadow()
        teamImageView.addElevation()
        playerTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        playerTableView.reloadData()
        
    }
    


    func numberOfSections(in tableView: UITableView) -> Int {
        
        return teamViewModel.teamDetails.players?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        if let player = teamViewModel.teamDetails.players?[indexPath.section] {
          
            cell.contentView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
            cell.setPlayerData(player)
        }
        
        return cell
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 100.0
    }
    @IBAction func bachButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
