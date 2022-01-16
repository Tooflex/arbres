//
//  ArbreApiService.swift
//  Arbres One Point
//
//  Created by Otourou Da Costa on 15/01/2022.
//

import Foundation
import Alamofire
import Combine

protocol ArbreApiServiceProtocol {

    func fetchArbres(completion: @escaping (DataResponse<ArbresResponse, AFError>) -> Void)
}

final class ArbreApiService: ArbreApiServiceProtocol {

    private let manager: Session
    init(manager: Session = Session.default) {
        self.manager = manager
        manager.sessionConfiguration.timeoutIntervalForRequest = 30
        manager.sessionConfiguration.timeoutIntervalForResource = 30
    }

    private let apiEndpoint = API.baseURL

    var tokens: Set<AnyCancellable> = []

    func fetchArbres(completion: @escaping (DataResponse<ArbresResponse, AFError>) -> Void) {

        guard let url = URL(string: "api/records/1.0/search/?dataset=les-arbres", relativeTo: API.baseURL) else {
            print("Error: cannot create URL")
            return
        }

        manager.request(url)
            .validate()
            .publishDecodable(type: ArbresResponse.self, decoder: newJSONDecoder())
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    ()
                case .failure(let error):
                    print(error)
                }
            }, receiveValue: { (response) in
                completion(response)
            }).store(in: &tokens)
    }
}
