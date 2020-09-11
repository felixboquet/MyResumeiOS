//
//  ProfileView.swift
//  MyResume
//
//  Created by Féfé on 01/09/2020.
//  Copyright © 2020 Felix Boquet. All rights reserved.
//

import SwiftUI
import MapKit

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    
    @State private var name = ""
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                MapView()
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                
                CircleImage()
                    .offset(y: -130)
                    .padding(.bottom, -130)
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.title)
                        .foregroundColor(.white)
                    HStack(alignment: .top) {
                        Text("Ingénieur développement mobile")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Spacer()
                        Text("iOS/Android")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                }.onAppear() {
                    self.viewModel.fetchProfile()
                    self.name = self.viewModel.profile.name ?? ""
                }
                .padding()
                    
                HStack(alignment: .top) {
                    Button(action: {
                        // your action here
                    }) {
                        Text("Expériences")
                    }
                }.padding(.top, 64)
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color.black)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
