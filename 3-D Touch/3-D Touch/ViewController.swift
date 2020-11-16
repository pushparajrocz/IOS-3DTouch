//
//  ViewController.swift
//  3-D Touch
//
//  Created by Pushparaj Selvam on 16/11/20.
//

import UIKit

class ViewController: UIViewController, UIContextMenuInteractionDelegate {
    let previewBox = UIView(frame: CGRect(x: 50, y: 150, width: 180, height: 100))
    override func loadView() {
        //var imagebg = UIImageView()
        let view1 = UIView()
        view1.backgroundColor = .white
        
        
        
        //To get the customized dimention of the view ( CGRect ), kindly comment Line: 23 and Line: 31
        
        previewBox.layer.borderWidth = 1.5
        previewBox.layer.borderColor = UIColor.green.cgColor
        previewBox.backgroundColor = .black
        
        previewBox.translatesAutoresizingMaskIntoConstraints = false
        
        let interaction = UIContextMenuInteraction(delegate: self)
        previewBox.addInteraction(interaction)
        
        print("Interaction Added!")
        view1.addSubview(previewBox)
        
        NSLayoutConstraint.activate([
            previewBox.centerXAnchor.constraint(equalTo: view1.centerXAnchor),
            previewBox.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
            previewBox.heightAnchor.constraint(equalTo: view1.widthAnchor, constant: -100),
            previewBox.widthAnchor.constraint(equalToConstant: 250)
          ])
        
        self.view = view1
      }

      // MARK: UIContextMenuInteractionDelegate

    func contextMenuInteraction(
        _ interaction: UIContextMenuInteraction,
        configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration{
        return self.makeContextConfig()
      }
    // Adding Configurations of the Interaction
    private func makeContextConfig() -> UIContextMenuConfiguration{
        print("configurationForMenuAtLocation")
        
        return UIContextMenuConfiguration(identifier: nil,
                                          previewProvider: nil,
                                          actionProvider: { [weak self] _ in
          return self?.makeContextMenu()
            })
        
    }
    
    // Adding Menu and Items
    private func makeContextMenu() -> UIMenu {
        
        //On click on this item action performed
        let rename = UIAction(title: "Blue", image: UIImage(systemName: "square.and.pencil")) { action in
            // perform action here to rename the image
            self.previewBox.backgroundColor = .blue
        }

        let delete = UIAction(title: "Yellow", image: UIImage(systemName: "trash")) { action in
            // perform action here to delete the image
            self.previewBox.backgroundColor = .yellow
        }

        // Sub Menu
        let edit = UIMenu(title: "ChangeBg", children: [rename, delete])

        let share = UIAction(title: "Share", image: nil){action in
            //perform action here to share the image to different social media
        }

        // Main Menu
        return UIMenu(title: "Main Menu", children: [edit, share])
    }


}

