//
//  HomeView.swift
//  LoginSwiftUI
//
//  Created by macbook on 12/02/23.
//

import SwiftUI

struct HomeView: View {
    @State private var index = 0
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
        @State private var selection = 0
    let images = ["ads1","ads2","ads3","ads4","ads5"]
    
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
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                
                ZStack{
                    TabView(selection : $selection){
                        ForEach(0..<5){ i in
                            Image("\(images[i])")
                                .resizable(resizingMode: .stretch)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.horizontal)
                                .cornerRadius(50)
                        }
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                    .onReceive(timer, perform: { _ in
                        withAnimation{
                            selection = selection < 5 ? selection + 1 : 0
                        }
                    })
                    .shadow(radius: 10)
                    .frame(height: 70)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
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
                    .foregroundColor(Color.cyan)
                VStack{
                    Image(systemName: "creditcard")
                        .resizable()
                        .frame(width: 30, height: 19)
                        .foregroundColor(Color.white)
                    Text("Rp. 5.000.000")
                        .foregroundColor(Color.white)
                        .font(.system(size: 13, weight: .bold))
                }
            }
            .shadow(radius: 10)
            ZStack{
                Rectangle()
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(5)
                    .padding(.trailing, 10)
                    .foregroundColor(Color.cyan)
                VStack{
                    Image(systemName: "banknote")
                        .resizable()
                        .frame(width: 30, height: 19)
                        .foregroundColor(Color.white)
                    Text("Rp. 10.000.000")
                        .foregroundColor(Color.white)
                        .font(.system(size: 13, weight: .bold))
                }
            }
            .shadow(radius: 10)
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
                                .foregroundColor(Color.red)
                                .frame(width: 20, height: 30)
                                .frame(maxWidth: .infinity)
                            Text("Pulsa & Data")
                                .font(.system(size: 12))
                        }
                        VStack{
                            Image(systemName: "lightbulb.fill")
                                .resizable()
                                .foregroundColor(Color("moneyColor"))
                                .frame(width: 20, height: 30)
                                .frame(maxWidth: .infinity)
                            Text("Electricity")
                                .font(.system(size: 12))
                        }
                        VStack{
                            Image(systemName: "cable.connector")
                                .resizable()
                                .foregroundColor(Color.gray)
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
                                .foregroundColor(Color.purple)
                                .frame(width: 35, height: 25)
                                .frame(maxWidth: .infinity)
                            Text("Games")
                                .font(.system(size: 12))
                        }
                        VStack{
                            Image(systemName: "graduationcap.fill")
                                .resizable()
                                .foregroundColor(Color.blue)
                                .frame(width: 35, height: 25)
                                .frame(maxWidth: .infinity)
                            Text("Education")
                                .font(.system(size: 12))
                        }
                        VStack{
                            Image(systemName: "cross.vial.fill")
                                .resizable()
                                .foregroundColor(Color("medicineColor"))
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
