//
//  AlbumDetail.swift
//  Photos
//
//  Created by alejandro david perez morales on 12/22/19.
//  Copyright © 2019 alejandro david perez morales. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CellWithImage"

@objc protocol LastImagesProtocol {
  func lastImage(image:String!) -> Void
}

class AlbumDetail: UICollectionViewController {
  
  var albumToShow:Album!

  var photos:[Photo] = [Photo]()
  
  weak var delegate:LastImagesProtocol?
  
  override func viewDidLoad() {

    super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
    self.collectionView.backgroundColor = .white
    
    self.collectionView!.register(UINib.init(nibName: "CellWithImage", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

    if self.albumToShow == nil {
      return
    }
    
    let request:RequestPhoto = RequestPhoto()
    request.blockSuccess =  { (data:Any) in
//      self.showSpinner(show: false)
      self.photos.removeAll()
      let photosTmp = data as! [Photo]
      for photo in photosTmp {
        self.photos.append(photo)
      }
      self.collectionView.reloadData()
      
      guard let urlLastImage:String = self.photos.last?.thumbnailUrl else {
        return
      }
      
      self.delegate?.lastImage(image: urlLastImage )
      
    }
    
    request.requestGet(method: "photos", parameter:["albumId":self.albumToShow.id])
        // Do any additional setup after loading the view.
  }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CellWithImage
    
        // Configure the cell
        let photoToShow = photos[indexPath.row]
        cell.setImage(urlThum: photoToShow.thumbnailUrl )

        return cell
    }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat
  {
    
    return 4;
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    // handle tap events
    let photoDetail:PhotoDetail = PhotoDetail(nibName: "PhotoDetail", bundle: nil)
    photoDetail.photoToShow = self.photos[indexPath.row]
    self.navigationController?.pushViewController(photoDetail, animated: true)
  }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
}
