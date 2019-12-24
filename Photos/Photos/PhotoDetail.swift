
//
//  PhotoDetail.swift
//  Photos
//
//  Created by alejandro david perez morales on 12/23/19.
//  Copyright © 2019 alejandro david perez morales. All rights reserved.
//

import UIKit
import AFNetworking

class PhotoDetail: UIViewController {
  
  var photoToShow:Photo?
  @IBOutlet weak var image: UIImageView!
  
    override func viewDidLoad() {
      super.viewDidLoad()
      if photoToShow == nil {
        return
      }
      self.image.setImageWith( URL(string: photoToShow!.url)! )
        // Do any additional setup after loading the view.
      self.navigationItem.title = photoToShow?.title
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
