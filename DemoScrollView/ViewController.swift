//
//  ViewController.swift
//  DemoScrollView
//
//  Created by Quan Nguyen on 8/18/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var simpleCollectionView: UICollectionView!
    
    var data: [String:[String]] = ["liquid":["twistzz","elige","nitro","naf","stewie2k"], "navi":["simple","electronic","zeus","guardian"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        simpleCollectionView.delegate = self
        simpleCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let detailVC = storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
            let keyArr = Array(data.keys)
            let key = keyArr[indexPath.section]
            guard let nameArr = data[key] else { return }
            detailVC.nameDetail = nameArr[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
        }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let keyArr = Array(data.keys)
        let key = keyArr[section]
        guard let count = data[key]?.count else { return 0 }
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        let keyArr = Array(data.keys)
        let key = keyArr[indexPath.section]
        guard let nameArr = data[key] else { return UICollectionViewCell() }
        cell.cellLabel.text = nameArr[indexPath.row]
        let image = UIImage(named: nameArr[indexPath.row] + ".png")
        cell.cellImage.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as! SectionHeaderView
            let keyArr = Array(data.keys)
            sectionHeader.headerLabel.text = keyArr[indexPath.section]
            let image = UIImage(named: keyArr[indexPath.section] + ".png")
            sectionHeader.headerImage.image = image
            return sectionHeader
        case UICollectionView.elementKindSectionFooter:
            let sectionFooter = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionFooter", for: indexPath) as! SectionHeaderView
            return sectionFooter
        default:
            return UICollectionReusableView()
        }
    }
    
}
