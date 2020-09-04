//
//  ProfileViewModel.swift
//  MyResume
//
//  Created by Féfé on 01/09/2020.
//  Copyright © 2020 Felix Boquet. All rights reserved.
//

import Foundation
import Combine

protocol ProfileViewModelProtocol {
    var profile: Profile { get }
    func fetchProfile() -> AnyPublisher<Profile, Error>
}

final class ProfileViewModel: ObservableObject {
    @Published var profile: Profile?
    
}
