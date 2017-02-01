//
//  ViewController.swift
//  MapKitGoogleStyler
//
//  Created by fmo91 on 02/01/2017.
//  Copyright (c) 2017 fmo91. All rights reserved.
//

import UIKit
import MapKit
import MapKitGoogleStyler

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let jsonURL = Bundle.main.url(forResource: "MapStyle", withExtension: "json") else {
            print("Invalid json url")
            return
        }
        
        do {
            try mapView.customize(withJSONFileURL: jsonURL)
        } catch let error {
            print("Error! \(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

