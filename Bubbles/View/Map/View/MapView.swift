//
//  MapView.swift
//  Bubbles
//
//  Created by Lara K on 28/11/1444 AH.
//

import SwiftUI
import MapKit


struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    @State private var region = MKCoordinateRegion()
    @State private var text = ""
    @State var annotations: [Location] = [] 
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: annotations) {
                MapMarker(coordinate: $0.coordinate, tint: .blue)
            }
            .ignoresSafeArea()
            .onAppear {
                setRegion(coordinate)
                
                annotations = [
                    Location(name: "Xyz", coordinate: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude))
                ]
                
            }
            
            
            
            Text("Where's your vehicle?")
                .font(.title3)
                .bold()
                .padding(.trailing, 140)
            
            TextField("Enter an address", text: $text)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 45)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(0.5)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
            
            
            Text("Move the pin to highlight the correct location of your car - it really helps!")
                .font(.caption)
                .foregroundColor(Color.gray)
            
            
            
            
            Button {
                
            } label: {
                NavigationLink(destination: ServiceListView()) {
                    Text("Confirm Location")
                    
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 45)
                        .background(Color("Color2"))
                        .cornerRadius(8)
                        .onTapGesture {
                        }
                        .autocapitalization(.none)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
        }
        
    }
    
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5))
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))    }
}
