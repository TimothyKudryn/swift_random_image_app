//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Timothy Kudryn on 8/23/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        
        //adding image and its specs to the screen (subview)
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 300,
                                 height: 300)
        imageView.center = view.center
        view.addSubview(button)
        getRandomPhoto() // calling the random photo generating function defined below
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        button.frame = CGRect(x: 30,
                              y: view.frame.size.height-150-view.safeAreaInsets.bottom,
                              width: view.frame.size.width-60,
                              height: 55)
        
    }
    //array containing differnent background colors
    let colors: [UIColor] = [.systemRed,
                             .systemBlue,
                             .systemPink,
                             .systemTeal,
                             .systemGray,
                             .systemPurple,
                             .systemYellow]
    //adding action listener to the button.
    @objc func didTapButton(){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    // the following lines of code create a button, that when pressed generates a new image for the application
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Generate Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    // given a url, the following function accesses a random image renerating website and displays the image onto the simulated screen.
    func getRandomPhoto() {
        
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage(data: data)

    }
    
}

