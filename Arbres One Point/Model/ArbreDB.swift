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
    @objc dynamic var name = ""
    @objc dynamic var specie = ""
    @objc dynamic var height = 0
    @objc dynamic var circumference = 0
    @objc dynamic var address = ""

    override static func primaryKey() -> String {
        "id"
    }

}
