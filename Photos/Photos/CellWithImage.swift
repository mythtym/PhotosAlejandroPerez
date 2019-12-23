//
//  CellWithImage.swift
//  Photos
//
//  Created by alejandro david perez morales on 12/23/19.
//  Copyright © 2019 alejandro david perez morales. All rights reserved.
//

import UIKit
import AFNetworking

class CellWithImage: UICollectionViewCell {

  @IBOutlet weak var image: UIImageView!
  
  var urlImage:String = ""
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//    print("algo")
    }
  
  func setImage(urlThum:String){
    self.urlImage = urlThum
    self.image.setImageWith( URL(string: urlThum)! )
  }

}
