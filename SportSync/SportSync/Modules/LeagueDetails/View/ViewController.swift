import UIKit
import Alamofire
import Foundation

enum Section: Int {
    case upcomingEvents
    case latestResults
    case teams
}

class ViewController: UIViewController{
    @IBOutlet weak var favouriteButton: UIButton!
    @IBOutlet weak var upComingEventsCollectionView: UICollectionView!
    var leagesDetailsViewModel: LeagesDetailsViewModel!
    
    var isFilledButton:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.upComingEventsCollectionView.allowsSelection = true
        isFilledButton = leagesDetailsViewModel.searchForAnItem()
        checkFilledButton()
        
        upComingEventsCollectionView.delegate = self
        upComingEventsCollectionView.dataSource = self
        
        
        let nibHeader = UINib(nibName: Constants.sectionHeaderCell, bundle: nil)
        upComingEventsCollectionView.register(nibHeader, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.sectionHeaderCell)
      
        let nibCellUpComing = UINib(nibName: Constants.upComingEventCellId, bundle: nil)
        upComingEventsCollectionView.register(nibCellUpComing, forCellWithReuseIdentifier: Constants.upComingEventCellId)
        
        
        
        let nibCellLatestResults = UINib(nibName: Constants.latestResultCellId, bundle: nil)
        upComingEventsCollectionView.register(nibCellLatestResults, forCellWithReuseIdentifier: Constants.latestResultCellId)
       
