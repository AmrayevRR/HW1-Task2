//
//  ChangePasswordViewController.swift
//  HW1-Task2
//
//  Created by Ramir Amrayev on 4/12/22.
//

import UIKit
import SnapKit

class ChangePasswordViewController: UIViewController {
    
    let backgroundColor = UIColor(red: 247, green: 247, blue: 247, alpha: 1)
    
    let currentPasswordTextField = CustomTextField()
    var currentPasswordIconIsClick = false
    let currentPasswordImageView = UIImageView()
    let newPasswordTextField = CustomTextField()
    var newPasswordIconIsClick = false
    let newPasswordImageView = UIImageView()
    let repeatPasswordTextField = CustomTextField()
    let forgotLabel = UnderlinedLabel()
    let saveButton = UIButton()
    
    var bottomButtonConstraint = NSLayoutConstraint()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        layoutUI()
        // Do any additional setup after loading the view.
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            self.bottomButtonConstraint.constant -= keyboardSize.height
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        self.bottomButtonConstraint.constant = 0
    }
    
    
    private func layoutUI() {
        view.backgroundColor = backgroundColor
        title = "Изменить пароль"
        
        view.addSubview(currentPasswordTextField)
        view.addSubview(newPasswordTextField)
        view.addSubview(repeatPasswordTextField)
        view.addSubview(forgotLabel)
        view.addSubview(saveButton)
        
        layoutCurrentPasswordTextField()
        layoutNewPasswordTextField()
        layoutRepeatPasswordTextField()
        layoutForgotLabel()
        layoutSaveButton()
    }
    
    private func layoutCurrentPasswordTextField() {
        
        currentPasswordTextField.isSecureTextEntry = true
        currentPasswordTextField.placeholder = "Текущий пароль"
        
        currentPasswordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            $0.height.equalTo(50)
        }
        
        currentPasswordTextField.backgroundColor = .white
        
        setRighImageToTextField(textField: currentPasswordTextField, imageView: currentPasswordImageView, action: #selector(currentPasswordImageViewTapped))
    }
    
    private func setRighImageToTextField(textField: UITextField, imageView: UIImageView, action: Selector) {
        let image = UIImage(systemName: "eye.slash")
        imageView.image = image
        imageView.tintColor = .darkGray
        let contentView = UIView()
        contentView.addSubview(imageView)
        contentView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView.frame = CGRect(x: -10, y: 0, width: 30, height: 20)
        
        textField.rightView = contentView
        textField.rightViewMode = .always
        
        let tap = UITapGestureRecognizer(target: self, action: action)
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }
    
    private func layoutNewPasswordTextField() {
        
        newPasswordTextField.isSecureTextEntry = true
        newPasswordTextField.placeholder = "Новый пароль"
        
        newPasswordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(currentPasswordTextField)
            $0.top.equalTo(currentPasswordTextField.snp.bottom).offset(15)
        }
        
        newPasswordTextField.backgroundColor = .white
        
        setRighImageToTextField(textField: newPasswordTextField, imageView: newPasswordImageView, action: #selector(newPasswordImageViewTapped))
    }
    
    private func layoutRepeatPasswordTextField() {
        repeatPasswordTextField.isSecureTextEntry = true
        repeatPasswordTextField.placeholder = "Повторить новый пароль"
        
        repeatPasswordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(currentPasswordTextField)
            $0.top.equalTo(newPasswordTextField.snp.bottom).offset(15)
        }
        
        repeatPasswordTextField.backgroundColor = .white
    }
    
    private func layoutForgotLabel() {
        forgotLabel.text = "Забыли пароль ?"
        forgotLabel.textColor = .gray
        
        forgotLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(repeatPasswordTextField.snp.bottom).offset(20)
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(forgotLabelTapped))
        forgotLabel.isUserInteractionEnabled = true
        forgotLabel.addGestureRecognizer(tap)
    }
    
    private func layoutSaveButton() {
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.setTitleColor(.gray, for: .normal)
        saveButton.backgroundColor = .white
        
        saveButton.layer.cornerRadius = 10
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.lightGray.cgColor
        
        saveButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.size.equalTo(currentPasswordTextField)
//            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        bottomButtonConstraint = saveButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        bottomButtonConstraint.isActive = true
        
        saveButton.addTarget(self, action: #selector(saveButtonAction), for: .touchUpInside)
    }
    
    @objc func currentPasswordImageViewTapped(tap: UITapGestureRecognizer) {
        if currentPasswordIconIsClick {
            currentPasswordIconIsClick = false
            currentPasswordImageView.image = UIImage(systemName: "eye.slash")
            currentPasswordTextField.isSecureTextEntry = true
        }
        else {
            currentPasswordIconIsClick = true
            currentPasswordImageView.image = UIImage(systemName: "eye")
            currentPasswordTextField.isSecureTextEntry = false
        }
    }
    @objc func newPasswordImageViewTapped(tap: UITapGestureRecognizer) {
        if newPasswordIconIsClick {
            newPasswordIconIsClick = false
            newPasswordImageView.image = UIImage(systemName: "eye.slash")
            newPasswordTextField.isSecureTextEntry = true
        }
        else {
            newPasswordIconIsClick = true
            newPasswordImageView.image = UIImage(systemName: "eye")
            newPasswordTextField.isSecureTextEntry = false
        }
    }
    @objc func forgotLabelTapped(tap: UITapGestureRecognizer) {
        print("Forgot label tapped")
    }
    @objc func saveButtonAction(sender: UIButton!) {
      print("Save button tapped")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
