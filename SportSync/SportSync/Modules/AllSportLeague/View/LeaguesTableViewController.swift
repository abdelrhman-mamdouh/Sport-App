//
//  LeaguesTableViewController.swift
//  SportSync
//
//  Created by Hussien on 11/05/2024.
//

import UIKit
import Kingfisher
class LeaguesTableViewController: UITableViewController {
    var viewModel : LeaguesViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsSelection = true
        Utility.startLoader(in: self.view)
        
        switch viewModel?.getSport(){
        case "football":
            tableView.backgroundView = UIImageView(image: UIImage(named: "football"))
            break
        case "tennis":
            tableView.backgroundView = UIImageView(image: UIImage(named: "tennis"))
            break
        case "basketball":
            tableView.backgroundView = UIImageView(image: UIImage(named: "tom-briskey-HM3WZ4B1gvM-unsplash"))
            break
        case "cricket":
            tableView.backgroundView = UIImageView(image: UIImage(named: "cirket"))
            break
        case .none:
            print("dede")
        case .some(_):
        print("dede")
        }
        
        viewModel?.fetchLeagues(completionHandler: { leagues, error in
            if leagues != nil {

                self.tableView.reloadData()
                Utility.stopLoadingAnimation(in: self.view)
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
       
        cell.leagueImage.kf.setImage(with: URL(string: currentLeague?.leagueLogo ?? " ") , placeholder: UIImage(named: "league"))
        cell.leagueTitle.text = currentLeague?.leagueName
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Utility.checkConnection() {
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "leagueDetails") as! ViewController
            
            let leagesDetailsViewModel = LeagesDetailsViewModel(id: viewModel?.getResult()[indexPath.section].leagueKey ?? 0, sport: viewModel?.getSport() ?? "football", leageName: viewModel?.getResult()[indexPath.section].leagueName ?? "Nil", leageLogo:viewModel?.getResult()[indexPath.section].leagueLogo ?? "logo")
            viewController.leagesDetailsViewModel = leagesDetailsViewModel
            viewController.modalPresentationStyle = .fullScreen
            
            self.present(viewController, animated: true, completion: nil)
        } else {
            Utility.showToast(controller: self, message: "No Internet Connection Please Open Internet", seconds: 2)
        }
        
        print("Row selected")
    }

    


 

}
