//
//  StylerType.swift
//  Pods
//
//  Created by Fernando on 1/2/17.
//
//

import Foundation

enum StylerType: String, StyleElement {
    case color = "color"
    case gamma = "gamma"
    case hue = "hue"
    case invertLightness = "invert_lightness"
    case lightness = "lightness"
    case saturation = "saturation"
    case visibility = "visibility"
    case weight = "weight"
    
    var convertedValue: String {
        switch self {
        case .color             : return "p.c"
        case .gamma             : return "p.g"
        case .hue               : return "p.h"
        case .invertLightness   : return "p.il"
        case .lightness         : return "p.l"
        case .saturation        : return "p.s"
        case .visibility        : return "p.v"
        case .weight            : return "p.w"
        }
    }
}
