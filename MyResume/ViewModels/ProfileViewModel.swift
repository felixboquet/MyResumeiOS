//
//  ProfileViewModel.swift
//  MyResume
//
//  Created by Féfé on 01/09/2020.
//  Copyright © 2020 Felix Boquet. All rights reserved.
//

import Foundation
import Combine
import FirebaseFirestore

protocol ProfileViewModelProtocol {
    var profileList: [Profile] { get }
    func fetchProfile()
}

final class ProfileViewModel: ObservableObject {
    @Published var profile = Profile()
    private var dataManager: DataManagerProtocol
    private var db = Firestore.firestore()
    private var subscriptions = Set<AnyCancellable>()
    var profileList = [Profile]()
    
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
    
}

// MARK: - ProfileViewModelProtocol implementation
extension ProfileViewModel: ProfileViewModelProtocol {
    
    func fetchProfile() {
        dataManager.fetchRemoteProfile().sink(receiveCompletion: { _ in
            
        }, receiveValue: { [unowned self] in self.profile = $0.first! })
        .store(in: &self.subscriptions)
    }
    
}
