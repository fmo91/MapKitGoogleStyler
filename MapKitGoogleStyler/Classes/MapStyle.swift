//
//  MapStyle.swift
//  Pods
//
//  Created by Fernando on 1/2/17.
//
//

import Foundation

internal struct MapStyle {
    
    private let baseURL = "https://mts0.google.com/vt/lyrs=m@289000001&hl=en&src=app&x={x}&y={y}&z={z}&s=DGal"
    private let prefix = "&apistyle="
    
    internal var googleStyles = [GoogleStyle]()
    
    internal init(json: [[String: Any]]) {
        googleStyles = json.map (GoogleStyle.init)
    }
    
    internal var urlString: String {
        var url = ""
        if googleStyles.isEmpty == false {
            url += prefix
            for (index, style) in googleStyles.enumerated() {
                url += style.encodedStyles
                if index != googleStyles.count - 1 {
                    url += ","
                }
            }
        }
        url = url.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        
        url = url
            .replacingOccurrences(of: ":", with: "%3A")
            .replacingOccurrences(of: ",", with: "%2C")
        
        return "\(baseURL)\(url)"
    }
}
