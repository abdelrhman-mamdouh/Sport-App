//
//  FavouriteTableViewController.swift
//  SportSync
//
//  Created by Hussien on 13/05/2024.
//

import UIKit
import Kingfisher
class FavouriteTableViewController: UITableViewController {
    var viewModel : FavouriteViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "FavouriteLeagueCellNip", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "FavouriteLeagueCellNip")
        viewModel = FavouriteViewModel()
        
        
   
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Favourite"
        viewModel?.featchData(completion: { myList in
            self.tableView.reloadData()
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return viewModel?.getFavouriteList().count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteLeagueCellNip", for: indexPath) as! FavouriteLeagueCellNip
        let currentObject = viewModel?.getFavouriteList()[indexPath.section]
        cell.leagueImage.kf.setImage(with: URL(string: currentObject?.logo ?? " ") , placeholder:  UIImage(named: "league"))
        cell.leagueTitle.text = currentObject?.title
        

        return cell
    }
    


   

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Alert", message: "Are you sure to delete ?", preferredStyle: .alert)
            let negative = UIAlertAction(title: "Yes", style: .destructive) { UIAlertAction in
                self.viewModel?.deleteItemAt(index: indexPath.section)
                tableView.deleteSections([indexPath.section], with: .left)
            }
            let posativeAction = UIAlertAction(title: "Cancel", style: .cancel) { UIAlertAction in
                alert.dismiss(animated: true)
            }
            alert.addAction(posativeAction)
            alert.addAction(negative)
            
            self.present(alert, animated: true)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Utility.checkConnection() {
            let viewController = self.storyboard?.instantiateViewController(withIdentifier: "leagueDetails") as! ViewController
            let currentObject = viewModel?.getFavouriteList()[indexPath.section]
            let leagesDetailsViewModel = LeagesDetailsViewModel(id: Int(currentObject?.id ?? "0") ?? 0, sport: currentObject?.sport ?? "", leageName: currentObject?.title ?? "", leageLogo: currentObject?.logo ?? "")
            viewController.leagesDetailsViewModel = leagesDetailsViewModel
            viewController.modalPresentationStyle = .fullScreen
            
            self.present(viewController, animated: true, completion: nil)
        } else {
            Utility.showToast(controller: self, message: "No Internet Connection Please Open Internet", seconds: 2)
        }
        
        print("Row selected")
    }

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
