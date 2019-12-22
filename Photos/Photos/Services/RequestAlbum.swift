//
//  RequestAlbum.swift
//  Photos
//
//  Created by alejandro david perez morales on 12/22/19.
//  Copyright © 2019 alejandro david perez morales. All rights reserved.
//

import UIKit

class RequestAlbum: RequestBase {

//  override var blockSuccess : (([Album]?)->Void)!
  //var blockError : (()->Void)!
  
  // MARK: protocol
  override func parse(data: Any!) {
    let datos = data as! Array<[String:Any]>
    var newDatos:[Album] = [Album]()
    for dato in datos {
      let newAlbum = Album(dictionary: dato)
      newDatos.append(newAlbum)
    }
    
    if self.blockSuccess != nil {
      self.blockSuccess(newDatos as Any)
    }
  }
  
  override func parseDataError(data: Any!) {
    
  }
  
  override func parseCallError(error: Error!) {
    
  }
  
  
}
