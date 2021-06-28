//
//  SceneDelegate.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/06/28.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    UITabBar.appearance().tintColor = .mainColor()
    UITabBar.appearance().unselectedItemTintColor = .placeHolderColor()
    UITabBar.appearance().barTintColor = .backgroundColor()
    
    // ViewControllers on TabBar
    var viewControllers: [UIViewController] = []
    
    // Home画面
    let home = setupTabbar(vc: HomeViewController(), title: "HOME", image: nil)
    viewControllers.append(home)
    
    // Search画面
    let search = setupTabbar(vc: SearchViewController(), title: "Search", image: nil)
    viewControllers.append(search)
    
    // Home画面
    let favorite = setupTabbar(vc: FavoriteViewController(), title: "Favorite", image: nil)
    viewControllers.append(favorite)
    
    // Home画面
    let myPage = setupTabbar(vc: MyPageViewController(), title: "MyPage", image: nil)
    viewControllers.append(myPage)
    
    let tabBarController = UITabBarController()
    tabBarController.setViewControllers(viewControllers, animated: false)
    tabBarController.selectedIndex = 0
    
    self.window = UIWindow(windowScene: windowScene)
    self.window?.rootViewController = tabBarController
    self.window?.makeKeyAndVisible()
  }
  
  private func setupTabbar(vc: UIViewController, title: String, image: UIImage?) -> UIViewController {
    let vc = HomeViewController()
    vc.title = title
    // TabBarのアイコン
    let tabBarIcon = UITabBarItem(title: title,
                                  image: image ?? nil,
                                  tag: 0)
    vc.tabBarItem = tabBarIcon
    return MusicNavigationController(rootViewController: vc)
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}

