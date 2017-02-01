//
//  MapKit+GoogleStyle.swift
//  Pods
//
//  Created by Fernando on 1/2/17.
//
//

import UIKit
import MapKit

public enum MapKitGoogleStylerError: Error {
    case invalidJSONFormat
}

private extension String {
    func encodeURIComponent() -> String? {
        var characterSet = NSMutableCharacterSet.alphanumeric()
        characterSet.addCharacters(in: "-_.!~*'()")
        return self.addingPercentEncoding(withAllowedCharacters: characterSet as CharacterSet)
    }
}

public extension MKMapView {
    open func customize(with jsonArray: [[String: Any]]) {
        let mapStyle = MapStyle(json: jsonArray)
        
        let overlay = MKTileOverlay(urlTemplate: mapStyle.urlString)
        overlay.canReplaceMapContent = true
        self.add(overlay)
    }
    
    open func customize(withJSONFileURL jsonFileURL: URL) throws {
        let data = try Data(contentsOf: jsonFileURL)
        let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        if let array = object as? [[String: Any]] {
            customize(with: array)
        } else {
            throw MapKitGoogleStylerError.invalidJSONFormat
        }
    }
}
