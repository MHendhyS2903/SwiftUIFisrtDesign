//
//  SliderView.swift
//  LoginSwiftUI
//
//  Created by macbook on 17/02/23.
//

import SwiftUI

struct SliderView: View {
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
        @State private var selection = 0
    let images = ["ad","ads","ad","ads","bg"]
    var body: some View {
        ZStack{
            TabView(selection : $selection){
                ForEach(0..<5){ i in
                    Image("\(images[i])")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .onReceive(timer, perform: { _ in
                withAnimation{
                    print("selection is",selection)
                    selection = selection < 5 ? selection + 1 : 0
                }
            })
//            .frame(height: 50)
            .frame(maxWidth: .infinity)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
