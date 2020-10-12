//
//  ContentView.swift
//  SwiftUIGestures
//
//  Created by MD Tanvir Alam on 12/10/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isTapped = false
    @State var dragChanged = CGSize.zero
    @State var degree = 0.0
    var body: some View {
        Card(isTapped:isTapped)
            .animation(.spring())
            .offset(x:dragChanged.width,y:dragChanged.height)
            .rotationEffect(Angle(degrees: self.degree))
            .gesture(DragGesture()
                .onChanged({ (value) in
                    self.dragChanged = value.translation
                })
                .onEnded({ (value) in
                    self.dragChanged = CGSize.zero
                })
        )
            .gesture(
                TapGesture(count: 1)
                    .onEnded({ () in
                        self.isTapped.toggle()
                    })
        )
            .gesture(RotationGesture()
                .onChanged({ (value) in
                    self.degree = value.degrees
                })
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
