//
//  LocationViewController.swift
//  LetsEat
//
//  Created by Victor on 7/23/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController  {
    
    
    @IBOutlet weak var tableView: UITableView!
      
    let manager  = locationDataManager()
    var selectedCity: LocationItem?
    
      override func viewDidLoad() {
          super.viewDidLoad()
        initialize()
          // Do any additional setup after loading the view.
      }
    
    func set(selected cell: UITableViewCell, at indexPath: IndexPath) {
        if let city = selectedCity?.city {
            let data = manager.findLoaction(by: city)
            if data.isFound {
                if indexPath.row == data.position {
                    cell.accessoryType = .checkmark // Setes галочку in cells
                }
                else {
                    cell.accessoryType = .none
                    
                }
            }
        }
        else {
            cell.accessoryType = .none
            
        }
    }
}

 
//MARK: Private Extension

private extension LocationViewController {
    
    func initialize() {
        manager.fetch()
    }
    
    //code goes here
}
//MARK: Extension UITableViewDatasource

extension LocationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           manager.numberOfItems()
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath) as UITableViewCell
           
        cell.textLabel?.text = manager.locationItem(at: indexPath).full
        set(selected: cell, at: indexPath)
           return cell
       }
}


//MARK: UITableViewDelegate

extension LocationViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            cell.accessoryType = .checkmark
            selectedCity = manager.locationItem(at: indexPath)
            tableView.reloadData()
        }
    }
    
    
}
