//
//  ViewController.swift
//  DemoScrollView
//
//  Created by Quan Nguyen on 8/18/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var names: [String] = ["A long label name", "Trung", "Luận", "Minh", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng", "Trung", "Luận", "", "Long", "Dũng"]
    
    @IBOutlet weak var simpleTableView: UITableView!
    @IBAction func unwindToRoot(_ sender: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        simpleTableView.delegate = self
        simpleTableView.dataSource = self
        tableViewSetup()
//        duplicateData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        simpleTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! DetailViewController
        vc.nameDetail = names[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit
        editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath:
     IndexPath) {
        if editingStyle == .delete {
            names.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: . automatic)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = simpleTableView.dequeueReusableCell(withIdentifier: "names", for: indexPath) as! NamesTableViewCell
        let newName = names[indexPath.row]
        cell.configCell(name: newName)
//        cell.showsReorderControl = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
   
}

extension ViewController {
    func tableViewSetup() {
        simpleTableView.estimatedRowHeight = 60.0
        simpleTableView.rowHeight = UITableView.automaticDimension
        
        // Registering the cell programmatically
//        simpleTableView.register(UITableViewCell.self, forCellReuseIdentifier: "names")
    }
//    func duplicateData() {
//        for _ in 1...50 {
//            names.append("twitzz")
//        }
//    }
}
