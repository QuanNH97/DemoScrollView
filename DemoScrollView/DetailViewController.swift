//
//  DetailViewController.swift
//  DemoScrollView
//
//  Created by Quan Nguyen on 8/18/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var nameDetail: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 150, y: 250, width: 200, height: 50))
        label.text = nameDetail
        label.font = label.font.withSize(30)
        view.addSubview(label)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
