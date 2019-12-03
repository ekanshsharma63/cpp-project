//
//  GlobalConstants.swift
//  Child Journal
//
//  Created by Macrew on 11/06/18.
//  Copyright © 2018 Macrew. All rights reserved.
//
//

import Foundation


struct GlobalConstants {
    struct appDetails {
        static let appName = (Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String) ?? ""
        static let website = ""
        static let version = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
        static let stripeKey = "pk_test_1qPkEqzZO3qPmtqZQXmiZtw0"
        //static let stripeKey = "pk_live_MbzF9s5P61cdQJzDG0jbcjiU00QACPoUuz"
    }
	
    struct API {
        static let baseURL = ""
    }
	
	static let stripeBankLimit = 20
	static let StripeBankPayment_add_new = "add_new"
	static let StripeBankPayment_old_used = "old_used"
	static let SelectionOfNewAccountDetails = "yes"
	
	struct BluePay {
		static let AccountID = "100729951155"
		static let SecretKey = "ZAZLF3ONGVGXW11NGQ89GMW0FF1XO3WB"
		static let TransMode = "LIVE"
		static let TransType = "SALE"
		static let MerchantID = "100729951155"
	}
	
	struct TextFieldsMessages {
		static let Firstname = "Enter FirstName!"
        static let lastname = "Enter LastName!"
		static let accountNumber = "Enter your bank account number!"
		static let routingNumber = "Enter your bank routing number!"
		static let cardNumber = "Enter your card number!"
		static let cardExpire = "Enter your card expiration date!"
		static let cvc = "Enter your cvc!"
		static let month = "Enter Expiration Month!"
		static let year = "Enter Expiration Year!"
	}
	
	static let BluePayTypeMessage = "Please Select Any BluePay Payment Method"
	static let mandatoryText = "Please fill required fields"
	
	
    struct DegRadian
    {
        static var DegRadianValue = 0.0
    }
	
	struct Placeholder {
		static let message = "Message"
		static let placeholderMessage = "Enter Message"
		static let checkInPlaceholder = "Enter CheckIn Message"
		static let checkOutPlaceholder = "Enter CheckOut Message"

	}
	
	struct  EmptyTextfieldErrorMessage {
		static let EnterMessage = "Please enter message field!"
		static let checkInMessage = "Please fill checkIn message field!"
		static let checkOutMessage = "Please fill checkOut message field!"
	}
	  
    struct ApiErrorMessage {
        static let noNetwork = "Does not work in offline mode"
        static let timeOut = "Timeout!\nPlease check your internet connection and try again."
        static let serverError = "Something went wrong, please try again!"
        static let unknown = "Unknown error occurred!"
        static let unauthorised = "Unauthorized Data."
        static let internalError = "Sorry, internal error occurred!"
        static let noInternetActivityPost = "Offline Mode, Activities posted will be available after the internet connection is established."
        
    }
    
    struct Messages {
        static let activityPostSuccessFully = " posted successfully"
		static let deleteMessage = "Do you want to delete this activity, it will be gone forever? "
		static let deleteBankAccount = "Do you want to remove this account? "
        static let notApendingPayment = "NO OUTSTANDING AMOUNT LEFT."
        static let markPresent = "Do you want to mark this student present ?"
        static let register = "Register your center from your laptop/computer by visiting www.mychildjournal.com"
		static let editActivitySuccessfullMessage = "Activity Message Updated Successfully!"
		static let selectAtleastOneAccountMessage = "Please select any account for payment"
    }
	
    struct TableName {
        static let dayCare = "dayCare"
        static let room = "room"
        static let student = "student"
        static let activity = "activity"
        static let absent = "absent"
        static let staff_attendance = "staff_attendance"
		static let activityDeleted = "activity_deleted"
        static let activityUpdate = "activity_updated"
		static let studentActivity = "studActivityRef"
		static let teacherActivity = "studTeachActivityRef"
        static let emailFlag = "email_flags"
    }
	
    static let maxTimeHours = 12
    static let napStart = 0
    static let napEnd = 1
    static let chatPageSize = 50
    static let pageSize = 21
    static let dateFormat = "MM/dd/yyyy"
    static let dateFormatWithTime = "MM/dd/yyyy HH:mm:ss.zzzz"
    static let dateFormatWithHours = "MM/dd/yyyy hh:mm:ss"
    static let timeWithZone = "HH:mm:ss.zzzz"
    static let paymentDateFormat = "MMM dd, YYYY"
    static let activityName = ["Check In/Out/Absent","Food","Pee/Potty","Incident","Nap","Photo/Video","Meds","Notes","Learning"]
    static let activityNameForReport = ["Check In/Out","Food","Pee/Potty","Incident","Nap","Photo/Video","Meds","Notes","Absent","Learning"]
    static let activityType = ["CheckInOut","Food","PeePotty","Incident","Nap","Custom","Medicines","Notes","Absent","Learning"]
  
}

