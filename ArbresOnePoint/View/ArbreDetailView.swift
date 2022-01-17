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
        Text("Nom : \(arbre.name)").accessibility(identifier: "Name")
        Text("Espèce : \(arbre.specie)").accessibility(identifier: "Specie")
        Text("Hauteur : \(arbre.height)m").accessibility(identifier: "Height")
        Text("Circonférence : \(arbre.circumference)cm").accessibility(identifier: "Circumference")
        Text("Adresse : \(arbre.address)").accessibility(identifier: "Address")
    }
}

struct ArbreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let arbre = ArbreDB()
        ArbreDetailView(arbre: arbre)
    }
}
