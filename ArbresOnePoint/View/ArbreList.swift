//
//  ContentView.swift
//  Arbres One Point
//
//  Created by Otourou Da Costa on 11/01/2022.
//

import SwiftUI

struct ArbreList: View {

    @EnvironmentObject var arbreListViewModel: ArbreListViewModel
    
    @State private var searchText = ""
    @State private var currentStartingPoint: Int = 0

    var body: some View {
        NavigationView {
            if arbreListViewModel.isLoading {
                ProgressView().progressViewStyle(CircularProgressViewStyle())
            } else {
                List(arbreListViewModel.filteredArbresResults, id: \.id) { arbre in
                    NavigationLink(destination: ArbreDetailView(arbre: arbre)) {
                        Text(arbre.name)
                    }
                }
                .id(UUID())
                .searchable(text: $searchText, prompt: "Rechercher un arbre")
                .disableAutocorrection(true)
                .onChange(of: searchText) { newValue in
                    arbreListViewModel.filteredArbres(searchText: searchText)
                }
                .navigationTitle("Arbres")
                .onAppear {
                    arbreListViewModel.onAppear()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ArbreList()
    }
}
