//
//  Album.swift
//  Photos
//
//  Created by alejandro david perez morales on 12/22/19.
//  Copyright © 2019 alejandro david perez morales. All rights reserved.
//

import UIKit

class Album: NSObject {
  var userId:NSInteger = 0
  var id:NSInteger = 0
  var title:String = ""
  
  init(dictionary:[String:Any]) {
    self.title = dictionary["title"] as! String
    self.userId = dictionary["userId"] as! NSInteger
    self.id = dictionary["id"] as! NSInteger
  }
}
