//
//  GoogleStyle.swift
//  Pods
//
//  Created by Fernando on 1/2/17.
//
//

import Foundation

public struct GoogleStyle {
    
    var featureType: FeatureType?
    var elementType: ElementType?
    var stylers: [[String:Any]]?
    
    public init(json: [String:Any]) {
        if let featureTypeString = json["featureType"] as? String {
            if let featureType = FeatureType(rawValue: featureTypeString) {
                self.featureType = featureType
            } else {
                print("Unsupported feature type: \(featureTypeString)")
            }
        }
        if let elementTypeString = json["elementType"] as? String {
            if let elementType = ElementType(rawValue: elementTypeString) {
                self.elementType = elementType
            } else {
                print("Unsupported element type: \(elementTypeString)")
            }
        }
        if let stylers = json["stylers"] as? [[String:Any]] {
            self.stylers = stylers
        }
    }
    
    public var encodedStyles: String {
        var style = ""
        if let featureType = self.featureType {
            style.append("s.t:")
            style.append(featureType.convertedValue)
        } else {
            style.append("s.t:")
            style.append("undefined")
        }
        if let elementType = self.elementType {
            if style.last != "|" && style.last != "," {
                style.append("|")
            }
            style.append("s.e:")
            style.append(elementType.convertedValue)
        } 
        if let stylers = self.stylers {
            for styler in stylers {
                for (key, value) in styler {
                    if let stylerType = StylerType(rawValue: key) {
                        if style.last != "|" && style.last != "," {
                            style.append("|")
                        }
                        if key == "color" {
                            if let color = value as? String {
                                if color.count == 7 {
                                    style.append("\(stylerType.convertedValue):#ff\(color.replacingOccurrences(of: "#", with: ""))")
                                } else if color.count != 9 {
                                    print("Malformed color")
                                } else {
                                    style.append("\(stylerType.convertedValue):\(value)")
                                }
                            }
                        } else {
                            style.append("\(stylerType.convertedValue):\(value)")
                        }
                    } else {
                        print ("Unsupported styler type \(key)")
                    }
                }
            }
        }
        return style
    }
}
