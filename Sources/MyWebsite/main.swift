import Foundation
import Publish
import Plot
import SplashPublishPlugin

struct MyWebsite: Website {
    enum SectionID: String, WebsiteSectionID {
        case home
        case apps
        case blog
        case cv
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
        var apps: [App]?
    }

    var url = URL(string: "https://adrianogimenez.com")!
    var name = "Adriano Giménez Fernández"
    var description = "My Website"
    var language: Language { .english }
    var imagePath: Path? { "/Content/assets/favicon/favicon.ico" }
}

try MyWebsite().publish(using: [.addDefaultSectionTitles(),
                                .installPlugin(.splash(withClassPrefix: "")),
                                .addItems(),
                                .addMarkdownFiles(),
                                .copyResources(),
                                .generateHTML(withTheme: .basic),
                                .generateSiteMap(),
                                .installPlugin(.ensureAllItemsAreTagged),
                                .deploy(using: .gitHub("agimenez95/AdrianoGimenezWebsite"))])
