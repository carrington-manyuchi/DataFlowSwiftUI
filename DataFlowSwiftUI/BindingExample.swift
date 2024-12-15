//
//  BindingExample.swift
//  DataFlowSwiftUI
//
//  Created by Manyuchi, Carrington C on 2024/12/15.
//

import SwiftUI

struct BindingExample: View {
    @State private var color1: Color = .red
    @State private var color2: Color = .green
    @State private var color3: Color = .blue
    var body: some View {
        ZStack {
            Color
                .blue
                .opacity(0.2)
                .ignoresSafeArea()
            VStack {
                HStack {
                    RectangleView(color: color1)
                    RectangleView(color: color2)
                    RectangleView(color: color3)
                }
                .padding(.vertical, 50)
                
                CustomColorPicker(text: "Left Rectangle", selectedColor: $color1)
                CustomColorPicker(text: "Center Rectangle", selectedColor: $color2)
                CustomColorPicker(text: "Right Rectangle", selectedColor: $color3)
            }
            .padding()
        }
    }
}

#Preview {
    BindingExample()
}
