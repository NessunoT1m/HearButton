//
//  ContentView.swift
//  HeartButton
//
//  Created by Tamerlan Kerimbayev on 26.03.2023.
//

import SwiftUI

struct HeartButton: View{

    @State private var animateButton = false
    
    var body: some View{
        Button{
            animateButton.toggle()
        }label:{
            ZStack{
                Image(systemName: animateButton ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 60, height: 50)
                    .foregroundColor(.red)
                ForEach(0..<10){ index in
                    Image(systemName: "heart.fill")
                        .offset(x: CGFloat(CFloat.random(in: -30...30)),
                                y: animateButton ? CGFloat(-CFloat(index * 20)) : 0)
                        .foregroundColor(animateButton ? .red : .clear)
                        .opacity(animateButton ? 0 : 1)
                        .animation(Animation.easeInOut(duration: 1.2).delay(Double(index) / 20),
                                   value: animateButton)
                    
                    
                }
                Circle()
                    .stroke(.red, lineWidth: 4)
                    .foregroundColor(.clear)
                    .frame(width: 100, height: 100, alignment: .center)
                    .scaleEffect(animateButton ? 1.7 : 0)
                    .opacity(animateButton ? 0 : 1)
                    .animation(Animation.easeInOut(duration: 1.0), value:animateButton)
                Circle()
                    .stroke(.red, lineWidth: 4)
                    .foregroundColor(.clear)
                    .frame(width: 80, height: 80, alignment: .center)
                    .opacity(1.0)
            }
            
        }
    }
}


struct HeartView_Previews: PreviewProvider {
    static var previews: some View {
        HeartButton()
    }
}
