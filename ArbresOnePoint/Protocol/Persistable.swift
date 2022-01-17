//
//  Persistable.swift
//  Arbres One Point
//
//  Created by Otourou Da Costa on 16/01/2022.
//

import Foundation
import RealmSwift

public protocol Persistable {
    associatedtype ManagedObject: RealmSwift.Object
    func managedObject() -> ManagedObject
}
