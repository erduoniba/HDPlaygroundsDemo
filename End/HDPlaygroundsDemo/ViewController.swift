//
//  ViewController.swift
//  HDPlaygroundsDemo
//
//  Created by denglibing on 2023/7/12.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let checklistView = HDChecklistView()
//        let checklistView = ChecklistView()
        checklistView.viewController = self
        checklistView.frame = self.view.bounds
        view.addSubview(checklistView)
    }
}
