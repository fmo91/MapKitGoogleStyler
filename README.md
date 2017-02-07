# MapKitGoogleStyler

[![CI Status](http://img.shields.io/travis/fmo91/MapKitGoogleStyler.svg?style=flat)](https://travis-ci.org/fmo91/MapKitGoogleStyler)
[![Version](https://img.shields.io/cocoapods/v/MapKitGoogleStyler.svg?style=flat)](http://cocoapods.org/pods/MapKitGoogleStyler)
[![License](https://img.shields.io/cocoapods/l/MapKitGoogleStyler.svg?style=flat)](http://cocoapods.org/pods/MapKitGoogleStyler)
[![Platform](https://img.shields.io/cocoapods/p/MapKitGoogleStyler.svg?style=flat)](http://cocoapods.org/pods/MapKitGoogleStyler)

## Introduction

MapKitGoogleStyler allows you to include Google Maps JSON styles, that you can create [here](https://mapstyle.withgoogle.com/), and customize your MKMapView to look just like you want (or your client). Including this library is very very easy.

A post explaining this in detail can be found here: https://medium.com/@ortizfernandomartin/customize-mapkits-mkmapview-with-google-maps-styling-wizard-a5dcc095e19f#.ss3dencgh

## Example

Using this can't be simpler. The code is self explanatory

```swift
//
//  ViewController.swift
//  MapKitGoogleStylerExample
//
//  Created by Fernando Ortiz on 2/6/17.
//  Copyright © 2017 Fernando Martín Ortiz. All rights reserved.
//
import UIKit
import MapKit
import MapKitGoogleStyler

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        configureTileOverlay()
    }
    
    private func configureTileOverlay() {
        // We first need to have the path of the overlay configuration JSON
        guard let overlayFileURLString = Bundle.main.path(forResource: "overlay", ofType: "json") else {
                return
        }
        let overlayFileURL = URL(fileURLWithPath: overlayFileURLString)
        
        // After that, you can create the tile overlay using MapKitGoogleStyler
        guard let tileOverlay = try? MapKitGoogleStyler.buildOverlay(with: overlayFileURL) else {
            return
        }
        
        // And finally add it to your MKMapView
        mapView.add(tileOverlay)
    }
    
}

extension ViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        // This is the final step. This code can be copied and pasted into your project
        // without thinking on it so much. It simply instantiates a MKTileOverlayRenderer
        // for displaying the tile overlay.
        if let tileOverlay = overlay as? MKTileOverlay {
            return MKTileOverlayRenderer(tileOverlay: tileOverlay)
        } else {
            return MKTileOverlayRenderer(overlay: overlay)
        }
    }
}
```

## Requirements

## Installation

MapKitGoogleStyler is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "MapKitGoogleStyler"
```

## Author

fmo91, ortizfernandomartin@gmail.com

## License

MapKitGoogleStyler is available under the MIT license. See the LICENSE file for more info.
