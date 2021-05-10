//
//  Task2ViewController.swift
//  Lesson 11
//
//  Created by Виталий Крюков on 27.04.2021.
//

import UIKit

var count  = 0

class Task2ViewController: UIViewController {
    
    @IBOutlet weak var bottomm: view!
    
    
    @IBOutlet weak var GoogleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomm.delegate = self
    }

}
extension Task2ViewController: TapDelegate {
    func viewPressed(_ vp: view) {
        count += 1
        GoogleLabel.text = "Google \(count)"
    }

}
