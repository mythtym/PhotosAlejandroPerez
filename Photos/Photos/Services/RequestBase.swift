//
//  RequestBase.swift
//  Photos
//
//  Created by alejandro david perez morales on 12/22/19.
//  Copyright © 2019 alejandro david perez morales. All rights reserved.
//

import UIKit
import AFNetworking

let URLBASE = "https://jsonplaceholder.typicode.com/"


protocol RequestBaseProtocol {
  func parse(data:Any!) -> Void
  func parseDataError(data:Any!) -> Void
  func parseCallError( error: Error!) -> Void
}


class RequestBase: NSObject, RequestBaseProtocol {
 
  var urlStr = URLBASE
  
  var blockSuccess : ((Any)->Void)!
  var blockError : ((Any)->Void)!
  
  func changeURLBase( newURL:String) {
    self.urlStr = newURL
  }
  
  func requestGet( method:String  ) -> Void {
    
    let manager = AFHTTPSessionManager(baseURL: URL(string: urlStr) )
    
    manager.get(method, parameters: nil, progress: nil, success: {
      (task: URLSessionDataTask!, responseObject: Any!) in

      let response = task.response as! HTTPURLResponse
      if response.statusCode == 200 {
        self.parse(data: responseObject)
      } else {
        self.parseDataError(data: responseObject)
      }
      
     }, failure:  {
      (task: URLSessionDataTask!, error: Error!) in
      self.parseCallError(error: error)
//      print("error")
    })
  }
  
  // MARK: protocol
  func parse(data: Any!) {
    if self.blockSuccess != nil {
      self.blockSuccess(data)
    }
  }
  
  func parseDataError(data: Any!) {
    if self.blockError != nil {
      self.blockError(data)
    }
  }
  
  func parseCallError(error: Error!) {
    if self.blockError != nil {
      self.blockError(error as Any)
    }
  }
}
