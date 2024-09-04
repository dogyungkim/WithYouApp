//
//  LoginViewController.swift
//  WithYou
//
//  Created by 이승진 on 2024/01/26.
//  Copyright © 2024 withyou.org. All rights reserved.
//

import Alamofire
import AuthenticationServices
import CryptoKit
import Core
import Domain
import Foundation
//import GoogleSignIn
import KakaoSDKAuth
import KakaoSDKCommon
import KakaoSDKUser
import SnapKit
import RxCocoa
import RxSwift
import UIKit

public protocol LoginDelegate {
    func moveToTabbar()
}

public final class LoginViewController: BaseViewController {

    fileprivate var currentNonce: String?
    
    let viewModel : LoginViewModel
    
    public var coordinator : LoginDelegate?
    
    public init(currentNonce: String? = nil, viewModel: LoginViewModel) {
        self.currentNonce = currentNonce
        self.viewModel = viewModel
        super.init()
    }
    
    lazy var loginView = LoginView()
    
    public override func setFunc() {
        loginView.appleLoginButton
            .rx
            .tap
            .withUnretained(self)
            .subscribe{ (owner,_)in
                owner.viewModel.appleLogin()
            }
            .disposed(by: disposeBag)
        
        loginView.kakaoLoginButton
            .rx
            .tap
            .withUnretained(self)
            .subscribe{ (owner,_) in
                //owner.viewModel.kakaoLogin()
                owner.coordinator?.moveToTabbar()
            }
            .disposed(by: disposeBag)
        
        viewModel.loginService
            .loginResultSubject
            .withUnretained(self)
            .subscribe(onNext: { (owner,result) in
                print(result)
                if result {
                    owner.coordinator?.moveToTabbar()
                }
            })
            .disposed(by: disposeBag)
    }
    
    public override func setUpViewProperty() {
        view.backgroundColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1)
    }
    
    public override func setUp() {
        view.addSubview(loginView)
    }
    
    public override func setLayout() {
        loginView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
}
