//
//  RequestPhoto.swift
//  Photos
//
//  Created by alejandro david perez morales on 12/23/19.
//  Copyright © 2019 alejandro david perez morales. All rights reserved.
//

import UIKit

class RequestPhoto: RequestBase {
  // MARK: protocol
  override func parse(data: Any!) {
    let datos = data as! Array<[String:Any]>
    var newDatos:[Photo] = [Photo]()
    for dato in datos {
      let newAlbum = Photo(dictionary: dato)
      newDatos.append(newAlbum)
    }
    
    if self.blockSuccess != nil {
      self.blockSuccess(newDatos as Any)
    }
  }
}
