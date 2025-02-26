//
//  TeamsViewController.swift
//  Assignment2 - Freight Frenzy
//
//  Created by 배기태 on 2021/11/04.
//

import UIKit

class TeamsViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureCollectionView()
    }
    
    func configureCollectionView() {
        collectionView!.dataSource = self
        collectionView!.delegate = self
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataManager.shared.teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TeamCell", for: indexPath) as! TeamCell
        cell.TeamImage.image = DataManager.shared.teams[indexPath.row].image
        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPaths = collectionView.indexPathsForSelectedItems! as NSArray
        let indexPath = indexPaths[0] as! IndexPath
        let vc = segue.destination as! TeamViewController
        vc.team = indexPath.row
    }
    
}
