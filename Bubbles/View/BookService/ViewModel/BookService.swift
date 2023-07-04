//
//  BookService.swift
//  Bubbles
//
//  Created by Lara K on 01/12/1444 AH.
//


import SwiftUI
import FirebaseCore
import FirebaseFirestore

class BookService: ObservableObject {
    let paymentHandelar = PaymentHandler()
    @Published var payment = false
    @Published var m :[BookService] = []

    
    func pay(){
        paymentHandelar.startPayment(total: 115){ i in
            self.payment = i
            self.m = []
        }
    }
    

    // Get a reference to the Firestore database
    let db = Firestore.firestore()
    
    // MARK: -  Add a new Booking
    func createBooking(serviceType: String, paymentMethod: String, bookStatus: String){
        
        // Create a data dictionary with the fields you want to save
        let bookDetail: [String: Any] = [
            "serviceType": serviceType,
            "paymentMethod": paymentMethod,
            "bookStatus": bookStatus,
            
            "bookID": UUID().uuidString
        ]
        
        var ref: DocumentReference? = nil
        ref = db.collection("bookService")
            .addDocument(data: bookDetail) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Order has been added with ID: \(ref!.documentID)")
                }
            }
    }
}
