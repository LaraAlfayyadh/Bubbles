//
//  ServiceListView.swift
//  Bubbles
//
//  Created by Lara K on 01/12/1444 AH.
//

import SwiftUI

struct ServiceListView: View {
    
    
    
    let columns = [
        GridItem(.flexible())
    ]
    
    @ObservedObject var vm = ServiceListViewModel()
    @State var selectedService: ServiceListModel?
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach( vm.data){ service in
                    Button{
                        selectedService = service
                    }label: {
                        CardView(serviceType: service.serviceType, description: service.description, img: service.img, price: service.price)
                            .frame(width: 380, height: 440)
                            .background(.regularMaterial)
                            .cornerRadius(25)
                            .foregroundColor(.primary)
                    }
                }
            }
            .sheet(item: $selectedService) { SelectedService in
                BookServiceView(serviceType: SelectedService.serviceType, description: SelectedService.description, img: SelectedService.img, price: SelectedService.price)
            }
        }
    }
}



struct ServiceListView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceListView()
    }
}
