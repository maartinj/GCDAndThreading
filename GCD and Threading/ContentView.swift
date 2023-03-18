//
//  ContentView.swift
//  GCD and Threading
//
//  Created by Stewart Lynch on 2020-06-11.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dogVM = DogViewModel()
    @State private var backgroundIsGreen = false
    
    var body: some View {
        ZStack {
            Color(backgroundIsGreen ? .green : .white)
            VStack(spacing: 20) {
                Group {
                    if dogVM.image != nil {
                        Image(uiImage: dogVM.image!)
                            .resizable()
                            .frame(width: 320, height: 240)
                            .aspectRatio(contentMode: .fill)
                    } else {
                        Rectangle().stroke(lineWidth: 2).foregroundColor(.red)
                            .frame(width: 320, height: 240)
                    }
                }
                Button("Get Dog Image") {
                    self.dogVM.getDog()
                }
                Button("Change Background") {
                    self.backgroundIsGreen.toggle()
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
