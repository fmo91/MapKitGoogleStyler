//
//  ElementType.swift
//  Pods
//
//  Created by Fernando on 1/2/17.
//
//

import Foundation

enum ElementType: String, StyleElement {
    case all = "all"
    case geometry = "geometry"
    case geometryFill = "geometry.fill"
    case geometryStroke = "geometry.stroke"
    case labels = "labels"
    case labelsIcon = "labels.icon"
    case labelsText = "labels.text"
    case labelsTextFill = "labels.text.fill"
    case labelsTextStroke = "labels.text.stroke"
    
    var convertedValue: String {
        switch self {
        case .all: return "a"
        case .geometry: return "g"
        case .geometryFill: return "g.f"
        case .geometryStroke: return "g.s"
        case .labels: return "l"
        case .labelsIcon: return "l.i"
        case .labelsText: return "l.t"
        case .labelsTextFill: return "l.t.f"
        case .labelsTextStroke: return "l.t.s"
        }
    }
}
