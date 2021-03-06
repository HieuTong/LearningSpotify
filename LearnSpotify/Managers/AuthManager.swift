//
//  AuthManager.swift
//  LearnSpotify
//
//  Created by Le Tong Minh Hieu on 3/5/21.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct Constants {
        static let ID = "0e2d1ec8c7cb4914af4a4c188a7590f6"
        static let clientSecret = "1d0682dd20fc4ba6b0de39b9b63f3673"
    }
    
    private init() {}
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
}
