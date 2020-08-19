//
//  AddViewController.swift
//  DemoScrollView
//
//  Created by Quan Nguyen on 8/19/20.
//  Copyright © 2020 quannh. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBAction func saveButton(_ sender: UIBarButtonItem) {
    }
    
    @IBOutlet weak var nameField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        guard let newName = nameField.text else { return }
        guard !newName.isEmpty else { return }
        vc.names.append(newName)
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
