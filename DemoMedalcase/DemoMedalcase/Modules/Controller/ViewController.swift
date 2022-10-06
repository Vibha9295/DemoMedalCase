//
//  ViewController.swift
//  DemoMedalcase

import UIKit

class ViewController: UIViewController {
    
    //MARK: - UICollectionView Outlet
    @IBOutlet weak var cvAchievements: UICollectionView!
    
    //MARK: - Variable Declaration
    let margin: CGFloat = 10
    let dataItems =
    [HeaderItem(title: "Personal Records", count: "4 of 6", symbols: [
        MedalDetails(name: "Longest Run",image: "longest_run", score: "00:00"),
        MedalDetails(name: "Highest Elevation",image: "highest_elevation", score: "2095 ft"),
        MedalDetails(name: "Fastest 5K",image: "fastest_5k", score: "00:00"),
        MedalDetails(name: "10K",image: "fastest_10k", score: "00:00:00"),
        MedalDetails(name: "Half Marathon",image: "fastest_half_marathon", score: "00:00"),
        MedalDetails(name: "Marathon",image: "fastest_marathon", score: "Not Yet"),
        
    ]),
     
     HeaderItem(title: "Virtual Races",count: "", symbols: [
        MedalDetails(name: "Virtual Half Marathon Race",image: "virtual_half_marathon_race", score: "00:00"),
        MedalDetails(name: "Tokyo-Hakone Ekiden 2020",image: "tokyo_kakone_ekiden", score: "00:00:00"),
        MedalDetails(name: "Virtual 10K Race",image: "virtual_10k_race", score: "00:00:00"),
        MedalDetails(name: "Hakone Ekiden",image: "hakone_ekiden", score: "00:00:00"),
        MedalDetails(name: "Mizuno Singapore Ekidone 2015",image: "mizuno_singapore_ekiden", score: "00:00:00"),
        MedalDetails(name: "Virtual 5K Race",image: "virtual_5k_race", score: "23:07"),
        
     ]),
    ]
    
    let flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        return layout
    }()
    
    //MARK: - ViewController Method
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
        
        // Do any additional setup after loading the view.
    }
    //MARK: - Initialization Method
    private func initialization() {
        guard let collectionView = cvAchievements, let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        
        self.cvAchievements.reloadData()
        
    }
    //MARK: - UIButton Action Method
    
    @IBAction func btnBackAct(_ sender: Any) {
    }
    
    @IBAction func btnMenuAct(_ sender: Any) {
    }
}


