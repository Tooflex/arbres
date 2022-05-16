//
//  ArbreDB.swift
//  Arbres One Point
//
//  Created by Otourou Da Costa on 16/01/2022.
//

import Foundation
import RealmSwift

class ArbreDB: Object, Identifiable {
    // swiftlint:disable identifier_name
    @objc dynamic var id = "0"
    /// Name of the tree
    @objc dynamic var name = ""
    /// Specie of the tree
    @objc dynamic var specie = ""
    /// Height in meters
    @objc dynamic var height = 0
    /// Circumference in centimeters
    @objc dynamic var circumference = 0
    /// Location of the tree
    @objc dynamic var address = ""
    /// Coordinates of the tree
    var geoPoint2d: List<Double> = List()

    override static func primaryKey() -> String {
        "id"
    }

}
