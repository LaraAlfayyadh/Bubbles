//
//  MessagesManager.swift
//  Bubbles
//
//  Created by Lara K on 29/11/1444 AH.


import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseCore
import FirebaseAuth


class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    let db = Firestore.firestore()
    var listenerRegistration: ListenerRegistration?

    init() {
        getMessages()
    }
    
    deinit {
        listenerRegistration?.remove()
    }


    func getMessages() {
        listenerRegistration = db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else  {
                print("Error fetching documents: \(String(describing: error))")
                return
            }

            self.messages = documents.compactMap { document -> Message? in
                do {
                    return try document.data(as: Message.self)
                } catch {
                    print("Error decoding document into Message: \(error)")
                    return nil
                }
            }
            self.messages.sort { $0.timestamp < $1.timestamp }
        }
    }
    
    func sendMessage(text: String) {
        do {
            let newMessage = Message(id: "\(UUID())", text: text, received: false, timestamp: Date())

            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("Error adding message to Firesstore: \(error)")
        }
    }
}
