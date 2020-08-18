//
//  ViewController.swift
//  DemoScrollView
//
//  Created by Quan Nguyen on 8/18/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var simpleCollectionView: UICollectionView!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.cellLabel.text = names[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.nameDetail = names[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    var names: [String] = ["Quân", "Trung", "Luận", "Minh", "Long", "Dũng"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        simpleCollectionView.delegate = self
        simpleCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }


}

