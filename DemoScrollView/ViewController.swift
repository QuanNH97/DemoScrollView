//
//  ViewController.swift
//  DemoScrollView
//
//  Created by Quan Nguyen on 8/18/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var names: [String] = ["Quân", "Trung", "Luận", "Minh", "Long", "Dũng"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = simpleTableView.dequeueReusableCell(withIdentifier: "names", for: indexPath) as! NamesTableViewCell
        cell.nameLabel.text = names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        let vc = DetailViewController()
        vc.nameDetail = names[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
        return indexPath
    }

    @IBOutlet weak var simpleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        simpleTableView.delegate = self
        simpleTableView.dataSource = self
    }


}

