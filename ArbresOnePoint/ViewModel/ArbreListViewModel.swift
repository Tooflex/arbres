//
//  ArbreListViewModel.swift
//  Arbres One Point
//
//  Created by Otourou Da Costa on 16/01/2022.
//

import SwiftUI

final class ArbreListViewModel: ObservableObject {

    private let dataRepository = DataRepository.sharedInstance

    @Published private var arbresResults: [ArbreDB] = []
    @Published var filteredArbresResults: [ArbreDB] = []
    @Published var isLoading = false

    init() {
        getArbres()
        fetchArbresOnline()
    }

    func onAppear() {
        getArbres()
    }

    func getArbres() {
        self.arbresResults =  Array(dataRepository.fetchLocalData(type: ArbreDB.self))
        self.filteredArbresResults = self.arbresResults
    }

    func fetchArbresOnline(start: Int = 0) {
        isLoading = true

        dataRepository.fetchArbres(start: start) { response in

            switch response.result {
            case .success(_):
                self.getArbres()
            case .failure(let error):
                print(error.localizedDescription)
            }
            self.isLoading = false
        }
    }
    
    func filteredArbres(
        searchText: String) {
            if searchText.isEmpty {
                    filteredArbresResults = arbresResults
                } else {
                    filteredArbresResults = arbresResults.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
                }
        }
}
