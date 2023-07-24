//
//  ViewController.swift
//  AvatarNative
//
//  Created by Ekaterina Saveleva on 24.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var avatarImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "person.crop.circle.fill")
        image.tintColor = .gray
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    
    // MARK: - Lifecycles

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"
        view.addSubview(scrollView)
        setupConstraits()
        
        DispatchQueue.main.async {
            self.presenting()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Private methods
    
    private func presenting() {
        guard let LargeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        guard let navigationController = self.navigationController else { return }
        navigationController.navigationBar.subviews.forEach { subview in
            if subview.isKind(of: LargeTitleView.self) {
                let viewAvatar = self.avatarImage
                viewAvatar.clipsToBounds = true
                subview.addSubview(viewAvatar)
                viewAvatar.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([
                    viewAvatar.rightAnchor.constraint(equalTo: subview.rightAnchor, constant: -15),
                    viewAvatar.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: -14),
                    viewAvatar.heightAnchor.constraint(equalToConstant: 36),
                    viewAvatar.widthAnchor.constraint(equalToConstant: 36)
                ])
            }
        }
    }
    
    
    private func setupConstraits() {
        NSLayoutConstraint.activate([
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
