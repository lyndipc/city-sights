//
//  BusinessSearch.swift
//  City Sights
//
//  Created by Lyndi Castrejon on 5/4/22.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable {
    var center = Coordinate()
}
