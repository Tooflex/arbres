//
//  ContentView.swift
//  Arbres One Point
//
//  Created by Otourou Da Costa on 11/01/2022.
//

import SwiftUI

struct ContentView: View {

    @EnvironmentObject var arbreListViewModel: ArbreListViewModel

    var body: some View {
        NavigationView {
            List(arbreListViewModel.arbresResults, id: \.id) { arbre in
                NavigationLink(destination: ArbreDetailView(arbre: arbre)) {
                    Text(arbre.name)
                }
            }
            .navigationTitle("Arbres")
            .onAppear {
                arbreListViewModel.onAppear()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
