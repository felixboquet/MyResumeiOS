//
//  CircleImage.swift
//  MyResume
//
//  Created by Féfé on 01/09/2020.
//  Copyright © 2020 Felix Boquet. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("profile_picture")
        .resizable()
        .frame(width: 200, height: 200)
        .clipShape(Circle())
        .overlay(
            Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
