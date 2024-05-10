//
//  MainScreenCollectionViewController.swift
//  SportSync
//
//  Created by Hussien on 10/05/2024.
//

import UIKit

private let reuseIdentifier = "MainScreenCollectionViewCell"

class MainScreenCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {

    let sports :[Sports] = [Sports(title: "Football", imageName: "football_icon") ,Sports(title: "Tennis", imageName: "tennis_icon") ,Sports(title: "Basketball", imageName: "basketball_icon") ,Sports(title: "Cricket", imageName: "cricket_icon") ,Sports(title: "Hockey", imageName: "ice_hockey_icon") ,Sports(title: "Rugby", imageName: "rugbyball_icon")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        self.collectionView.contentInset.top =  max((collectionView.frame.height - 400) / 2, 0)
        self.collectionView.contentInset.left = 10
        self.collectionView.contentInset.right = 10
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("pressed")
    }
    /*
    // MARK: - Navigation
     
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return sports.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MainScreenCollectionViewCell
        
        cell.mainTitle.text = sports[indexPath.item].title
        cell.mainImage.image = UIImage(named: sports[indexPath.item].imageName)
        cell.layer.cornerRadius	= 20.0
        
        
        print("test")
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (UIScreen.main.bounds.width / 2) - 25 , height: 100 )
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(sports[indexPath.item].title)
    }
    
    
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        let cellWidth = (UIScreen.main.bounds.width / 2) - 8
//        let numberOfCells = CGFloat(2)
//        let edgeInsets = (collectionView.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)
//        print((UIScreen.main.bounds.height ))
//        
//        return UIEdgeInsets(top: ((UIScreen.main.bounds.height - 300)/2), left: 3, bottom: 0, right: 3)
//               
//    }
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
