//
//  UserService.swift
//  bazilariburada
//
//  Created by Furkan Doğan on 21.11.2024.
//

import Foundation
import Combine

class UserService {
    private let usersKeyword = "/users/profile"
    private let networkManager = NetworkManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var user: User?
    
    func getUserProfile(token: String) {
        networkManager.request(endpoint: usersKeyword, method: .GET, requiresAuthentication: true, token: token)
            .decode(type: ApiResponse<User>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: networkManager.handleCompletion, receiveValue: { [weak self] response in
                print(response.message)
                self?.user = response.data
            })
            .store(in: &cancellables)
    }
    
    func updateUserProfile(token: String, username: String, password: String) {
        let body = ["username": username, "password": password]
        networkManager.request(endpoint: usersKeyword, method: .PATCH, body: body, requiresAuthentication: true, token: token)
            .decode(type: ApiResponse<UpdateUserProfileResponseData>.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: networkManager.handleCompletion, receiveValue: { response in
                print(response.data?.message ?? "")
            })
            .store(in: &cancellables)
    }
}
