//
//  LoginViewModel.swift
//  LoginFeature
//
//  Created by 김도경 on 5/25/24.
//  Copyright © 2024 withyou.org. All rights reserved.
//

import AuthenticationServices
import CryptoKit

import Foundation
import RxSwift

public class LoginViewModel {
    
    let loginService : LoginService
    
    public init(loginService: LoginService) {
        self.loginService = loginService
    }
    
    func kakaoLogin(){
        loginService.login(with: .kakao)
    }
    
    func appleLogin() {
        loginService.login(with: .apple)
    }
    
    func googleLogin(_ accessToken : String){
        loginService.login(with: .google, accessToken)
    }
    
}


