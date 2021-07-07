//
//  BaseViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/07.
//

import UIKit

class BaseViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presentStartPageIfNeeded()
  }
  
  private func presentStartPageIfNeeded() {
    if UserDefaults.standard.bool(forKey: "login") {
      // User has already logged in.
    } else {
      let vc = StartViewController()
      let naviController = MusicNavigationController(rootViewController: vc)
      naviController.navigationBar.setBackgroundImage(UIImage(), for: .default)
      naviController.navigationBar.shadowImage = UIImage()
      naviController.modalPresentationStyle = .fullScreen // modal .full
      present(naviController, animated: true, completion: nil) // startVC
    }
  }

}
