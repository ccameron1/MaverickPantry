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
	static var globalUser : Users!
	
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
				//we need to go into database and retrieve the info about the user and set them as the global here.
				databaseRef.collection("Users").document(currentUserId).getDocument { (document, error) in
					globalUser = Users.init(isAdmin: ((document?.get("isAdmin")) != nil), email: document?.get("email") as! String, initials: document?.get("initials") as! String, yearOfBirth: document?.get("yearOfBirth") as! Int, NUID: document?.get("NUID") as! String, uid: document?.get("uid") as! String, request1: document?.get("request1") as! [String], request2: document?.get("request2") as! [String])
					
					
				}
			}
		}
	}
	
	static func CreateAccount(email: String, password: String, initials: String, yearOfBirth: Int, isAdmin: Bool, NUID: String, completion: @escaping (_ result: Bool) -> Void) {
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
				addUser(isAdmin: false, email: email, initials: initials, yearOfBirth: yearOfBirth, NUID: NUID, request1: [], request2: [])
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
	
	
	static func addUser(isAdmin: Bool, email: String, initials: String, yearOfBirth: Int, NUID: String, request1: [String], request2: [String]) {
		let uid = Auth.auth().currentUser?.uid
		if !email.contains("@unomaha.edu") {
			print("bad email AAAAAAAAAAAAAAAAAAAAAA")
		}
		else
		{
			Users.init(isAdmin: isAdmin, email: email, initials: initials, yearOfBirth: yearOfBirth, NUID: NUID, uid: uid!, request1: request1, request2: request2)
			
			//        databaseRef.child("users").child(uid!).setValue(post)
			databaseRef.collection("Users").document(uid!).setData([
				"initials": initials,
				"yearOfBirth": yearOfBirth,
				"email": email,
				"isAdmin": isAdmin,
				"NUID" : NUID,
				"uid" : uid!,
				"request1": request1,
				"request2": request2])
		}
		//		databaseRef.collection("Users").document(uid!).getDocument { (document, error) in
		//			globalUser = Users.init(isAdmin: isAdmin, email: document?.get("email") as! String, initials: document?.get("initials") as! String, yearOfBirth: document?.get("yearOfBirth") as! Int, NUID: document?.get("NUID") as! String, uid: document?.get("uid") as! String)
	}
	
	
	
	
	static func addRequestsToUser(requests: [String]) {
		
		
		//check globalUsers requests
		if globalUser.request1.count == 0 {
			globalUser.request1 = requests
			databaseRef.collection("Users").document(globalUser.uid).setData([ "request1": requests ], merge: true)
		} else if globalUser.request2.count == 0 {
			globalUser.request2 = requests
			databaseRef.collection("Users").document(globalUser.uid).setData([ "request2": requests ], merge: true)
		} else {
			print("Have 2 requests already")
			print(globalUser.request2.count)
		}
	}
	
	
}
