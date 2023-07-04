//
//  PaymentButton.swift
//  Bubbles
//
//  Created by Lara K on 03/12/1444 AH.
//

import SwiftUI
import PassKit


struct PaymentButton: View {
    var action: () -> Void
    
    @State var cardNumber = ""
    @State var cardholderName = ""
    @State var expirationMonth = ""
    @State var expirationYear = ""
    @State var cvv = ""
    
    var body: some View { //
        
        VStack {
        Representable(action: action)
            .font(.system(size: 18))
            .foregroundColor(.white)
            .padding(.vertical)
            //.padding(.bottom)
            .background(Color.black)
            .frame(width: UIScreen.main.bounds.width - 45)
            .frame(height: 60)
            .cornerRadius(8)
        
        
        
            
            
            Text("Or pay with card")
                .font(.callout)
                .foregroundColor(.gray)
                .padding()
                .bold()
            
            
            TextField("Card number", text: $cardNumber)
                .keyboardType(.numberPad)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 45)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
            
            TextField("Cardholder name", text: $cardholderName)
                .padding()
                .frame(width: UIScreen.main.bounds.width - 45)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
            
            HStack {
                TextField("Exp. month", text: $expirationMonth)
                    .keyboardType(.numberPad)
                    .padding()
                    .frame(width: 140.0, height: 20.0)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                //
                //                Text("/")
                //                    .padding()
                
                TextField("Exp. year", text: $expirationYear)
                    .keyboardType(.numberPad)
                    .padding()
                    .frame(width: 140.0, height: 20.0)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
            }
            
            VStack {
                TextField("CVV", text: $cvv)
                    .frame(width: 70.0, height: 20.0)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
            }
            .padding(.trailing, 250.0)
            
            Button {
                
            } label: {
                Text("Pay 115 SAR")
                    .font(.system(size: 18))
                    .foregroundColor(.black)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 45)
                    .background(Color("Color2"))
                    .cornerRadius(8)
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top, 50.0)
            }
            
        }
    }
}


struct PaymentButton_Previews: PreviewProvider {
    static var previews: some View {
        PaymentButton(action: {})
    }
}

extension PaymentButton {
    struct Representable: UIViewRepresentable {
        var action: () -> Void
        
        func makeCoordinator() -> Coordinator {
            Coordinator(action: action)
        }
        
        func makeUIView(context: Context) -> UIView {
            context.coordinator.button
        }
        
        func updateUIView(_ rootView: UIView, context: Context) {
            context.coordinator.action = action
        }
    }
    
    class Coordinator: NSObject {
        var action: () -> Void
        var button = PKPaymentButton(paymentButtonType: .checkout, paymentButtonStyle: .automatic)
        
        init(action: @escaping () -> Void) {
            self.action = action
            super.init()

            button.addTarget(self, action: #selector(callback(_:)), for: .touchUpInside)
        }
        
        @objc
        func callback(_ sender: Any) {
            action()
        }
    }
}
