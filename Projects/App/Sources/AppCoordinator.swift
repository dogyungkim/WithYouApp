//
//  AppCoordinator.swift
//  App
//
//  Created by 김도경 on 5/26/24.
//  Copyright © 2024 withyou.org. All rights reserved.
//

import Core
import Data
import Domain
import Foundation
import HomeFeature
import LoginFeature
import UIKit

class AppCoordinator : Coordinator {
    var childCoordinaotrs : [Coordinator] = []
    private var navigationController : UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // 만약 처음이라면 OnBoarding
        // OnBoarding을 했으면 Login
        // 로그인이 된 상태라면 로그인 진행
        
//        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
//        loginCoordinator.start()
        let homeViewModel = MainLogViewModel(useCase: DefaultLogUseCase(repository: DefaultLogRepository()))
        let homeDependency = HomeCoordinator.Dependecy.init(navigationController: navigationController,
                                                            viewModel: homeViewModel)
        
        let homeCoordinator = HomeCoordinator(dependency: homeDependency)
        homeCoordinator.start()
        
        self.childCoordinaotrs.append(homeCoordinator)
    }
}
