//
//  ContentView.swift
//  LoginSwiftUI
//
//  Created by macbook on 11/02/23.
//

import SwiftUI
import SwiftUISnackbar
import AlertMessage

struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var showingLoginScreen = false
    @State private var isActive = false
    @State private var snackTitle = ""
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                Color("baseColor")
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                VStack{
//                    Text("LOGIN")
//                        .font(.largeTitle)
//                        .bold()
//                        .padding()
//                        .lineLimit(1)
                    Image(systemName: "pencil.and.outline")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color("baseColor"))
                        .padding(.bottom, 30)
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                    
                    Button("Login"){
                        auth(username: username, password: password)
                    }
                    .font(.system(size: 17, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.orange)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: BottomNavigationView(), isActive: $showingLoginScreen){
                        EmptyView()
                    }
                }
                
                
                .snackbar(isShowing: $isActive, title: snackTitle, style: .custom(Color.red))
            }
        }
        .navigationBarHidden(true)
    }
    
    func auth(username:String, password:String){
        if(username.lowercased() == "admin" && password.lowercased() == "adminmaster"){
            showingLoginScreen = true
            isActive = false
            snackTitle = "Welcome @\(username)"
        }else{
            isActive = true
            snackTitle = "Wrong Username or Password !"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
