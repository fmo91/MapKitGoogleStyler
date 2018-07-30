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
    public static func buildOverlay(with jsonArray: [[String: Any]], and langCode: String? = nil) -> MKTileOverlay {
        var mapStyle = MapStyle(json: jsonArray)
        if let langCodeSet = langCode {
            mapStyle.langCode = langCodeSet   
        }
        let overlay = MKTileOverlay(urlTemplate: mapStyle.urlString)
        overlay.canReplaceMapContent = true
        return overlay
    }
     
    public static func buildOverlay(with jsonFileURL: URL, and langCode: String? = nil) throws -> MKTileOverlay {
        let data = try Data(contentsOf: jsonFileURL)
        let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        if let array = object as? [[String: Any]] {
            return MapKitGoogleStyler.buildOverlay(with: array, and: langCode)
        } else {
            throw MapKitGoogleStylerError.invalidJSONFormat
        }
    }
}
