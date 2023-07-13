//
//  ChecklistViewq.swift
//  HDPlaygroundsDemo
//
//  Created by denglibing on 2023/7/13.
//

import UIKit
import CoreLocation

class ChecklistView: UITableView {
    weak var viewController: ViewController?
    
    var birdsToShow: [Bird] {
        let birdProvider = BirdProvider(region: .northAmerica)
        let birdsToFind = birdProvider.birds.filter { $0.photo != nil }
        let owlsToFind = birdsToFind.filter { $0.family == .owls }
        return owlsToFind
    }
    
    var birds = [Bird]()
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        birds = birdsToShow
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func add(_ bird: Bird) {
        birds.append(bird)
        
        self.reloadData()
    }
}



extension ChecklistView: UITableViewDataSource {
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

extension ChecklistView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mapController = MapViewController()
        viewController?.navigationController?.pushViewController(mapController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
