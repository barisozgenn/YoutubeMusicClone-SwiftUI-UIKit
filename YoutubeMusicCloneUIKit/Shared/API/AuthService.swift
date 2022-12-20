//
//  AuthService.swift
//  YoutubeMusicCloneUIKit
//
//  Created by Baris OZGEN on 20.11.2022.
//

import Firebase

struct AuthService {
    var userSession: Firebase.User?
    
    static let shared = AuthService()
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    func signOut(){
        try? Auth.auth().signOut()
    }
    
    func fetchUserProfile(completion: @escaping (_ userProfile: UserModel) -> ()){
        guard let uid = userSession?.uid else {return}
        
        COLLECTION_USER_PROFILE.document(uid).getDocument { snapshot, _ in
            guard let user = try? snapshot?.data(as: UserModel.self) else {return}
            completion(user)
          
        }
    }
    
    func registerUser(withCredential authCredential: AuthCredentials, userModel: UserModel,  completion: @escaping (Error?, _ userProfile: UserModel?) -> ()){
        
        Auth.auth().createUser(withEmail: authCredential.email, password: authCredential.password) { (result, error) in
            
            if let error = error {
                print("DEBUG: Error writing document: \(error.localizedDescription)")
                completion(error, nil)
            }
            
            guard let user = result?.user else {return}
            saveUserProfile(user: user, userModel: userModel)
            
            fetchUserProfile { userProfile in
                completion(nil, userProfile)
            }
        }
    }
    
    func loginUser(withCredential authCredential: AuthCredentials, completion: @escaping (Error?, _ userProfile: UserModel?) -> ()){
        Auth.auth().signIn(withEmail: authCredential.email, password: authCredential.password) { (result, error) in
            
            if let error = error {
                print("DEBUG: Error writing document: \(error.localizedDescription)")
                completion(error, nil)
            }
            
            fetchUserProfile { userProfile in
                completion(nil, userProfile)
            }
        }
    }
    
    private func saveUserProfile(user: Firebase.User, userModel: UserModel){
        
        try? COLLECTION_USER_PROFILE.document(user.uid).setData(from: userModel, merge: true){  error in
            if let error = error {
                print("DEBUG: Error writing document: \(error.localizedDescription)")
                return
            }
        }
    }
}
