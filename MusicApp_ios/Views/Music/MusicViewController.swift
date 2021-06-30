//
//  MusicViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/06/30.
//

import UIKit
import RxSwift
import RxCocoa

class MusicViewController: UIViewController {
  
  @IBOutlet weak var musicImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var artistLabel: UILabel!
  @IBOutlet weak var musicSlider: UISlider!
  @IBOutlet weak var firstTimerLabel: UILabel!
  @IBOutlet weak var endTimerLabel: UILabel!
  @IBOutlet weak var startImageView: UIImageView!
  @IBOutlet weak var beforeImageView: UIImageView!
  @IBOutlet weak var afterImageView: UIImageView!
  
  private let disposeBag = DisposeBag()
  
  // tapGuesture
  private var musicTapGuesture: UITapGestureRecognizer!
  private var isStart: Bool = true

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTapGuesture()
  }
  
  private func setupTapGuesture() {
    musicTapGuesture = UITapGestureRecognizer()
    addTapGesture(view: startImageView, tapGuesture: musicTapGuesture)
    // ACTION
    musicTapGuesture.rx.event
      .subscribe(onNext: { _ in
        if self.isStart {
          self.startImageView.image = UIImage(named: "music_stop")
          self.isStart = false
        }else {
          self.startImageView.image = UIImage(named: "music_start")
          self.isStart = true
        }
      })
      .disposed(by: disposeBag)
  }
  
  
  
  @objc func close() {
    self.dismiss(animated: true, completion: nil)
  }

}
// MARK: -- layoutConfigure
extension MusicViewController {
  override func viewWillLayoutSubviews() {
    layoutConfigure()
  }
  
  private func layoutConfigure() {
    self.view.backgroundColor = .backgroundColor()
    // image
    musicImageView.image = UIImage(named: "oneokrock")
    musicImageView.contentMode = .scaleAspectFill
    // title
    titleLabel.textColor = .textColor()
    artistLabel.textColor = .placeHolderColor()
    // timer
    firstTimerLabel.textColor = .textColor()
    endTimerLabel.textColor = .textColor()
    // slider
    musicSlider.value = 0
    musicSlider.minimumTrackTintColor = .mainColor()
    musicSlider.maximumTrackTintColor = .placeHolderColor()
  }
  
  // add tapGesture
  private func addTapGesture(view: UIView, tapGuesture: UITapGestureRecognizer) {
    view.isUserInteractionEnabled = true
    view.addGestureRecognizer(tapGuesture)
  }
}
