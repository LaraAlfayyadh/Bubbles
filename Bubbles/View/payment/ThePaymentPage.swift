//
//  ThePaymentPage.swift
//  Bubbles
//
//  Created by Lara K on 03/12/1444 AH.
//

import SwiftUI

struct ThePaymentPage: View {
    @StateObject var vm = BookService()
    
    
    var body: some View {
        PaymentButton(action: vm.pay)

        }
    }
        

struct ThePaymentPage_Previews: PreviewProvider {
    static var previews: some View {
        ThePaymentPage()
    }
}
