//
//  ViewController.swift
//  HDPlaygroundsDemo
//
//  Created by denglibing on 2023/7/12.
//

import UIKit

class ViewController: UIViewController {
    let checklistView = ChecklistView()
    var birds = [Bird]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for _ in 0..<20 {
            let random = arc4random() % 1000
            let brandom = random % 2 == 0
            let image = brandom ? UIImage(systemName: "ladybug") : nil
            let bird = Bird(commonName: "birdName_\(random)", scientificName: "scientificName_\(random)", speciesCode: "\(random)", photo: image, family: brandom ? .owls : .crow)
            birds.append(bird)
        }
        
        checklistView.frame = self.view.bounds
        checklistView.delegate = self
        checklistView.dataSource = self
        view.addSubview(checklistView)
    }

}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: "cell")
            cell?.accessoryType = .disclosureIndicator
        }
        let bird = birds[indexPath.row]
        cell?.textLabel?.text = bird.commonName
        cell?.imageView?.image = bird.photo
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


class ChecklistView: UITableView {
    var birdsToShow: [Bird] {
        let birdProvider = BirdProvider(region: .northAmerica)
        let birdsToFind = birdProvider.birds.filter { $0.photo == nil }
        let owlsToFind = birdsToFind.filter { $0.family == .owls }
        return owlsToFind
    }

}
