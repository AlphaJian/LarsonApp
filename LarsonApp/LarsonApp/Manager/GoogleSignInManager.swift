//
//  GoogleSignInManager.swift
//  LarsonApp
//
//  Created by appledev110 on 10/27/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

typealias responseBlock = () ->Void

private let sharedInstance = GoogleSignInManager()

class GoogleSignInManager: NSObject ,GIDSignInDelegate{
    
    class var sharedManager : GoogleSignInManager {
        return sharedInstance
    }
    
    func googleSignIn(userSignHandler: @escaping responseBlock, noUserSignHandler: @escaping responseBlock) {
        
        FIRApp.configure()
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        
        FIRAuth.auth()?.addStateDidChangeListener { auth, user in
            if (user != nil) {
                // User is signed in.
                userSignHandler()
            } else {
                // No user is signed in.
                noUserSignHandler()
            }
        }
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        saveGoogleAccount(account: user.profile)
        let authentication = user.authentication
        let credential = FIRGoogleAuthProvider.credential(withIDToken: (authentication?.idToken)!,
                                                          accessToken: (authentication?.accessToken)!)
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            // ...
            print(user,error)
//            DataManager.shareManager.insertUser(emial: emial!, accessToken: token!)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user:GIDGoogleUser!,
              withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
    
    func signOut() {
        try!FIRAuth.auth()?.signOut()
        GIDSignIn.sharedInstance().signOut()
    }
    
    func saveGoogleAccount(account : GIDProfileData){
        var usermodel = FileUtility.unarchive(fileName: kAccountFileName) as? UserModel
        if usermodel == nil
        {
            usermodel = UserModel()
        }
        usermodel?.google_email = account.email
        usermodel?.google_imageURL = account.imageURL(withDimension: 120)
        let _ = FileUtility.archive(fileName: kAccountFileName, object: usermodel!)
    }
}
