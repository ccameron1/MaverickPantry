//
//  FirebaseManager.swift
//  MaverickPantry
//
//  Created by Carly Cameron on 6/19/19.
//  Copyright © 2019 Carly Cameron. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class FirebaseManager {
    
    static let databaseRef = Firestore.firestore()
    static var currentUserId: String = ""
    static var currentUser : User?
    
    static func Login(email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                print(error.self)
                completion(false)
            } else if !email.contains("@unomaha.edu") {
                print("bad email")
            } else {
                currentUser = user?.user
                currentUserId = (user?.user.uid)!
                completion(true)
            }
        }
    }
    
    static func CreateAccount(email: String, password: String, initials: String, yearOfBirth: Int, isAdmin: Bool, completion: @escaping (_ result: Bool) -> Void) {
		if !email.contains("@unomaha.edu") {
			print("bad email AAAAAAAAAAAAAAAAAAAAAA")
		}
		else
		{
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            addUser(isAdmin: false, email: email, initials: initials, yearOfBirth: yearOfBirth)
            Login(email: email, password: password, completion: { (success) in
                if success {
                    print("Login successful after account creation.")
                    
                } else {
                    print("Login not successful after account creation")
                }
            })
        }
		}
    }
    
    static func addUser(isAdmin: Bool, email: String, initials: String, yearOfBirth: Int) {
        let uid = Auth.auth().currentUser?.uid
        if !email.contains("@unomaha.edu") {
            print("bad email AAAAAAAAAAAAAAAAAAAAAA")
        }
        else
        {
            Users.init(isAdmin: isAdmin, email: email, initials: initials, yearOfBirth: yearOfBirth)
			
        //        databaseRef.child("users").child(uid!).setValue(post)
        databaseRef.collection("Users").addDocument(data: [
            "initials": initials,
            "yearOfBirth": yearOfBirth,
            "email": email,
            "isAdmin": isAdmin])
		}
    }
    
}
