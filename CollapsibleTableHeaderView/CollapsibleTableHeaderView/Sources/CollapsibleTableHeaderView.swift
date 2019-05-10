//
//  CollapsibleTableHeaderView.swift
//  CollapsibleTableHeaderView
//
//  Created by TheFlow on 10/05/2019.
//  Copyright © 2019 TheFlow. All rights reserved.
//

import UIKit

public class CollapsibleTableHeaderView: UITableViewHeaderFooterView {
    static let reuseIdentifier = "collapsibleHeader"
    static let height: CGFloat = 44.0
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var arrowView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "arrow"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var section = 0
    
    weak var delegate: CollapsibleTableHeaderViewDelegate?
    
    // MARK: - Initializers
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    // MARK: - Set Up View
    
    private func setUpView() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowView)
        
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        arrowView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        arrowView.heightAnchor.constraint(equalToConstant: 14).isActive = true
        arrowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        arrowView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped(_:))))
    }
    
    // MARK: - Public methods
    
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        guard let cell = sender.view as? CollapsibleTableHeaderView else { return }
        
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    func setCollapsed(_ collapsed: Bool, animated: Bool = true) {
        let rotationAngle: CGFloat = collapsed ? 0.0 : .pi / 2
        
        self.arrowView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        
        if animated {
            let rotation = CABasicAnimation(keyPath: "transform.rotation.z")
            rotation.toValue = rotationAngle
            rotation.byValue = collapsed ? -Double.pi / 2 : Double.pi / 2
            rotation.duration = 0.2
            self.arrowView.layer.add(rotation, forKey: "rotationAnimation")
        }
    }
}

protocol CollapsibleTableHeaderViewDelegate: class {
    func toggleSection(header: CollapsibleTableHeaderView, section: Int)
}
