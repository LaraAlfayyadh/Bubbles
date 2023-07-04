//
//  ServiceListModel.swift
//  Bubbles
//
//  Created by Lara K on 01/12/1444 AH.
//

import Foundation

struct ServiceListModel: Identifiable{
    var id = UUID()
    var serviceType: String
    var description: String
    var img: String
    var price: Int
}