        let nibCellTeams = UINib(nibName: Constants.teamsCollectionViewCell, bundle: nil)
        upComingEventsCollectionView.register(nibCellTeams, forCellWithReuseIdentifier: Constants.teamsCollectionViewCell)
       
        
        upComingEventsCollectionView.collectionViewLayout = createLayout()
        Utility.startLoader(in: self.view)
        fetchLeagueEvents()
        fetchLatestEvents()
        fetchLeagueTeams()
        upComingEventsCollectionView.reloadData()
    }
    
    func checkFilledButton(){
        

        if isFilledButton == true{
            favouriteButton.setImage(UIImage(systemName:"bookmark.fill"), for: .normal)
        }else{
            favouriteButton.setImage(UIImage(systemName:"bookmark"), for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    private func createHorizontalLayout(forSection sectionIndex: Int) -> NSCollectionLayoutSection {
        let itemSizeHorizontal = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.9), heightDimension: .fractionalHeight(1))
        let itemHorizontal = NSCollectionLayoutItem(layoutSize: itemSizeHorizontal)
        
        let groupHeight: CGFloat = (sectionIndex == 0) ? 380 : 200 
        let groupWidth: CGFloat = (sectionIndex == 0) ? 250 : 200
        let groupSizeHorizontal = NSCollectionLayoutSize(widthDimension: .absolute(groupHeight), heightDimension: .absolute(groupWidth))
        let groupHorizontal = NSCollectionLayoutGroup.horizontal(layoutSize: groupSizeHorizontal, subitems: [itemHorizontal])
        
        let sectionHorizontal = NSCollectionLayoutSection(group: groupHorizontal)
        sectionHorizontal.orthogonalScrollingBehavior = .continuous
      
          let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
          let headerSupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
         
          headerSupplementaryItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
          headerSupplementaryItem.pinToVisibleBounds = true
          
          sectionHorizontal.boundarySupplementaryItems = [headerSupplementaryItem]
        sectionHorizontal.visibleItemsInvalidationHandler = { (items, offset, environment) in
            items.filter { $0.representedElementKind != UICollectionView.elementKindSectionHeader }.forEach { item in
                let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
                let minScale: CGFloat = 0.8
                let maxScale: CGFloat = 1.0
                let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
                item.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        return sectionHorizontal
    }
    
    private func createVerticalLayout() -> NSCollectionLayoutSection {
        let itemSizeVertical = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.9))
        let itemVertical = NSCollectionLayoutItem(layoutSize: itemSizeVertical)
        
        let groupSizeVertical = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(100))
        let groupVertical = NSCollectionLayoutGroup.vertical(layoutSize: groupSizeVertical, subitems: [itemVertical])
        
        let sectionVertical = NSCollectionLayoutSection(group: groupVertical)
        sectionVertical.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
      
    
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20))
        let headerSupplementaryItem = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
       
        headerSupplementaryItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        headerSupplementaryItem.pinToVisibleBounds = true
        
        sectionVertical.boundarySupplementaryItems = [headerSupplementaryItem]
        return sectionVertical
    }
   
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            
            guard let section = Section(rawValue: sectionIndex) else { return nil }
            
            switch section {
            case .upcomingEvents:
                return self.createHorizontalLayout(forSection: sectionIndex)
            case .latestResults:
                return self.createVerticalLayout()
            case .teams:
                return self.createHorizontalLayout(forSection: sectionIndex)
            }
        }
        
        return layout
    }
    
    func fetchLeagueEvents() {
        leagesDetailsViewModel.fetchUpComingEvents { events in
            if let events = events {
                self.upComingEventsCollectionView.reloadData()
            } else {
                print("Failed to fetch league events")
            }
        }
    }
    
    func fetchLatestEvents() {
        leagesDetailsViewModel.fetchLatestEvents { events in
            if let events = events {
             //   print(events)
                self.upComingEventsCollectionView.reloadData()
            } else {
                print("Failed to fetch latest events")
            }
        }
    } 
    func fetchLeagueTeams() {
        leagesDetailsViewModel.fetchLeagueTeams { teams in
            if let teams = teams {
                Utility.stopLoadingAnimation(in: self.view)
                self.upComingEventsCollectionView.reloadData()
            } else {
                print("Failed to fetch latest events")
            }
        }
    }
    
    @IBAction func onBackPressed(_ sender: Any) {
        
        self.dismiss(animated: true)
    }
    
    @IBAction func favouritePressed(_ sender: Any) {
        if isFilledButton == false{
            isFilledButton = true
            checkFilledButton()
            leagesDetailsViewModel.addItem(newItem: LeagueDetails(id: "\(leagesDetailsViewModel.id ?? 0)", title: leagesDetailsViewModel.leageName ?? "nilName", logo: leagesDetailsViewModel.leageLogo ?? "logo", country: "test"))
            print("donePressed")
        }else {
            let alert = UIAlertController(title: "Alert", message: "Are you sure to delete From Favourite", preferredStyle: .actionSheet)
            let negativeAction = UIAlertAction(title: "Yes", style: .destructive) { UIAlertAction in
                self.isFilledButton = false
                self.checkFilledButton()
                self.leagesDetailsViewModel.deleteItemWithId()
            }
            let positiveAction = UIAlertAction(title: "No", style: .cancel) { UIAlertAction in
                alert.dismiss(animated: true)
                
             }
            alert.addAction(positiveAction)
            alert.addAction(negativeAction)
            self.present(alert, animated: true)
        }
        
        
        
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let sectionEnum = Section(rawValue: section) else { return 0 }
        
        switch sectionEnum {
        case .upcomingEvents:
            return leagesDetailsViewModel?.getLeagesEvents().count ?? 0
        case .latestResults:
            return leagesDetailsViewModel?.getLatestEvents().count ?? 0
        case .teams:
            return leagesDetailsViewModel?.getLeagueTeams().count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        
        guard let section = Section(rawValue: indexPath.section) else { fatalError("Invalid section") }
        
        switch section {
        case .upcomingEvents:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.upComingEventCellId, for: indexPath) as! UpComingEventsCollectionViewCell
            
            if let latestEvents = leagesDetailsViewModel?.getLeagesEvents(), indexPath.row < latestEvents.count {
                let event = latestEvents[indexPath.row]
                if let upComingCell = cell as? UpComingEventsCollectionViewCell {
                    upComingCell.dateLabel.text = event.event_date
                    upComingCell.timeLabel.text = event.event_time
                    upComingCell.leagueNameLabel.text = leagesDetailsViewModel.leageName ?? "League"
                    upComingCell.leagueLogoImageView.kf.setImage(with: URL(string: event.league_logo ?? ""), placeholder: UIImage(named: "league"))
                    upComingCell.leagueNameLabel.text = event.event_status
                    upComingCell.homeTeamNameLabel.text = event.event_home_team
                    upComingCell.awayTeamNameLebel.text = event.event_away_team
                    upComingCell.dateLabel.text = event.event_date
                    upComingCell.homeImageView.kf.setImage(with: URL(string: event.home_team_logo ?? ""), placeholder: UIImage(named: "league"))
                    upComingCell.awayImageView.kf.setImage(with: URL(string: event.away_team_logo ?? ""), placeholder: UIImage(named: "league"))
                    
                }
            }
        case .latestResults:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.latestResultCellId, for: indexPath) as! LatestResultsCollectionViewCell
            if let latestResult = leagesDetailsViewModel?.getLatestEvents(), indexPath.row < latestResult.count {
                let event = latestResult[indexPath.row]
    
                if let latestCell = cell as? LatestResultsCollectionViewCell {
                    latestCell.scoreLabel.text = event.event_final_result
                    latestCell.awayTeamNameLabel.text = event.event_away_team
                    latestCell.homeTeamNameLabel.text = event.event_home_team
                    latestCell.homeLogoImageView.kf.setImage(with: URL(string: event.home_team_logo ?? ""), placeholder: UIImage(named: "league"))
                    latestCell.awayLogoImageView.kf.setImage(with: URL(string: event.away_team_logo ?? ""), placeholder: UIImage(named: "league"))
                }
            }
        case .teams:
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.teamsCollectionViewCell, for: indexPath) as! TeamsCollectionViewCell
            if let teams = leagesDetailsViewModel?.getLeagueTeams(), indexPath.row < teams.count {
                let team = teams[indexPath.row]
                if let teamCell = cell as? TeamsCollectionViewCell {
                    teamCell.teamNameLabel.text = team.team_name
                    teamCell.teamLogoImageView.kf.setImage(with: URL(string: team.team_logo ?? ""), placeholder: UIImage(named: "league"))
                }
            }
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            guard kind == UICollectionView.elementKindSectionHeader else {
                fatalError("Invalid supplementary view type")
            }

        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.sectionHeaderCell, for: indexPath) as! SectionHeaderCell
            if let section = Section(rawValue: indexPath.section) {
                switch section {
                case .upcomingEvents:
                    headerView.title.text = "Upcoming Events"
                case .latestResults:
                    headerView.title.text = "Latest Results"
                case .teams:
                    headerView.title.text = "League Teams"
                }
            }
            return headerView
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 2 {
            let teamViewController = self.storyboard?.instantiateViewController(withIdentifier: "teadDetails") as! TeamDetailsViewController
            
            let teamViewModel = TeamViewModel(id: leagesDetailsViewModel.id!, sport: leagesDetailsViewModel.sport!,leagueName: leagesDetailsViewModel.leageName!)
            teamViewModel.teamsData = leagesDetailsViewModel.getLeagueTeams()
            teamViewModel.teamDetails = leagesDetailsViewModel.getLeagueTeams()[indexPath.row]
            
            teamViewController.teamViewModel = teamViewModel
            
            teamViewController.modalPresentationStyle = .fullScreen
            print(leagesDetailsViewModel.getLeagueTeams())
            self.present(teamViewController, animated: true, completion: nil)
            print("Row selected")
        }
    }

}
