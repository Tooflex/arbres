//
//  DataRepository.swift
//  Arbres One Point
//
//  Created by Otourou Da Costa on 15/01/2022.
//

import Foundation
import RealmSwift
import Alamofire

protocol DataRepositoryProtocol {
    func fetchArbres(completion: @escaping (DataResponse<ArbresResponse, AFError>) -> Void)
}

final class DataRepository: ObservableObject, DataRepositoryProtocol {

    private let apiService: ArbreApiServiceProtocol

    public static let sharedInstance = DataRepository()

    init(apiService: ArbreApiServiceProtocol = ArbreApiService()) {
        // swiftlint:disable force_try
        self.apiService = apiService
    }

    func fetchArbres(completion: @escaping (DataResponse<ArbresResponse, AFError>) -> Void) {
        apiService.fetchArbres { result in
            if let response = result.value {
                if let arbres = response.records {
                    self.addAll(arbresToAdd: arbres)
                }
            }
            completion(result)
        }
    }

    func add(arbresToAdd: Record) {

        objectWillChange.send()

        let container = try! Container()
        try! container.write { transaction in
            transaction.add(arbresToAdd)
        }
    }

    func addAll(arbresToAdd: [Record]) {
        for arbre in arbresToAdd {
            add(arbresToAdd: arbre)
        }
    }

    public final class WriteTransaction {
        private let realm: Realm
        internal init(realm: Realm) {
            self.realm = realm
        }
        public func add<T: Persistable>(_ value: T, update: Realm.UpdatePolicy = .modified) {
            realm.add(value.managedObject(), update: update)
        }
    }
    // Implement the Container
    public final class Container {
        private let realm: Realm
        public convenience init() throws {
            try self.init(realm: Realm())
        }
        internal init(realm: Realm) {
            self.realm = realm
        }
        public func write(_ block: (WriteTransaction) throws -> Void)
        throws {
            let transaction = WriteTransaction(realm: realm)
            try realm.write {
                try block(transaction)
            }
        }
    }

}
