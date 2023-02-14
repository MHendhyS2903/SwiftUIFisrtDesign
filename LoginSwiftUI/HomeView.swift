//
//  HomeView.swift
//  LoginSwiftUI
//
//  Created by macbook on 12/02/23.
//

import SwiftUI

struct RoundedCorners: View{
    var color: Color = .blue
        var tl: CGFloat = 0.0
        var tr: CGFloat = 0.0
        var bl: CGFloat = 0.0
        var br: CGFloat = 0.0
        
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height
                
                // Make sure we do not exceed the size of the rectangle
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}

struct HomeView: View {
    @State private var index = 0
    var body: some View {
        ScrollView{
            VStack{
                ZStack{
                    Image("bg")
                        .resizable()
                        .frame(height: 200)
                        .background(NavigationLink("", destination: SettingView()).opacity(0))
                    Rectangle()
                        .frame(height: 120)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .foregroundColor(Color.white.opacity(0))
                    VStack{
                        Image("img")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .background(NavigationLink("", destination: SettingView()).opacity(0))
                        Text("Username")
                            .foregroundColor(Color.black)
                            .font(.headline)
                        Text("ID Number")
                            .foregroundColor(Color.black)
                            .font(.caption)
                    }
                }
                balance()
                menu()
            }
        }
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct balance: View {
    var body: some View{
        HStack{
            ZStack{
                Rectangle()
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(5)
                    .padding(.leading, 10)
                    .foregroundColor(Color("baseColor"))
                VStack{
                    Image(systemName: "creditcard")
                        .resizable()
                        .frame(width: 30, height: 19)
                        .foregroundColor(Color.white)
                    Text("5.000.000")
                        .foregroundColor(Color.white)
                        .font(.system(size: 13, weight: .bold))
                }
            }
            ZStack{
                Rectangle()
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(5)
                    .padding(.trailing, 10)
                    .foregroundColor(Color("baseColor"))
                VStack{
                    Image(systemName: "banknote")
                        .resizable()
                        .frame(width: 30, height: 19)
                        .foregroundColor(Color.white)
                    Text("10.000.000")
                        .foregroundColor(Color.white)
                        .font(.system(size: 13, weight: .bold))
                }
            }
        }
    }
}

struct menu: View{
    var body: some View{
        ZStack{
            Rectangle()
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .cornerRadius(radius: 25, corners: [.topLeft, .topRight])
                .cornerRadius(radius: 5, corners: [.bottomLeft, .bottomRight])
                .shadow(radius: 10)
                .padding()
                .foregroundColor(Color.white)
            HStack{
                VStack{
                    HStack{
                        Image(systemName: "building.columns.fill")
                            .resizable()
                            .frame(width: 30, height: 19)
                            .foregroundColor(Color("baseColor"))
                        Text("Transfer Bank")
                            .foregroundColor(Color.black)
                            .font(.system(size: 13, weight: .bold))
                        Button("Send"){
                            
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 13, weight: .bold))
                        .shadow(radius: 10)
                        .frame(width: 50, height: 30)
                        .background(Color("baseColor"))
                        .cornerRadius(10)
                    }
                    .padding(.bottom, 20)
                    HStack{
                        VStack{
                            Image(systemName: "iphone.gen1")
                                .resizable()
                                .foregroundColor(Color("baseColor"))
                                .frame(width: 20, height: 30)
                                .frame(maxWidth: .infinity)
                            Text("Pulsa & Data")
                                .font(.system(size: 12))
                        }
                        VStack{
                            Image(systemName: "lightbulb.fill")
                                .resizable()
                                .foregroundColor(Color("baseColor"))
                                .frame(width: 20, height: 30)
                                .frame(maxWidth: .infinity)
                            Text("Electricity")
                                .font(.system(size: 12))
                        }
                        VStack{
                            Image(systemName: "cable.connector")
                                .resizable()
                                .foregroundColor(Color("baseColor"))
                                .frame(width: 20, height: 30)
                                .frame(maxWidth: .infinity)
                            Text("Internet")
                                .font(.system(size: 12))
                        }
                    }
                    .padding(.horizontal)
                    HStack{
                        VStack{
                            Image(systemName: "gamecontroller.fill")
                                .resizable()
                                .foregroundColor(Color("baseColor"))
                                .frame(width: 35, height: 25)
                                .frame(maxWidth: .infinity)
                            Text("Games")
                                .font(.system(size: 12))
                        }
                        VStack{
                            Image(systemName: "graduationcap.fill")
                                .resizable()
                                .foregroundColor(Color("baseColor"))
                                .frame(width: 35, height: 25)
                                .frame(maxWidth: .infinity)
                            Text("Education")
                                .font(.system(size: 12))
                        }
                        VStack{
                            Image(systemName: "cross.vial.fill")
                                .resizable()
                                .foregroundColor(Color("baseColor"))
                                .frame(width: 20, height: 30)
                                .frame(maxWidth: .infinity)
                            Text("Medicine")
                                .font(.system(size: 12))
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        ZStack{
            Rectangle()
                .frame(height: 80)
                .frame(maxWidth: .infinity)
                .cornerRadius(radius: 25, corners: [.bottomLeft, .bottomRight])
                .cornerRadius(radius: 5, corners: [.bottomLeft, .bottomRight])
                .shadow(radius: 10)
                .padding()
                .foregroundColor(Color.white)
            HStack{
                VStack{
                    Image("gopay")
                        .resizable()
                        .foregroundColor(Color("baseColor"))
                        .frame(width: 30, height: 30)
                        .frame(maxWidth: .infinity)
                    Text("Gopay")
                        .font(.system(size: 12))
                }
                VStack{
                    Image("dana")
                        .resizable()
                        .foregroundColor(Color("baseColor"))
                        .frame(width: 45, height: 30)
                        .frame(maxWidth: .infinity)
                    Text("Dana")
                        .font(.system(size: 12))
                }
                VStack{
                    Image("ovo")
                        .resizable()
                        .foregroundColor(Color("baseColor"))
                        .frame(width: 30, height: 30)
                        .frame(maxWidth: .infinity)
                    Text("Ovo")
                        .font(.system(size: 12))
                }
            }
            .padding(.horizontal)
        }
    }
}
