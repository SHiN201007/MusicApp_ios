//
//  AccountSettingViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/14.
//

import UIKit
import RxSwift
import RxCocoa
import KRProgressHUD

class AccountSettingViewController: UIViewController {

  // icon
  @IBOutlet weak var userIconImageView: UIImageView!
  @IBOutlet weak var uploadImageView: UIImageView!
  // user name
  @IBOutlet weak var userNameView: UIView!
  @IBOutlet weak var userImageView: UIImageView!
  @IBOutlet weak var userNameTextField: UITextField!
  // gender
  @IBOutlet weak var manButton: UIButton!
  @IBOutlet weak var womanButton: UIButton!
  // term
  @IBOutlet weak var checkboxImageView: UIImageView!
  @IBOutlet weak var termButton: UIButton!
  @IBOutlet weak var termLabel: UILabel!
  // done
  @IBOutlet weak var doneButton: UIButton!
  
  // tapGesture
  private var iconTapGesture: UITapGestureRecognizer!
  private var checkboxTapGesture: UITapGestureRecognizer!
  
  private var isCheckmark: Bool = false
  
  private var viewModel: AccountSettingViewModel?
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    setupViewModel()
    
    
    setupImageView()
  }
  
  private func configure() {
    // manButton
    setupButton(button: manButton)
    // womanButton
    setupButtonOff(button: womanButton)
    
    // checkbox
    setupCheckboxOff()
  }
  
  private func setupImageView() {
    // icon
    userIconImageView.image = UIImage(named: "upload_userIcon")
    iconTapGesture = UITapGestureRecognizer()
    addTapGesture(imageView: userIconImageView, tapGuesture: iconTapGesture) /// add tapGesture
    // checkbox
    checkboxTapGesture = UITapGestureRecognizer()
    addTapGesture(imageView: checkboxImageView, tapGuesture: checkboxTapGesture) /// add tapGesture
    
    // actions
    disposeBag.insert {
      /// tap icon
      iconTapGesture.rx.event
        .subscribe(onNext: { _ in
          self.setImagePicker()
        })
      /// tap checkbox
      checkboxTapGesture.rx.event
        .subscribe({ _ in
          if self.isCheckmark {
            self.setupCheckboxOff()
          }else {
            self.setupCheckboxOn()
          }
        })
    }
  }
  
  private func setImagePicker() {
    let imagePickerController = UIImagePickerController()
    imagePickerController.sourceType = .photoLibrary
    imagePickerController.delegate = self
    KRProgressHUD.show(withMessage: "Loading...", completion: nil)
    self.present(imagePickerController,animated: true,completion: {
      KRProgressHUD.dismiss()
    })
  }
  
  
  // MARK: -- ViewModel
  private func setupViewModel() {
    viewModel = AccountSettingViewModel()
    let input = AccountSettingViewModelInput(doneButton: doneButton.rx.tap.asObservable())
    viewModel?.setupActions(input: input)
    
    
    // outputs
    viewModel?.outputs?.showViewObservable
      .subscribe(onNext: { value in
        if value {
          self.showViewController(vc: GenreViewController(), title: "このジャンルは好みですか？")
        }
      })
      .disposed(by: disposeBag)
  }
  
  private func showViewController(vc: UIViewController, title: String) {
    vc.title = title
    self.navigationController?.pushViewController(vc, animated: true)
  }

}

extension AccountSettingViewController {
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layoutConfigure()
  }
  
  private func layoutConfigure() {
    self.view.backgroundColor = .backgroundColor()
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    // user icon
    userIconImageView.contentMode = .scaleAspectFill
    userIconImageView.layer.borderWidth = 1.0
    userIconImageView.layer.borderColor = UIColor.placeHolderColor().cgColor
    userIconImageView.layer.cornerRadius = self.userIconImageView.bounds.width / 2
    uploadImageView.image = UIImage(named: "upload")
    
    // user name
    userNameView.backgroundColor = .white
    userNameView.layer.cornerRadius = 10.0
    userNameView.layer.borderWidth = 0.3
    userNameView.layer.borderColor = UIColor.placeHolderColor().cgColor
    /// image view
    userImageView.image = UIImage(named: "user")
    /// textField
    userNameTextField.textColor = .textColor()
    // term
    /// checkbox
    checkboxImageView.backgroundColor = .white
    checkboxImageView.layer.cornerRadius = self.checkboxImageView.bounds.width / 2
    /// label
    termLabel.textColor = .textColor()
    /// term
    termButton.setTitleColor(.navyColor(), for: .normal)
    
    // done
    doneButton.backgroundColor = .mainColor()
    doneButton.layer.cornerRadius = 10.0
    doneButton.setTitleColor(.white, for: .normal)
  }
  
  // MARK: gender selects
  private func setupButton(button: UIButton) {
    button.backgroundColor = .navyColor()
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 10.0
  }
  
  private func setupButtonOff(button: UIButton) {
    button.backgroundColor = .white
    button.layer.borderWidth = 0.3
    button.layer.borderColor = UIColor.placeHolderColor().cgColor
    button.setTitleColor(.textColor(), for: .normal)
    button.layer.cornerRadius = 10.0
  }
  
  // MARK: -- checkbox
  private func setupCheckboxOn() {
    self.checkboxImageView.layer.borderWidth = 0
    self.checkboxImageView.image = UIImage(named: "check")
    self.isCheckmark = true
  }
  private func setupCheckboxOff() {
    self.checkboxImageView.layer.borderWidth = 1.0
    self.checkboxImageView.layer.borderColor = UIColor.navyColor().cgColor
    self.checkboxImageView.image = nil
    self.isCheckmark = false
  }
  
  // add tapGesture
  private func addTapGesture(imageView: UIImageView, tapGuesture: UITapGestureRecognizer) {
    imageView.isUserInteractionEnabled = true
    imageView.addGestureRecognizer(tapGuesture)
  }
}
extension AccountSettingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//    if let image = info[.originalImage] as! UIImage? {
//      guard let data = (image.jpegData(compressionQuality: 0.05)) else { return }
//      let model = UserSettingModel()
//      KRProgressHUD.show(withMessage: "uploading...", completion: nil)
//      model.uploadImage(imageData: data, completion: {
//        KRProgressHUD.showSuccess(withMessage: "アップロード完了")
//      })
//      userIconImageView.image = image
//    }else {
//      print("error")
//      KRProgressHUD.showError(withMessage: "アップロード失敗")
//    }
    self.dismiss(animated: true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    self.dismiss(animated: true, completion: nil)
  }
}
