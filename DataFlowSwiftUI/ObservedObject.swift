//
//  ObservedObject.swift
//  DataFlowSwiftUI
//
//  Created by Manyuchi, Carrington C on 2024/12/15.
//

import SwiftUI

class SomeViewmodel: ObservableObject {
    
    @Published var data1: String = "Hello World"
    @Published var data2: String = "We love programming"
}

struct ObservedObject: View {
    
    @StateObject var viewModel = SomeViewmodel()
    
    var body: some View {
        VStack {
            Text(viewModel.data1)
            Text(viewModel.data2)
            
            Button("Click Me") {
                
                if viewModel.data1 == "Hello World!" {
                    viewModel.data1 = "Change"
                    viewModel.data2 = "Try Again"
                } else {
                    viewModel.data1 = "Hello World"
                    viewModel.data2 = "We love programming"
                }
            }
        }
        .font(.largeTitle)
    }
    
}


struct RandomNumberView: View {
    
    @State private var randomNumber = 0
    
    var body: some View {
        VStack {
            Text("Random Numbe is: \(randomNumber)")
            Button("Randomize number") {
                randomNumber = (0..<1000).randomElement() ?? 0
            }
            
            ObservedObject()
        }
       
    }
}

#Preview {
    ObservedObject()
}
