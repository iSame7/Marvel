//
//  ImageCounterView.swift
//  Money
//
//  Created by Kristian Angyal on 07/03/2016.
//  Copyright © 2016 Mail Online. All rights reserved.
//

import UIKit

class CounterView: UIView {
    
    let count: Int
    let countLabel = UILabel()
    let nameLabel = UILabel()
    var currentIndex: Int {
        didSet {
            updateLabel()
        }
    }
    var name: String {
        didSet {
            updateNameLabel()
        }
    }

    init(frame: CGRect, currentIndex: Int, count: Int, name: String) {
        
        self.currentIndex = currentIndex
        self.count = count
        self.name = name

        super.init(frame: frame)
        configureLabel()
        updateLabel()
        updateNameLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabel() {
        
        countLabel.textAlignment = .Center
        self.addSubview(countLabel)

        nameLabel.textAlignment = .Center
        nameLabel.layer.shadowColor = UIColor.blackColor().CGColor
        nameLabel.layer.shadowOpacity = 0.3
        nameLabel.numberOfLines = 2
        self.addSubview(nameLabel)

        /* Autolayout labels*/
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let nameXConstraint: NSLayoutConstraint = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant:0)
        let nameYConstraint: NSLayoutConstraint = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        let nameLeftConstraint: NSLayoutConstraint = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: +10)
        let nameRightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: -10)
        let nameHeightConstraint: NSLayoutConstraint = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: -20)

        self.addConstraint(nameXConstraint)
        self.addConstraint(nameYConstraint)
        self.addConstraint(nameLeftConstraint)
        self.addConstraint(nameRightConstraint)
        self.addConstraint(nameHeightConstraint)

        countLabel.translatesAutoresizingMaskIntoConstraints = false

        let xConstraint: NSLayoutConstraint = NSLayoutConstraint(item: countLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        let yConstraint: NSLayoutConstraint = NSLayoutConstraint(item: countLabel, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant:+25)

        self.addConstraint(xConstraint)
        self.addConstraint(yConstraint)
    }
    
    func updateLabel() {
        
        let stringTemplate = "%d/%d"
        let countString = String(format: stringTemplate, arguments: [currentIndex + 1, count])
        
        countLabel.attributedText = NSAttributedString(string: countString, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(15), NSForegroundColorAttributeName: UIColor.grayColor()])
    }

    func updateNameLabel() {

        nameLabel.attributedText = NSAttributedString(string: name, attributes: [NSFontAttributeName: UIFont.systemFontOfSize(15), NSForegroundColorAttributeName: UIColor.whiteColor()])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
