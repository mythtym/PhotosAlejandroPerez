//
//  FirstViewController.swift
//  Photos
//
//  Created by alejandro david perez morales on 12/22/19.
//  Copyright © 2019 alejandro david perez morales. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  var albums = [Album]()
  
  let spinner = UIActivityIndicatorView.init(style: .gray)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
    
    self.loadSpinner()
    self.showSpinner(show: true)
    
    self.callAlbum()
  }
  
  func loadSpinner() {
    self.spinner.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(self.spinner)
    
    self.view.addConstraint(NSLayoutConstraint.init(item: self.spinner, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.0, constant: 0.0))
    self.view.addConstraint(NSLayoutConstraint.init(item: self.spinner, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0.0))
    self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[spiner(100)]", options: [], metrics: nil, views: ["spiner":self.spinner]))
    self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[spiner(100)]", options: [], metrics: nil, views: ["spiner":self.spinner]))
  }
  
  func showSpinner(show:Bool) -> Void {
    self.spinner.isHidden = !show
    if show {
      self.spinner.startAnimating()
    } else {
      self.spinner.stopAnimating()
    }
    self.tableView.isHidden = show
  }

  func callAlbum(){
    let request:RequestAlbum = RequestAlbum()
    
    request.blockSuccess = { (data:Any) in
      self.showSpinner(show: false)
      self.albums.removeAll()
      let albumsTmp = data as! [Album]
      for album in albumsTmp {
        self.albums.append(album)
      }
      self.tableView.reloadData()
    }
    
    request.requestGet(method: "albums")
    
    
  }
  
  //MARK: table view delegate
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.albums.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell:UITableViewCell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "cell")
    
    let albumToShow:Album = self.albums[indexPath.row]
    cell.textLabel?.text  = albumToShow.title
    
    return cell
  }

}

