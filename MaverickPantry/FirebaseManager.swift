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
	static var globalOrders : [Order]? = []
	static var globalRecipes : [Recipe]? = []
	static var globalInventory : [DummyFood]? = []
	
	static func Login(email: String, password: String, completion: @escaping (_ success: Bool, Error?) -> Void) {
		
		Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
			if let error = error {
				print(error.localizedDescription)
				print(error.self)
				completion(false, error as! Error)
			} else if !email.contains("@unomaha.edu") {
				print("bad email")
			} else {
				currentUser = user?.user
				currentUserId = (user?.user.uid)!
				
				//we need to go into database and retrieve the info about the user and set them as the global here.
				databaseRef.collection("Users").document(currentUserId).getDocument { (document, error) in
					
					let time = document?.get("timestamp1") as! Timestamp
					let time2 = document?.get("timestamp2") as! Timestamp
					let adminTest = document?.get("isAdmin")
					let admin: Bool
					//					time.dateValue()
					if adminTest as! Int == 0 {
						admin = false
					} else {
						admin = true
					}
					
					
					globalUser = Users.init(isAdmin: admin, email: document?.get("email") as! String, initials: document?.get("initials") as! String, monthOfBirth: document?.get("monthOfBirth") as! Int, dayOfBirth: document?.get("dayOfBirth") as! Int, NUID: document?.get("NUID") as! String, uid: document?.get("uid") as! String, request1: document?.get("request1") as! [String], request2: document?.get("request2") as! [String], timestamp1: time.dateValue() as NSDate, timestamp2: time2.dateValue() as NSDate)
					
					completion(true, nil)
					
				}
			}
		}
	}
	
	static func CreateAccount(email: String, password: String, initials: String, monthOfBirth: Int, dayOfBirth: Int, isAdmin: Bool, NUID: String, completion: @escaping (_ result: Bool) -> Void) {
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
				
				Auth.auth().currentUser?.sendEmailVerification { (error) in
					if let error = error {
						print(error.localizedDescription)
					} else {
						print("sent")
					}
					
				}
				
				let c = NSDateComponents()
				c.year = 2000
				c.month = 1
				c.day = 1
				// Get NSDate given the above date components
				let date = NSCalendar(identifier: NSCalendar.Identifier.gregorian)?.date(from: c as DateComponents)
				
				addUser(isAdmin: false, email: email, initials: initials, monthOfBirth: monthOfBirth, dayOfBirth: dayOfBirth, NUID: NUID, request1: [], request2: [], timestamp1: date as! NSDate, timestamp2: date as! NSDate)
				Login(email: email, password: password, completion: { (success, err)  in
					if success {
						print("Login successful after account creation.")
						completion(true)
						
					} else {
						print("Login not successful after account creation")
						completion(false)
					}
				})
			}
		}
	}
	
	
	static func addUser(isAdmin: Bool, email: String, initials: String, monthOfBirth: Int, dayOfBirth: Int, NUID: String, request1: [String], request2: [String], timestamp1: NSDate, timestamp2: NSDate) {
		let uid = Auth.auth().currentUser?.uid
		if !email.contains("@unomaha.edu") {
			
		}
		else
		{
			Users.init(isAdmin: isAdmin, email: email, initials: initials, monthOfBirth: monthOfBirth, dayOfBirth: dayOfBirth, NUID: NUID, uid: uid!, request1: request1, request2: request2, timestamp1: timestamp1, timestamp2: timestamp2)
			
			//        databaseRef.child("users").child(uid!).setValue(post)
			databaseRef.collection("Users").document(uid!).setData([
				"initials": initials,
				"monthOfBirth": monthOfBirth,
				"dayOfBirth": dayOfBirth,
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
	
	
	
	
	static func addRequestsToUser(requests: [String], completion: @escaping (Bool) -> Void) {
		
		
		//check globalUsers requests
		var check = true
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
			check = false
			completion(false)
		}
		
		if check {
		completion(true)
		}
	}
	
	
	static func clearOldRequests(completion: @escaping (Bool) -> Void) {
		
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
		completion(true)
	}
	
	static func addOrder(order: Order, completion: @escaping (Bool) -> Void) {
		databaseRef.collection("Orders").document("Order: \(order.initials!) \(order.monthOfBirth!):\(order.dayOfBirth!) \(order.timestamp!)").setData(["requests": order.requests!,
																																						"initials": order.initials!,"monthOfBirth": order.monthOfBirth!, "dayOfBirth": order.dayOfBirth!, "timestamp": order.timestamp!, "isReady": order.isReady!])
		print("add order")
		completion(true)
	}
	
	
	
	
	static func getOrders(completion: @escaping ([Order], Error?) -> Void ){
		var orders = [Order]()
		
		databaseRef.collection("Orders").getDocuments() { (querySnapshot, err) in
			if let err = err {
				print("Error getting documents: \(err)")
				completion([Order](), err)
			} else {
				for document in querySnapshot!.documents {
					//					let data = document.data()
					
					let requests = document.get("requests")! as! [String]
					let initials = document.get("initials")! as! String
					let timestamp = document.get("timestamp") as! Double
					let isReady = document.get("isReady") as! Bool
					let MOB = document.get("monthOfBirth") as! Int
					let DOB = document.get("dayOfBirth") as! Int
					
					let order = Order(requests: requests, intitials: initials, timestamp: timestamp, isReady: isReady, monthOfBirth: MOB, dayOfBirth: DOB)
					
					orders.append(order)
					if orders.count == querySnapshot!.documents.count {
						completion(orders, nil)
					}
					print("get orders** Order: \(order.initials)")
				}
			}
		}
	}
	
	static func deleteFromOrders(orderName: String, completion: @escaping (Bool) -> Void) {
		print(orderName)
		databaseRef.collection("Orders").document(orderName).delete() { err in
			if let err = err {
				print("Error removing document: \(err)")
				completion(false)
			} else {
				print("Document successfully removed!")
				completion(true)
			}
		}
		
	}
	
	static func addInventoryItem(item: DummyFood, completion: @escaping (Bool) -> Void) {
		databaseRef.collection("Inventory").document("\(item.name!)").setData(["amountGivenAway": item.amountGiven, "currentAmount": item.amountLeft, "name": item.name])
		print("added inventory item")
		completion(true)
	}
	
	static func getInventory(completion: @escaping ([DummyFood], Error?) -> Void ){
		var items = [DummyFood]()
		
		databaseRef.collection("Inventory").getDocuments() { (querySnapshot, err) in
			if let err = err {
				print("Error getting documents: \(err)")
				completion([DummyFood](), err)
			} else {
				for document in querySnapshot!.documents {
					//					let data = document.data()
					
					let name = document.get("name")! as! String
					let amountLeft = document.get("currentAmount")!
					let amountAvailable = document.get("amountGivenAway")!
					
					let item = DummyFood(name: name, amountLeft: amountLeft as! Int, amountGiven: amountAvailable as! Int)
					
					items.append(item)
					if items.count == querySnapshot!.documents.count {
						completion(items, nil)
					}
					print("Order: \(item.name)")
				}
			}
		}
	}
	
	
	static func getRecipes(completion: @escaping ([Recipe], Error?) -> Void ){
		var recipes = [Recipe]()
		
		databaseRef.collection("recipes").getDocuments() { (querySnapshot, err) in
			if let err = err {
				print("Error getting documents: \(err)")
				completion([Recipe](), err)
			} else {
				for document in querySnapshot!.documents {
					//					let data = document.data()
					
					let ingredients = document.get("ingredients")! as! [String]
					let recipeTime = document.get("time")! as! String
					let cookTime = document.get("cookTime")! as! String
					let image = document.get("image") as! String
					let recipeDescription = document.get("description") as! String
					let recipeDirections = document.get("directions") as! [String]
					let recipeName = document.get("name") as! String
					let recipeServing = document.get("serving") as! String
					
					let recipe = Recipe(recipeName: recipeName, ingredients: ingredients, recipeTime: recipeTime, cookTime: cookTime, image: image, recipeDescription: recipeDescription, recipeDirections: recipeDirections, recipeServing: recipeServing)
					
					recipes.append(recipe)
					if recipes.count == querySnapshot!.documents.count {
						completion(recipes, nil)
					}
					print("Recipe: \(recipe.recipeName)")
				}
			}
		}
	}
	static func addQuestionForm(item:QuestionForm, completion: @escaping (Bool) -> Void) {
		databaseRef.collection("QuestionForm").document(item.NUID as! String).setData(["NUID": (item.NUID as! String),"firstIntial": item.firstInitial, "middleInitial": item.middleInitial, "lastInitial": item.lastInitial,"birthDate": item.birthDate, "allergies":item.allergies, "comments": item.comments,"affiliation":item.affiliation, "onOrOffCampus":item.onOrOffCampus,"householdSize":item.householdSize,"methodOfHearing":item.methodOfHearing,"canOpener":item.canOpenerBool,"bag":item.bagBool])
		
		completion(true)
	}
	
}


