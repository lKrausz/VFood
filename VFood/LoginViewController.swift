//
//  LoginViewController.swift
//  VFood
//
//  Created by Виктория Козырева on 10.05.2021.
//

import UIKit
import VK_ios_sdk

class LoginViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func loginButtonClicked(_ sender: Any) {
        let sdkInstance = VKSdk.initialize(withAppId: Configs.shared.VK_APP_ID)
        sdkInstance?.register(self)
        sdkInstance?.uiDelegate = self
    }

}

extension LoginViewController: VKSdkDelegate, VKSdkUIDelegate {
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        print("token = \(String(describing: result.token))")
        Configs.shared.setToken(token: result.token)
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
