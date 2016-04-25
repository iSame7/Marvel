//
//  ForYouLabelView.swift
//  appletv
//
//  Created by TalhaKhalid on 2016-03-16.
//  Copyright © 2016 Rogers. All rights reserved.
//

import UIKit

/** UICollectionReusableView for characters categories sections that contain loading indicator. */
class FooterReusableView: UICollectionReusableView {

    let activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(self.activityIndicator)
        self.activityIndicator.startAnimating()
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.activityIndicator.topAnchor.constraintEqualToAnchor(self.topAnchor).active = true
        self.activityIndicator.leftAnchor.constraintEqualToAnchor(self.leftAnchor).active = true
        self.activityIndicator.rightAnchor.constraintEqualToAnchor(self.rightAnchor).active = true
        self.activityIndicator.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}