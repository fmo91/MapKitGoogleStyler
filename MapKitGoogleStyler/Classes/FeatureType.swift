//
//  FeatureType.swift
//  Pods
//
//  Created by Fernando on 1/2/17.
//
//

import Foundation

enum FeatureType: String, StyleElement {
    case all = "all"
    case administrative = "administrative"
    case administrativeCountry = "administrative.country"
    case administrativeLandParcel = "administrative.land_parcel"
    case administrativeLocality = "administrative.locality"
    case administrativeNeighborhood = "administrative.neighborhood"
    case administrativeProvince = "administrative.province"
    case landscape = "landscape"
    case landscapeManMade = "landscape.man_made"
    case landscapeNatural = "landscape.natural"
    case poi = "poi"
    case poiAttraction = "poi.attraction"
    case poiBusiness = "poi.business"
    case poiGovernment = "poi.government"
    case poiMedical = "poi.medical"
    case poiPark = "poi.park"
    case poiPlaceOfWorship = "poi.place_of_worship"
    case poiSchool = "poi.school"
    case poiSportsComplex = "poi.sports_complex"
    case road = "road"
    case roadArterial = "road.arterial"
    case roadHighway = "road.highway"
    case roadLocal = "road.local"
    case transit = "transit"
    case transitLine = "transit.line"
    case transitStation = "transit.station"
    case water = "water"
    
    var convertedValue: String {
        switch self {
        case .all                           : return "0"
        case .administrative                : return "1"
        case .administrativeCountry         : return "17"
        case .administrativeLandParcel      : return "21"
        case .administrativeLocality        : return "19"
        case .administrativeNeighborhood    : return "20"
        case .administrativeProvince        : return "18"
        case .landscape                     : return "5"
        case .landscapeManMade              : return "81"
        case .landscapeNatural              : return "82"
        case .poi                           : return "2"
        case .poiAttraction                 : return "37"
        case .poiBusiness                   : return "33"
        case .poiGovernment                 : return "34"
        case .poiMedical                    : return "36"
        case .poiPark                       : return "40"
        case .poiPlaceOfWorship             : return "38"
        case .poiSchool                     : return "35"
        case .poiSportsComplex              : return "39"
        case .road                          : return "3"
        case .roadArterial                  : return "50"
        case .roadHighway                   : return "49"
        case .roadLocal                     : return "51"
        case .transit                       : return "4"
        case .transitLine                   : return "65"
        case .transitStation                : return "66"
        case .water                         : return "6"
        }
    }
}
