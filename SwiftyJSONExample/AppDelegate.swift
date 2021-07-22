//
//  AppDelegate.swift
//  SwiftyJSON
//
//  Created by Christos Koninis on 7/22/21.
//

import UIKit
import SwiftyJSON

let jsonString =
"""
{
  "timestamp" : 1626902257093,
  "superchargers" : [
    {
      "location" : {
        "lat" : 63.325319,
        "long" : 10.305137
      },
      "total_stalls" : 19,
      "distance_miles" : 10.064082000000001,
      "type" : "supercharger",
      "site_closed" : false,
      "available_stalls" : 15,
      "name" : "Leinstrand, Norway - Klett"
    },
    {
      "location" : {
        "lat" : 63.466445999999998,
        "long" : 10.91766
      },
      "total_stalls" : 16,
      "distance_miles" : 11.838984999999999,
      "type" : "supercharger",
      "site_closed" : false,
      "available_stalls" : 16,
      "name" : "Stjørdal, Norway"
    },
    {
      "location" : {
        "lat" : 63.734355000000001,
        "long" : 11.281487
      },
      "total_stalls" : 12,
      "distance_miles" : 31.206503999999999,
      "type" : "supercharger",
      "site_closed" : false,
      "available_stalls" : 11,
      "name" : "Levanger, Norway"
    },
    {
      "location" : {
        "lat" : 62.832030000000003,
        "long" : 10.009639999999999
      },
      "total_stalls" : 20,
      "distance_miles" : 44.117753,
      "type" : "supercharger",
      "site_closed" : false,
      "available_stalls" : 17,
      "name" : "Berkåk, Norway"
    }
  ],
  "congestion_sync_time_utc_secs" : 1626902199,
  "destination_charging" : [
    {
      "distance_miles" : 23.366278999999999,
      "name" : "Bårdshaug Herregård",
      "location" : {
        "lat" : 63.299208,
        "long" : 9.8448650000000004
      },
      "type" : "destination"
    },
    {
      "distance_miles" : 38.390034,
      "name" : "Fosen Fjordhotel",
      "location" : {
        "lat" : 63.959356999999997,
        "long" : 10.223908
      },
      "type" : "destination"
    },
    {
      "distance_miles" : 46.220022999999998,
      "name" : "Falksenteret",
      "location" : {
        "lat" : 63.293301999999997,
        "long" : 9.0834460000000004
      },
      "type" : "destination"
    },
    {
      "distance_miles" : 54.981445000000001,
      "name" : "Væktarstua",
      "location" : {
        "lat" : 62.908683000000003,
        "long" : 11.893306000000001
      },
      "type" : "destination"
    }
  ]
}
"""


@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false) {
            let json = try! JSON(data: dataFromString,options: .allowFragments)

            for supercharger in json["superchargers"].arrayValue {
                let jsonName = supercharger["name"].stringValue
                let jsonLat = supercharger["location"]["lat"].doubleValue
                let jsonLong = supercharger["location"]["long"].doubleValue

                print("jsonName=\(jsonName) jsonLat=\(jsonLat) jsonLong=\(jsonLong)")
            }
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

