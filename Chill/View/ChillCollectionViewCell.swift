import UIKit

class customCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = .white
        setupCell()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupCell() {
        addSubview(image)
        addSubview(label)
        
        label.safeAreaLayoutGuide.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.safeAreaLayoutGuide.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        image.topAnchor.constraint(equalTo: topAnchor).isActive = true
        image.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
}
