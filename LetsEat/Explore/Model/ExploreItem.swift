//
//  ExploreItem.swift
//  LetsEat
//
//  Created by Victor on 7/22/20.
//  Copyright © 2020 Victor. All rights reserved.
//

import Foundation


struct ExploreItem {
    
    var name : String
    var image : String

    
}

extension ExploreItem {
    init(dict:[String:AnyObject]){
        self.name = dict["name"] as! String
        self.image = dict["image"] as! String
    }
}
