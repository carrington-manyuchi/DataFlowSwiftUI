//
//  ContentView.swift
//  DataFlowSwiftUI
//
//  Created by Manyuchi, Carrington C on 2024/12/15.
//

import SwiftUI

struct StateExample: View {
    
    @State private var bgColor: Color = .green
    var fontTitle: Font = .largeTitle
    var fontSubTitle: Font = .title
    @State private var titleName: String = "State Example"
    @State private var subTitleName: String = "Exploring State"
    
    @State private var leftImageRotation: CGFloat = 0
    @State private var rightImageRotation:CGFloat = 0
    @State private var leftImage = "sun.horizon"
    @State private var rightImage = "moon.zzz.fill"
    
    var body: some View {
        ZStack {
            bgColor
                .opacity(0.8)
                .ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    Text(titleName)
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text(subTitleName)
                        .font(.title)
                }
                .onTapGesture {
                    if titleName == "State Example" {
                        titleName = "Hello"
                    } else {
                        titleName = "State Example"
                    }
                    subTitleName = "Happy Coding"
                    subTitleName = subTitleName ==   "Exploring State" ? "Happy Coding" : "Happy Coding"
                }
                
                Spacer()
                HStack {
                    Image(systemName: leftImage)
                        .imageScale(.large)
                        .rotationEffect(
                            Angle(degrees: leftImageRotation))
                    
                    Image(systemName: rightImage)
                        .imageScale(.large)
                        .rotationEffect(
                            Angle(degrees: rightImageRotation))
                }
                .foregroundStyle(.black)
                .onTapGesture {
                    withAnimation {
                        leftImageRotation += 180
                        rightImageRotation -= 180
                    }
                }
                
                Spacer()
                
                HStack(spacing: 50) {
                    Button("Background Color") {
                        //Change Color
                        bgColor = bgColor == .green ? .blue : .green
                    }
                    
                    Button("Change Images") {
                        leftImage = leftImage ==  "sun.horizon" ? "sparkles" :  "sun.horizon"
                        rightImage = rightImage ==  "moon.zzz.fill" ? "sparkle" :  "moon.zzz.fill"
                    }
                    
                }
                .padding()
            }
            .padding()
        }
    }
    
}

#Preview {
    StateExample()
}
