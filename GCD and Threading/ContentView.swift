//
//  ContentView.swift
//  GCD and Threading
//
//  Created by Stewart Lynch on 2020-06-11.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

// Film: https://www.youtube.com/watch?v=uRLcV2Rvheg&ab_channel=StewartLynch

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
                    self.dogVM.getDogWithSession()
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
