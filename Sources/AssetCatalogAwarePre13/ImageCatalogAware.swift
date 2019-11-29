import UIKit

public protocol ImageIdentifier {
    var imageName: String { get }
}

public extension ImageIdentifier where Self: RawRepresentable, Self.RawValue == String {
    var imageName: String { self.rawValue }
}

public protocol ImageCatalogAware {
    associatedtype ImageId: ImageIdentifier
}

public extension ImageCatalogAware where Self: AssetCatalogStaticApiProvider {

    static func image(
        _ id: ImageId,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIImage {
        Self().image(id, compatibleWith: traitCollection)
    }

}

public extension ImageCatalogAware where Self: AssetCatalogProvider {

    func image(
        _ id: ImageId,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIImage {
        image(id, in: self.catalogBundle, compatibleWith: traitCollection)
    }

}

public extension ImageCatalogAware {

    func image(
        _ id: ImageId,
        in bundle: Bundle,
        compatibleWith traitCollection: UITraitCollection? = nil
    ) -> UIImage {
        guard let image = UIImage(named: id.imageName, in: bundle, compatibleWith: traitCollection) else {
            fatalError(
                "Could not load image named '\(id.imageName)' " +
                "from bundle '\(bundle)' " +
                "compatible with trait collection '\(String(describing: traitCollection))' " +
                "for image id '\(id)'"
            )
        }
        return image
    }

}
