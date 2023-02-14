//
//  SettingView.swift
//  LoginSwiftUI
//
//  Created by macbook on 11/02/23.
//

import SwiftUI

struct SettingView: View {
    @State private var move = false
    var body: some View {
        NavigationView(){
            Form{
                Section(){
                    HStack{
                        Image("img")
                            .resizable()
                            .frame(width: 65, height: 65)
                            .clipShape(Circle())
                        VStack(alignment: .leading){
                            Text("Username")
                                .font(.headline)
                            Text("Job Title")
                                .font(.caption)
                        }
                    }
                }
                
                Section(){
                    NavigationLink(destination: HomeView()){
                        HStack(spacing: 20){
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .clipShape(Circle())
                                .foregroundColor(Color.blue)
                            Text("Profile")
                                .font(.subheadline)
                        }
                    }
                    
                    HStack(spacing: 20){
                        Image(systemName: "house.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                            .foregroundColor(Color.blue)
                        Text("Address")
                            .font(.subheadline)
                    }
                    
                    HStack(spacing: 20){
                        Image(systemName: "hammer.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                            .foregroundColor(Color.blue)
                        Text("Job")
                            .font(.subheadline)
                    }
                }
                
                Section(){
                    Button("Logout"){
                        move = true
                    }
                    .foregroundColor(Color.red)
                    .background(NavigationLink("", destination: ContentView()).opacity(0))
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .ignoresSafeArea()
        .background(Color.blue)
        
        
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
