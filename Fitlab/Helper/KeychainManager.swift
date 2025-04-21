//
//  KeychainManager.swift
//  Fitlab
//
//  Created by Gul Kzm on 17.04.25.
//

import Foundation

import KeychainAccess

class KeychainManager {
    static let shared = KeychainManager()
    private let keychain = Keychain(service: "com.fitlab.app")

    func saveToken(_ token: String) {
        keychain["authToken"] = token
    }

    func getToken() -> String? {
        return keychain["authToken"]
    }

    func clearToken() {
        keychain["authToken"] = nil
    }
}

