//
//  RecommendViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/24.
//

import UIKit
import RxSwift
import RxCocoa

class RecommendViewController: UIViewController {
  
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }

}
extension RecommendViewController {
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layoutConfigure()
  }
  
  private func layoutConfigure() {
    self.view.backgroundColor = .backgroundColor()
  }
}
