//
//  ViewController.swift
//  VFood
//
//  Created by Виктория Козырева on 05.05.2021.
//

import UIKit
import VK_ios_sdk


class ViewController: UIViewController {
    
    let VK_APP_ID = "7847397"
    let score = ["market"]
    var accessToken = VKAccessToken.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        VKSdk.initialize(withAppId: VK_APP_ID).register(self)
        VKSdk.wakeUpSession(score, complete: {(state: VKAuthorizationState,error: Error?) -> Void in
            if state == .authorized {
                print("success")
                //TODO: present work view
            } else {
                VKSdk.authorize(self.score)
                print("need auth")
                //TODO: present login view
            }
            return
        })
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        let sdkInstance = VKSdk.initialize(withAppId: self.VK_APP_ID)
        sdkInstance?.register(self)
        sdkInstance?.uiDelegate = self
    }
}

extension ViewController: VKSdkDelegate, VKSdkUIDelegate {
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print("token = \(String(describing: result.token))")
        self.accessToken = result.token
    }
    
    func vkSdkUserAuthorizationFailed() {
        print("fail")
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        print("should present")
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        print("captcha")
    }
    
    
}

