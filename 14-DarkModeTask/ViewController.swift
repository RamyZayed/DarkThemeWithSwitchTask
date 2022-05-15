//
//  ViewController.swift
//  14-DarkModeTask
//
//  Created by Mobile Team on 15/05/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var middleImage : UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "gamecontroller.fill"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = UIColor(named: "ImageColor")
        return image
    }()
    
    var quoteLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\"If i don't know what am Doing How are the enemies supposed to.\"\n-IMAQTPIE"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    var modeSwitch : UISwitch = {
        let modeSwitch = UISwitch()
        modeSwitch.translatesAutoresizingMaskIntoConstraints = false
        modeSwitch.onTintColor = .red
        
        modeSwitch.thumbTintColor = .white
        modeSwitch.backgroundColor =  .green
        modeSwitch.layer.cornerRadius = 16
        modeSwitch.addTarget(self, action: #selector(changeTheme), for: .valueChanged)
        return modeSwitch
    }()
    var lightLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Light"
        return label
    }()
    
    var darkLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dark"
        return label
    }()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        if let isDarkMode = defaults.value(forKey: "Mode") as? Bool{
            if(isDarkMode == true){
                modeSwitch.setOn(true, animated: true)
                view.overrideUserInterfaceStyle = .dark
            }else{
                modeSwitch.setOn(false, animated: true)
                view.overrideUserInterfaceStyle = .light
            }
        }else{
            view.overrideUserInterfaceStyle = .light
        }
        
        addingViews()
        addingConstraints()
        
    }
    
    @objc func changeTheme (_ sender : UISwitch){
        
        self.defaults.set(sender.isOn, forKey: "Mode")
        
        
        if(sender.isOn){
            view.overrideUserInterfaceStyle = .dark
        }else{
            view.overrideUserInterfaceStyle = .light
        }
    }
    
    let bottomView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func addingViews(){
        view.addSubview(middleImage)
        view.addSubview(quoteLabel)
        
        view.addSubview(bottomView)
        bottomView.addSubview(modeSwitch)
        bottomView.addSubview(lightLabel)
        bottomView.addSubview(darkLabel)
    }
    
    func addingConstraints(){
        bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        middleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        middleImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        middleImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        middleImage.widthAnchor.constraint(equalTo: middleImage.heightAnchor,multiplier: 1.4).isActive = true
        
        quoteLabel.topAnchor.constraint(equalTo: middleImage.bottomAnchor,constant: 12).isActive = true
        quoteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        quoteLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 12).isActive = true
        quoteLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -12).isActive = true
        
        modeSwitch.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
        modeSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        lightLabel.trailingAnchor.constraint(equalTo: modeSwitch.leadingAnchor,constant: -6).isActive = true
        lightLabel.centerYAnchor.constraint(equalTo: modeSwitch.centerYAnchor).isActive = true
        
        darkLabel.leadingAnchor.constraint(equalTo: modeSwitch.trailingAnchor,constant: 6).isActive = true
        darkLabel.centerYAnchor.constraint(equalTo: modeSwitch.centerYAnchor).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
}

