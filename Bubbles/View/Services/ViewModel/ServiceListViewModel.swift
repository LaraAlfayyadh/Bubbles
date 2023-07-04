//
//  ServiceListViewModel.swift
//  Bubbles
//
//  Created by Lara K on 01/12/1444 AH.
//

import Foundation

class ServiceListViewModel: ObservableObject {
   @Published var data = [
    ServiceListModel(serviceType: "Silver Wash", description: "Quick, easy car washing\nEffective car cleaning \nInexpensive", img: "silver", price: 50),
    ServiceListModel(serviceType: "Gold Wash", description: "Various tools available for cleaning\nInexpensive", img: "gold", price: 70),
    ServiceListModel(serviceType: "Platinum Wash", description: "Thorough manual cleaning\nUses safe and premium products", img: "platinum", price: 115)
    ]
    
    
}
