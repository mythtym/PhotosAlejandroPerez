//
//  Photo.swift
//  Photos
//
//  Created by alejandro david perez morales on 12/23/19.
//  Copyright © 2019 alejandro david perez morales. All rights reserved.
//

import UIKit

class Photo: NSObject {
  var albumId:NSInteger = 0
  var id:NSInteger = 0
  var title:String = ""
  var url:String = ""
  var thumbnailUrl:String = ""
  
  init(dictionary:[String:Any]) {
    self.albumId = dictionary["albumId"] as! NSInteger
    self.id = dictionary["id"] as! NSInteger
    self.title = dictionary["title"] as! String
    self.url = dictionary["url"] as! String
    self.thumbnailUrl = dictionary["thumbnailUrl"] as! String
  }
  
}
