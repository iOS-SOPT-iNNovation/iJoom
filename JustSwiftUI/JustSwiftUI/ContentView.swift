//
//  ContentView.swift
//  JustSwiftUI
//
//  Created by IJ . on 2020/07/27.
//  Copyright © 2020 jun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack(alignment: .leading){
            Text("Hello, World!")
                .font( .title)
                .foregroundColor(.green)
            Text("Hello, World!")
                .font( .title)
                .foregroundColor(.blue)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
