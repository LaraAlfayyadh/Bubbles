//
//  HomeViewModel.swift
//  Bubbles
//
//  Created by Lara K on 02/12/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


@MainActor class HomeViewModel : ObservableObject{
    @Published var carInfo : [CarInfoModel] = []
   // @Published var paymentSuccess = false
    //@Published private(set) var total: Int = 0
    let db = Firestore.firestore()
    //let paymentHandler = PaymentHandler()
     
//    func pay() {
//        paymentHandler.startPayment(products: myOrder, total: 50) { success in
//            self.paymentSuccess = success
//            self.myOrder = []
//            self.total = 0
//        }
//    }

    init() {
        listenToDataBase()
    }
    
    func listenToDataBase() {
        let fieldName = "email"
        let fieldValue = Auth.auth().currentUser?.email
    
        db.collection("users")
            .whereField(fieldName, isEqualTo: fieldValue ?? "Not Avialble" )
            .addSnapshotListener { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error.localizedDescription)")
            } else {
                self.carInfo = []
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let fullname = data["fullname"] as? String ?? ""
                    let vechail = data["vechaild"] as? String ?? ""
                    let plate = data["plate"] as? String ?? ""
                    let color = data["color"] as? String ?? ""
                    let email = data["email"] as? String ?? ""
                    let Model = data["email"] as? String ?? ""
                   // let Model = data["Model"] as? Date ?? Date.now
                    
                    let all = CarInfoModel(email: email,
                        fullname: fullname,
                                        vechail: vechail,
                                           Model: Model, plate: plate,
                                           color: color
                                           )
                    self.carInfo.append(all)
                    
                }
            }
        }
    }
}
