//
//  ArbreDetailView.swift
//  Arbres One Point
//
//  Created by Otourou Da Costa on 16/01/2022.
//

import SwiftUI

struct ArbreDetailView: View {

    let arbre: ArbreDB

    var body: some View {
        Text("Nom : \(arbre.name)")
        Text("Espèce : \(arbre.specie)")
        Text("Hauteur : \(arbre.height)")
        Text("Circonférence : \(arbre.circumference)")
        Text("Addresse : \(arbre.address)")
    }
}

struct ArbreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let arbre = ArbreDB()
        ArbreDetailView(arbre: arbre)
    }
}
