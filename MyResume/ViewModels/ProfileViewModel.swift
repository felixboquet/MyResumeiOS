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
    func fetchProfile()
}

final class ProfileViewModel: ObservableObject {
    @Published var profile: Profile
    private var dataManager: DataManagerProtocol
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
        profile = Profile(name: nil)
    }
    
}

// MARK: - ProfileViewModelProtocol implementation
extension ProfileViewModel: ProfileViewModelProtocol {
    
    func fetchProfile() {
        profile = dataManager.fetchProfile().first ?? Profile(name: "Error")
    }
    
}
