//
//  ViewController.swift
//  HW1-Task2
//
//  Created by Ramir Amrayev on 4/12/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let backgroundColor = UIColor(red: 247, green: 247, blue: 247, alpha: 1)
    
    let imageView = UIImageView()
    let cameraView = UIImageView()
    let fullNameLabel = UILabel()
    let emailLabel = UILabel()
    let firstSeparator = UIView()
    let pushLabel = UILabel()
    let pushSwitch = UISwitch()
    let secondSeparator = UIView()
    let passwordStack = UIStackView()
    let changePasswordLabel = UILabel()
    let thirdSeparator = UIView()
    let codeStack = UIStackView()
    let changeCodeLabel = UILabel()
    let fourthSeparator = UIView()
    let entryLabel = UILabel()
    let entrySwitch = UISwitch()
    let fifthSeparator = UIView()
    let phoneStack = UIStackView()
    let phoneLabel = UILabel()
    let sixthSeparator = UIView()
    let exitLabel = UILabel()
    let seventhSeparator = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        layoutUI()
    }

    private func layoutUI() {
        title = "Профиль"
        
        view.backgroundColor = backgroundColor
        navigationController?.navigationBar.barTintColor = backgroundColor
        
        view.addSubview(imageView)
        view.addSubview(cameraView)
        view.addSubview(fullNameLabel)
        view.addSubview(emailLabel)
        view.addSubview(firstSeparator)
        view.addSubview(pushLabel)
        view.addSubview(pushSwitch)
        view.addSubview(secondSeparator)
        view.addSubview(passwordStack)
        view.addSubview(thirdSeparator)
        view.addSubview(codeStack)
        view.addSubview(fourthSeparator)
        view.addSubview(entryLabel)
        view.addSubview(entrySwitch)
        view.addSubview(fifthSeparator)
        view.addSubview(phoneStack)
        view.addSubview(sixthSeparator)
        view.addSubview(exitLabel)
        view.addSubview(seventhSeparator)
        
        layoutImageView()
        layoutCameraView()
        layoutFullNameLabel()
        layoutEmailLabel()
        layoutFirstSeparator()
        layoutLabelWithSwitch(label: pushLabel, text: "Push уведомления", separatorTop: firstSeparator)
        layoutSwitchWithLabel(mySwitch: pushSwitch, label: pushLabel, action: #selector(pushSwitchValueDidChange))
        layoutSeparatorUnderLabel(separator: secondSeparator, label: pushLabel)
        layoutStackWithLeftArrow(stack: passwordStack, label: changePasswordLabel, text: "Изменить пароль", action: #selector(handlePasswordStackTap), separatorTop: secondSeparator)
        layoutSeparatorUnderStack(separator: thirdSeparator, stack: passwordStack)
        layoutStackWithLeftArrow(stack: codeStack, label: changeCodeLabel, text: "Изменить код быстрого доступа", action: #selector(handleCodeStackTap), separatorTop: thirdSeparator)
        layoutSeparatorUnderStack(separator: fourthSeparator, stack: codeStack)
        layoutLabelWithSwitch(label: entryLabel, text: "Вход с Face/Touch ID", separatorTop: fourthSeparator)
        layoutSwitchWithLabel(mySwitch: entrySwitch, label: entryLabel, action: #selector(entrySwitchValueDidChange))
        layoutSeparatorUnderLabel(separator: fifthSeparator, label: entryLabel)
        layoutStackWithLeftArrow(stack: phoneStack, label: phoneLabel, text: "Изменить номер телефона", action: #selector(handlePhoneStackTap), separatorTop: fifthSeparator)
        layoutSeparatorUnderStack(separator: sixthSeparator, stack: phoneStack)
        layoutLabelWithSwitch(label: exitLabel, text: "Выход", separatorTop: sixthSeparator)
        layoutSeparatorUnderLabel(separator: seventhSeparator, label: exitLabel)
        
        configureExitLabel()
    }
    
    private func layoutImageView() {
        imageView.image = UIImage(systemName: "person.circle")
        imageView.backgroundColor = .white
        
        imageView.layer.cornerRadius = view.frame.size.height * 0.05
//        imageView.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
//        imageView.layer.borderWidth = 1
        
        imageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets).offset(100)
            $0.height.equalToSuperview().multipliedBy(0.1)
            $0.width.equalTo(imageView.snp.height)
            $0.centerX.equalToSuperview()
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleImageViewTap))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tap)
    }
    
    private func layoutCameraView() {
        cameraView.image = UIImage(systemName: "camera.circle")
        cameraView.backgroundColor = .blue
        cameraView.tintColor = .white
        
        cameraView.layer.cornerRadius = view.frame.size.height * 0.02
        
        cameraView.snp.makeConstraints {
            $0.trailing.equalTo(imageView)
            $0.bottom.equalTo(imageView)
            $0.height.equalToSuperview().multipliedBy(0.04)
            $0.width.equalTo(cameraView.snp.height)
        }
    }
    
    private func layoutFullNameLabel() {
        fullNameLabel.text = "Мария Атрисова"
        fullNameLabel.font = .boldSystemFont(ofSize: 18)
        fullNameLabel.textColor = .darkGray
        
        fullNameLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func layoutEmailLabel() {
        emailLabel.text = "maria.atrisova@gmail.com"
        emailLabel.textColor = .darkGray
        
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(fullNameLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func layoutFirstSeparator() {
        firstSeparator.backgroundColor = .gray
        
        firstSeparator.snp.makeConstraints {
            $0.top.equalTo(emailLabel.snp.bottom).offset(20)
            $0.height.equalTo(1)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func layoutLabelWithSwitch(label: UILabel, text: String, separatorTop: UIView) {
        label.text = text
        label.textColor = .gray
        
        label.snp.makeConstraints {
            $0.top.equalTo(separatorTop.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(15)
        }
    }
    
    private func layoutSwitchWithLabel(mySwitch: UISwitch, label: UILabel, action: Selector) {
        mySwitch.setOn(true, animated: true)
        mySwitch.addTarget(self, action: action, for: .valueChanged)
        mySwitch.onTintColor = .systemPurple
        
        mySwitch.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalTo(label)
        }
    }
    
    private func layoutSeparatorUnderLabel(separator: UIView, label: UILabel) {
        separator.backgroundColor = .gray
        
        separator.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.height.equalTo(1)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func layoutStackWithLeftArrow(stack: UIStackView, label: UILabel, text: String, action: Selector, separatorTop: UIView) {
        stack.axis = .horizontal
        
        stack.addSubview(label)
        
        stack.snp.makeConstraints {
            $0.top.equalTo(separatorTop.snp.bottom)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        layoutStackLabel(label: label, text: text)
        layoutStackLeftArrow(stack: stack)
        
        let tap = UITapGestureRecognizer(target: self, action: action)
        stack.addGestureRecognizer(tap)
    }
    
    private func layoutStackLabel(label: UILabel, text: String) {
        label.text = text
        label.textColor = .gray
        
        label.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(15)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func layoutStackLeftArrow(stack: UIStackView) {
        let arrowImageView = UIImageView()
        
        stack.addSubview(arrowImageView)
        
        arrowImageView.image = UIImage(systemName: "chevron.right")
        arrowImageView.tintColor = .gray
        
        arrowImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(15)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func layoutSeparatorUnderStack(separator: UIView, stack: UIStackView) {
        separator.backgroundColor = .gray
        
        separator.snp.makeConstraints {
            $0.top.equalTo(stack.snp.bottom)
            $0.height.equalTo(1)
            $0.leading.equalToSuperview().offset(15)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func configureExitLabel() {
        exitLabel.textColor = .red
        exitLabel.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleExitLabelTap))
        exitLabel.addGestureRecognizer(tap)
    }

    @objc func pushSwitchValueDidChange(sender: UISwitch!) {
        if (sender.isOn){
            print("Push switch is on")
        }
        else{
            print("Push switch is off")
        }
    }
    @objc func entrySwitchValueDidChange(sender: UISwitch!) {
        if (sender.isOn){
            print("Entry switch is on")
        }
        else{
            print("Entry switch is off")
        }
    }
    @objc func handlePasswordStackTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        print("Password stack clicked")
        
        let changePasswordVC = ChangePasswordViewController()
        self.navigationController?.pushViewController(changePasswordVC, animated: true)
    }
    @objc func handleCodeStackTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        print("Code stack clicked")
    }
    @objc func handlePhoneStackTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        print("Phone stack clicked")
    }
    @objc func handleExitLabelTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        print("Exit label clicked")
    }
    @objc func handleImageViewTap(sender: UITapGestureRecognizer) {

        // Your action
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImageFromPicker = editedImage
        }
        else if let originalImage = info[.originalImage] as? UIImage {
            selectedImageFromPicker = originalImage
        }
        
        if let selectedImage = selectedImageFromPicker {
            imageView.image = selectedImage
        }
         
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("cancel tapped")
        dismiss(animated: true, completion: nil)
    }
}

