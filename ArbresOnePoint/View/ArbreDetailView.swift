//
//  ArbreDetailView.swift
//  Arbres One Point
//
//  Created by Otourou Da Costa on 16/01/2022.
//

import SwiftUI
import MapKit

struct ArbreDetailView: View {

    let arbre: ArbreDB
    let zoomFactor = 0.01
    let zoomOutFactor = 0.1
    
    @State private var arbresAnnotations: [ArbreDB] = []
    @State private var region = MKCoordinateRegion()
    @State private var isZoomed = false

    var body: some View {
        VStack {
            VStack {
                Text("Nom : \(arbre.name)").accessibility(identifier: "Name")
                Text("Espèce : \(arbre.specie)").accessibility(identifier: "Specie")
                Text("Hauteur : \(arbre.height)m").accessibility(identifier: "Height")
                Text("Circonférence : \(arbre.circumference)cm").accessibility(identifier: "Circumference")
                Text("Adresse : \(arbre.address)").accessibility(identifier: "Address")
            }
            VStack {
                Map(coordinateRegion: $region, annotationItems: arbresAnnotations) { arbreAnnotation in
                            MapAnnotation(
                                coordinate: CLLocationCoordinate2D(latitude: arbreAnnotation.geoPoint2d[0], longitude: arbreAnnotation.geoPoint2d[1]),
                                anchorPoint: CGPoint(x: 0.5, y: 0.5)
                            ) {
                                Image("tree-icon")
                                    .resizable()
                                    .frame(width: 44, height: 44)
                                    .shadow(color: Color.black, radius: 5)
                            }
                        }
                
                if self.isZoomed {
                    Button("Zoomer en arrière") {
                                    withAnimation {
                                        region.span = MKCoordinateSpan(
                                            latitudeDelta: zoomOutFactor,
                                            longitudeDelta: zoomOutFactor
                                        )
                                    }
                        self.isZoomed.toggle()
                    }
                } else {
                    Button("Zoomer en avant") {
                                    withAnimation {
                                        region.span = MKCoordinateSpan(
                                            latitudeDelta: zoomFactor,
                                            longitudeDelta: zoomFactor
                                        )
                                    }
                        self.isZoomed.toggle()
                                }
                }
            }.onAppear {
                self.region = getArbreRegion(arbre: arbre)
                self.arbresAnnotations.append(arbre)
            }
        }

    }
    
    func getArbreRegion(arbre: ArbreDB) -> MKCoordinateRegion {
        return MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: arbre.geoPoint2d[0],
                    longitude: arbre.geoPoint2d[1]
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: zoomOutFactor,
                    longitudeDelta: zoomOutFactor
                )
            )
    }
}

struct ArbreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let arbre = ArbreDB()
        ArbreDetailView(arbre: arbre)
    }
}
