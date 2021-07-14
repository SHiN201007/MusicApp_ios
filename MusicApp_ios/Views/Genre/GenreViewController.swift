//
//  GenreViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/14.
//

import UIKit
import RxSwift
import RxCocoa

class GenreViewController: UIViewController {
  
  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  
}
// MARK: -- layoutConfigure
extension GenreViewController {
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layoutConfigure()
  }
  
  private func layoutConfigure() {
    self.view.backgroundColor = .backgroundColor()
  }
}
