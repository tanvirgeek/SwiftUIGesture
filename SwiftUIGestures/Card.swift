//
//  Card.swift
//  SwiftUIGestures
//
//  Created by MD Tanvir Alam on 12/10/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import SwiftUI

struct Card: View {
    var isTapped:Bool
    @State private var scale : CGFloat = 1
    var body: some View {
        VStack{
            Image("rodoshi")
                .resizable()
                .scaleEffect(self.scale)
                .frame(width:300, height: 200)
                .gesture(MagnificationGesture()
                    .onChanged({ (value) in
                        self.scale = value.magnitude
                    })
                )
                
            Text("Card")
                .font(.largeTitle)
                .foregroundColor(.white)
        }.frame(minWidth:0,maxWidth: .infinity,minHeight: 0, maxHeight: .infinity)
            .background(isTapped ? Color.orange:Color.purple)
            .cornerRadius(20)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(isTapped: false)
    }
}
