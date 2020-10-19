//
//  ProfileView.swift
//  MyResume
//
//  Created by Féfé on 01/09/2020.
//  Copyright © 2020 Felix Boquet. All rights reserved.
//

import SwiftUI
import MapKit

struct DarkBackground<S: Shape>: View {
    var shape: S

    var body: some View {
        ZStack {

            shape
                .fill(Color.darkEnd)
                .shadow(color: Color.darkStart, radius: 10, x: -10, y: -10)
                .shadow(color: Color.darkEnd, radius: 10, x: 10, y: 10)
            
        }
    }
}

struct DarkButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(30)
            .contentShape(Circle())
            .background(
                DarkBackground(shape: Circle())
            )
    }
}

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    @State private var isVisible = false
    
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
                    .scaleEffect(isVisible ? 1.5 : 0)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1)) {
                            self.isVisible.toggle()
                        }
                    }
                
                VStack(alignment: .leading) {
                    Text(viewModel.profile.name ?? "")
                        .font(.title)
                        .foregroundColor(.white)
                    HStack(alignment: .top) {
                        Text(viewModel.profile.job ?? "")
                            .font(.subheadline)
                            .foregroundColor(.white)
                        Spacer()
                        Text(viewModel.profile.tech ?? "")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                }.onAppear() {
                    self.viewModel.fetchProfile()
                }
                .padding()
                    
                HStack(alignment: .top) {
                    Button(action: {
                        // your action here
                    }) {
                        Image(systemName: "book")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(DarkButtonStyle())
                }.padding(.top, 64)
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
        .background(LinearGradient(gradient: Gradient(colors: [Color.darkStart, Color.darkEnd]), startPoint: .leading, endPoint: .trailing))
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
