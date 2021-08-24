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
  
  @IBOutlet weak var backView1: UIView!
  @IBOutlet weak var backView2: UIView!
  @IBOutlet weak var genreView: UIView!
  @IBOutlet weak var genreImageView: UIImageView!
  @IBOutlet weak var yesButton: UIButton!
  @IBOutlet weak var noButton: UIButton!
  
  private var viewModel: GenreViewModel?
  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewModel()
  }
  
  private func setupViewModel() {
    viewModel = GenreViewModel()
    let input = GenreViewModelInput(yesButton: yesButton.rx.tap.asObservable(),
                                    noButton: noButton.rx.tap.asObservable())
    viewModel?.setupActions(input: input)
    
    // outputs
    viewModel?.outputs?.showChangeObservable
      .subscribe(onNext: { value in
        if value {
          
        }
      })
      .disposed(by: disposeBag)
    
    
    viewModel?.outputs?.showViewObservable
      .subscribe(onNext: { value in
        print("test", value)
        if value {
          self.dismiss(animated: true, completion: nil)
        }
      })
      .disposed(by: disposeBag)
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
    // backView
    backView1.backgroundColor = UIColor.rgba(red: 0, green: 0, blue: 0, alpha: 0.15)
    backView1.layer.cornerRadius = 5.0
    backView2.backgroundColor = UIColor.rgba(red: 0, green: 0, blue: 0, alpha: 0.15)
    backView2.layer.cornerRadius = 5.0
    // genre
    genreView.layer.cornerRadius = 5.0
    // yes
    yesButton.backgroundColor = .navyColor()
    yesButton.setTitleColor(.white, for: .normal)
    yesButton.layer.cornerRadius = 10.0
    // no
    noButton.backgroundColor = .white
    noButton.layer.borderWidth = 0.3
    noButton.layer.borderColor = UIColor.placeHolderColor().cgColor
    noButton.setTitleColor(.textColor(), for: .normal)
    noButton.layer.cornerRadius = 10.0
  }
}
