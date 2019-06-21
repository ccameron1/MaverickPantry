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
					
<<<<<<< HEAD
					let time = document?.get("timestamp1") as! Timestamp
					//					time.dateValue()
=======
				let time = document?.get("timestamp1") as! Timestamp
				let time2 = document?.get("timestamp2") as! Timestamp
//					time.dateValue()
>>>>>>> b862e0c1d3339c0e3c557cebfe0e45ff4e85f75d
					
					globalUser = Users.init(isAdmin: ((document?.get("isAdmin")) != nil), email: document?.get("email") as! String, initials: document?.get("initials") as! String, yearOfBirth: document?.get("yearOfBirth") as! Int, NUID: document?.get("NUID") as! String, uid: document?.get("uid") as! String, request1: document?.get("request1") as! [String], request2: document?.get("request2") as! [String], timestamp1: time.dateValue() as NSDate, timestamp2: time2.dateValue() as NSDate)
					
					
					
					
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
				var c = NSDateComponents()
				c.year = 2000
				c.month = 1
				c.day = 1
				// Get NSDate given the above date components
				var date = NSCalendar(identifier: NSCalendar.Identifier.gregorian)?.date(from: c as DateComponents)
				
				addUser(isAdmin: false, email: email, initials: initials, yearOfBirth: yearOfBirth, NUID: NUID, request1: [], request2: [], timestamp1: date as! NSDate, timestamp2: date as! NSDate)
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
	
	
	static func addUser(isAdmin: Bool, email: String, initials: String, yearOfBirth: Int, NUID: String, request1: [String], request2: [String], timestamp1: NSDate, timestamp2: NSDate) {
		let uid = Auth.auth().currentUser?.uid
		if !email.contains("@unomaha.edu") {
			print("bad email AAAAAAAAAAAAAAAAAAAAAA")
		}
		else
		{
			Users.init(isAdmin: isAdmin, email: email, initials: initials, yearOfBirth: yearOfBirth, NUID: NUID, uid: uid!, request1: request1, request2: request2, timestamp1: timestamp1, timestamp2: timestamp2)
			
			//        databaseRef.child("users").child(uid!).setValue(post)
			databaseRef.collection("Users").document(uid!).setData([
				"initials": initials,
				"yearOfBirth": yearOfBirth,
				"email": email,
				"isAdmin": isAdmin,
				"NUID" : NUID,
				"uid" : uid!,
				"request1": request1,
				"request2": request2,
				"timestamp1": timestamp1,
				"timestamp2": timestamp2])
		}
		//		databaseRef.collection("Users").document(uid!).getDocument { (document, error) in
		//			globalUser = Users.init(isAdmin: isAdmin, email: document?.get("email") as! String, initials: document?.get("initials") as! String, yearOfBirth: document?.get("yearOfBirth") as! Int, NUID: document?.get("NUID") as! String, uid: document?.get("uid") as! String)
	}
	
	
	
	
	static func addRequestsToUser(requests: [String]) {
		
		
		//check globalUsers requests
		if globalUser.request1.count == 0 {
			globalUser.request1 = requests
			
			let timestamp = NSDate().timeIntervalSince1970
			let myTimeInterval = TimeInterval(timestamp)
			let time = NSDate(timeIntervalSince1970: TimeInterval(myTimeInterval))
			
			databaseRef.collection("Users").document(globalUser.uid).setData([ "timestamp1": time ], merge: true)
			
			databaseRef.collection("Users").document(globalUser.uid).setData([ "request1": requests ], merge: true)
		} else if globalUser.request2.count == 0 {
			
			let timestamp = NSDate().timeIntervalSince1970
			let myTimeInterval = TimeInterval(timestamp)
			let time = NSDate(timeIntervalSince1970: TimeInterval(myTimeInterval))
			
			databaseRef.collection("Users").document(globalUser.uid).setData([ "timestamp2": time ], merge: true)
			
			globalUser.request2 = requests
			databaseRef.collection("Users").document(globalUser.uid).setData([ "request2": requests ], merge: true)
		} else {
			print("Have 2 requests already")
			print(globalUser.request2.count)
		}
	}
	
	
<<<<<<< HEAD
	static func clearOldRequests() {
		
		
		
		
		
=======
	static func clearOldRequests(completion: @escaping (Bool) -> Void) {
				
>>>>>>> b862e0c1d3339c0e3c557cebfe0e45ff4e85f75d
		let calendar = Calendar.current
		
		if calendar.component(.weekOfYear, from: globalUser.timestamp1 as Date) != calendar.component(.weekOfYear, from: Date())
		{
			let requests: [String] = []
			globalUser.request1 = requests
			databaseRef.collection("Users").document(globalUser.uid).setData([ "request1": requests ], merge: true)
			print("clear 1")
		}
		if calendar.component(.weekOfYear, from: globalUser.timestamp2 as Date) != calendar.component(.weekOfYear, from: Date())
		{
			let requests: [String] = []
			globalUser.request2 = requests
			databaseRef.collection("Users").document(globalUser.uid).setData([ "request2": requests ], merge: true)
			print("clear 2")
		}
<<<<<<< HEAD
		
		
		
		
=======
		completion(true)
>>>>>>> b862e0c1d3339c0e3c557cebfe0e45ff4e85f75d
	}
	
	
	
}

