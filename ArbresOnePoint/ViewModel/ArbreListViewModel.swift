//
//  ArbreListViewModel.swift
//  Arbres One Point
//
//  Created by Otourou Da Costa on 16/01/2022.
//

import Foundation

final class ArbreListViewModel: ObservableObject {

    private let dataRepository = DataRepository.sharedInstance

    @Published var arbresResults: [ArbreDB] = []
    @Published var isLoading = false

    init() {
        getArbres()
        fetchArbresOnline()
    }

    func onAppear() {
        getArbres()
    }

    func getArbres() {
        self.arbresResults = Array(dataRepository.fetchLocalData(type: ArbreDB.self))
    }

    func fetchArbresOnline() {
        isLoading = true

        dataRepository.fetchArbres { response in

            switch response.result {
            case .success(_):
                self.getArbres()
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.isLoading = false
        }
    }

}
