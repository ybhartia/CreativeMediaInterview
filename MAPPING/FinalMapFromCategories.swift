//
//  FinalMapFromCategories.swift
//  MAPPING
//
//  Created by yash bhartia on 3/8/17.
//  Copyright © 2017 CreativeMedia. All rights reserved.
//

import UIKit
import SwiftyJSON
import GoogleMaps

class FinalMapFromCategories: UIViewController {

    var long = Double()
    var lat = Double()
    var Snippet = ""
    var Tittle = ""
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = Tittle
        marker.snippet = Snippet
        marker.map = mapView
        
    }
    @IBAction func Directions(_ sender: Any)
    {
        var urlString = "http://maps.google.com/maps?"
        //urlString += "saddr=25,55"
        urlString += "daddr="
        urlString += String(lat)
        urlString += ","
        urlString += String(long)
        //print(urlString)
        let url = URL(string: urlString)!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

}
