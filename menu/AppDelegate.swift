//
//  AppDelegate.swift
//  menu
//
//  Created by SimranjeetSingh Gill on 2019-09-18.
//  Copyright © 2019 lambton. All rights reserved.
//

import UIKit
import CoreData
import GooglePlaces
import GoogleMaps
import IQKeyboardManagerSwift


let appDelegate = (UIApplication.shared.delegate as? AppDelegate)

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate,CLLocationManagerDelegate {

    var window: UIWindow?
    let userDB = DB_User()
    var currentLocation : CLLocation?
    var locationManager : CLLocationManager?
    var currentLocationCoordinates = CLLocationCoordinate2D()
    var int_distance = Int()
    var address = String()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        
        print("didFinishLaunchingWithOptions")
        GMSServices.provideAPIKey("AIzaSyBBmo2PYxM0xuXZVv7rakhJVxvkT4V52Yg")
        GMSPlacesClient.provideAPIKey("AIzaSyBBmo2PYxM0xuXZVv7rakhJVxvkT4V52Yg")
        
        
        //database and table setup
//        do {
//            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//            let fileUrl = documentDirectory.appendingPathComponent("usersDB").appendingPathExtension("sqlite3")
//            //            let database = try Connection(fileUrl.path)
//            //            self.database = database
//        } catch {
//            print("error during database connection",error)
//        }
        
        //        createTable()
        userDB.createTable()
        userDB.createTableForMeal()
        location()
        // Override point for customization after application launch.
        return true
    }
    // MARK: - Location Manager -
    func location(){
        currentLocation = CLLocation(latitude: 0, longitude: 0)
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        self.locationManager?.requestAlwaysAuthorization()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation = locations.last
        let center = CLLocationCoordinate2D(latitude: userLocation!.coordinate.latitude, longitude: userLocation!.coordinate.longitude)
        currentLocationCoordinates = center
        locationManager?.stopUpdatingLocation()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print(" applicationWillResignActive")

        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print(" applicationDidEnterBackground")

        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print(" applicationWillEnterForeground")

        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print(" applicationDidBecomeActive")

        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print(" applicationWillTerminate")

        //self.saveContext()

        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}


