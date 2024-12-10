//
//  AES256.swift
//  Playground
//
//  Created by CAR Software Systems on 10/12/24.
//

import SwiftUI
import CryptoKit

struct AES256ContentView: View {
    @State private var plainText: String = ""
    @State private var encryptedText: String = ""
    @State private var decryptedText: String = ""
    
    // AES Encryption Key
    private let key = SymmetricKey(size: .bits256)
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter text to encrypt", text: $plainText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Encrypt Text") {
                if let encrypted = encrypt(plainText: plainText) {
                    encryptedText = encrypted
                    
                    print(encryptedText)
                }
            }
            .buttonStyle(.borderedProminent)
            
            Text("Encrypted Text:")
                .font(.headline)
            Text(encryptedText)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
            
            Button("Decrypt Text") {
                if let decrypted = decrypt(cipherText: encryptedText) {
                    decryptedText = decrypted
                }
            }
            .buttonStyle(.borderedProminent)
            
            Text("Decrypted Text:")
                .font(.headline)
            Text(decryptedText)
                .foregroundColor(.green)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
    
    // AES-256 Encryption Function
    func encrypt(plainText: String) -> String? {
        guard let data = plainText.data(using: .utf8) else { return nil }
        do {
            let sealedBox = try AES.GCM.seal(data, using: key)
            return sealedBox.combined?.base64EncodedString() // Convert to Base64 for readability
        } catch {
            print("Encryption Error: \(error)")
            return nil
        }
    }
    
    // AES-256 Decryption Function
    func decrypt(cipherText: String) -> String? {
        guard let data = Data(base64Encoded: cipherText) else { return nil }
        do {
            let sealedBox = try AES.GCM.SealedBox(combined: data)
            let decryptedData = try AES.GCM.open(sealedBox, using: key)
            return String(data: decryptedData, encoding: .utf8)
        } catch {
            print("Decryption Error: \(error)")
            return nil
        }
    }
}
