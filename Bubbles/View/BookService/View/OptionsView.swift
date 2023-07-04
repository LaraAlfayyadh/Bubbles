//
//  OptionsView.swift
//  Bubbles
//
//  Created by Lara K on 01/12/1444 AH.
//

import SwiftUI

struct OptionsView: View {
    @Binding var selectedOption: String
    let options: [String]
    var body: some View {
        VStack {
            Picker("Please choose a color", selection: $selectedOption) {
                ForEach(options, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(selectedOption: .constant("Option 1"), options: ["Option 1", "Option 2"])
    }
}
