//
//  ContentView.swift
//  viewsAndModifiers
//
//  Created by Nicolás Derbez on 20/01/25.
//

import SwiftUI

struct Title : ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

extension View{
    func title() -> some View{
        modifier(Title())
    }
}




struct ContentView: View {
    var body: some View {
        //two ways:
    Text("Hello, World!")
            .modifier(Title())
     Text("Hello, world!")
            .title()

    }
}
         

#Preview {
    ContentView()
}
