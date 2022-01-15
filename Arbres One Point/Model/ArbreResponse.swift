//
//  ArbreResponse.swift
//  Arbres One Point
//
//  Created by Otourou Da Costa on 15/01/2022.
//

import Foundation

struct ArbreResponse {
    let nHits: Int
    let parameters: Parameters
    let records: [Record]
    let facetGroups: [FacetGroup]
}
