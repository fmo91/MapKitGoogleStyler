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

public struct MapKitGoogleStyler {
    public static func buildOverlay(with jsonArray: [[String: Any]]) -> MKTileOverlay {
        let mapStyle = MapStyle(json: jsonArray)
        let overlay = MKTileOverlay(urlTemplate: mapStyle.urlString)
        overlay.canReplaceMapContent = true
        return overlay
    }
     
    public static func buildOverlay(with jsonFileURL: URL) throws -> MKTileOverlay {
        let data = try Data(contentsOf: jsonFileURL)
        let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        if let array = object as? [[String: Any]] {
            return MapKitGoogleStyler.buildOverlay(with: array)
        } else {
            throw MapKitGoogleStylerError.invalidJSONFormat
        }
    }
}
