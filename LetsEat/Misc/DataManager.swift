//
//  DataManager.swift
//  LetsEat
//
//  Created by Victor on 7/24/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation


protocol DataManager  {
    
    func load(file name: String) -> [[String : AnyObject]]
}

extension DataManager {
    
    
  func load(file name: String) -> [[String:AnyObject]] {
           guard let path = Bundle.main.path(forResource: name, ofType: "plist"), let items = NSArray(contentsOfFile: path) else {
               return [[:]]
           }
           return items as! [[String:AnyObject]]
       } // This function(of extension)  returns plist files  for every data Manager
}
