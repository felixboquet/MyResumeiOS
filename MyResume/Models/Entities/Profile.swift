//
//  Profile.swift
//  MyResume
//
//  Created by Féfé on 01/09/2020.
//  Copyright © 2020 Felix Boquet. All rights reserved.
//

import Foundation

struct Profile: Identifiable {
    var id = UUID()
    var name: String?
    var job: String?
    var tech: String?
}
