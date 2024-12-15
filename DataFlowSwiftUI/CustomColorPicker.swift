//
//  CustomColorPicker.swift
//  DataFlowSwiftUI
//
//  Created by Manyuchi, Carrington C on 2024/12/15.
//

import SwiftUI

struct CustomColorPicker: View {
    
    let text: String
    @Binding var selectedColor: Color
    
    let colors: [Color] = [
        .red, .green, .blue, .orange, .yellow,
        .pink, .purple, .gray, .black, .white,
        .indigo, .teal, .brown,  .cyan, .gray
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(text)
                .font(.headline)
                .fontWeight(.semibold)
            ScrollView(.horizontal) {
                HStack {
                    
                    ForEach(colors, id: \.self) { color in
                        ColorCircle(
                            color: color,
                            isSelected: selectedColor == color
                        )
                            .onTapGesture {
                                withAnimation {
                                    selectedColor = color
                                }
                            }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 7)
            .background(
                Color.gray.opacity(0.2)
            )
            .clipShape(
                .rect(cornerRadius: 10)
                //RoundedRectangle(cornerRadius: 10)
            )
        }
        .padding()
    }
}

#Preview {
    CustomColorPicker(text: "Color", selectedColor: .constant(.pink))
}
