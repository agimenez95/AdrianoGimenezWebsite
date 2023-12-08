//
//  PublishingStep+Extensions.swift
//  
//
//  Created by Adriano Gimenez on 24/11/2023.
//

import Foundation
import Publish

extension PublishingStep where Site == MyWebsite {
    static func addDefaultSectionTitles() -> Self {
        .step(named: "Default section titles") { context in
            context.mutateAllSections { section in
                guard section.title.isEmpty else { return }
                switch section.id {
                case .home:
                    section.title = "home"
                case .apps:
                    section.title = "Apps"
                case .blog:
                    section.title = "Blog"
                case .cv:
                    section.title = "CV"
                }
            }
        }
    }

    static func addItems() -> Self {
        addItems(in: [index(),
                      apps(),
                      milkMonster(),
                      milkMonsterPrivacyPolicy(),
                      addBlogs(),
                      addCV()])
    }

    static func index() -> Item<MyWebsite> {
        Item(path: "",
             sectionID: .home,
             metadata: .init(),
             tags: ["home", "index"])
    }


    static func apps() -> Item<MyWebsite> {
        Item(path: "",
             sectionID: .apps,
             metadata: .init(apps: [Apps.milkMonster]),
             tags: ["apps"],
             content: Content(title: "Apps", body: Content.Body(html: Apps.appsHTML)))
    }

    static func milkMonster() -> Item<MyWebsite> {
        Item(path: "milkMonster",
             sectionID: .apps,
             metadata: .init(apps: [Apps.milkMonster]),
             tags: ["app", "milk monster", "breastfeeding"],
             content: Content(title: "Milk Monster", body: Content.Body(html: Apps.milkMonsterHTML)))
    }

    static func milkMonsterPrivacyPolicy() -> Item<MyWebsite> {
        Item(path: "milkMonster/privacyPolicy",
             sectionID: .apps,
             metadata: .init(apps: [Apps.milkMonster]),
             tags: ["app", "milk monster", "breastfeeding", "privacy policy"],
             content: Content(title: "Milk Monster Privacy Policy",
                              body: Content.Body(html: Apps.milkMonsterPrivacyPolicyHTML)))
    }

    static func addBlogs() -> Item<MyWebsite> {
        Item(path: "",
             sectionID: .blog,
             metadata: .init(),
             tags: ["blogs", "blog"],
             content: Content(title: "Blog"))
    }

    static func addCV() -> Item<MyWebsite> {
        Item(path: "",
                      sectionID: .cv,
                      metadata: .init(),
                      tags: ["cv", "about me", "resume"])
    }
}


private struct Apps {
    static let appsHTML = """
        <main class="container">
            <h1>App Catalog</h1>
            <a href="/apps/milkMonster">
                <div class="card 1 border-radius-none">
                    <div class="card_image"> <img src="/assets/milkMonster.png" /> </div>
                    <div class="card_title title-black">
                        <p>Milk Monster</p>
                    </div>
                </div>
            </a>
        </main>
"""
    static let milkMonsterHTML = """
        <div class="row p-4 pb-0 pe-lg-0 pt-lg-5 align-items-center rounded-3 border shadow-lg">
            <div class="col-lg-7 p-3 p-lg-5 pt-lg-3">
                <h1 class="display-4 fw-bold lh-1">Milk Monster</h1>
                <h2>The breastfeeding monitoring app.</h2>
                <p class="lead">Milk Monster helps you track how regularly you are breastfeeding your baby as well as tracking the nappy contents. You can also choose to receive notifications if you are going too long without breastfeeding your baby.</p>
                <div class="d-grid gap-2 d-md-flex justify-content-md-start mb-4 mb-lg-3">
                    <a href="https://apps.apple.com/gb/app/milk-monster/id1519092924" type="button" class="btn btn-primary btn-lg px-4 me-md-2 fw-bold">App Store</a>
                    <a href="/apps/milkMonster/privacyPolicy" type="button" class="btn btn-outline-secondary btn-lg px-4">Privacy Policy</a>
                </div>
            </div>

            <div class="col-lg-5 p-3 p-lg-5 pt-lg-3">
                <div class="card_image"> <img src="/assets/milkMonster.png"/> </div>
            </div>
        </div>

        <br>

        <div class="row p-4 pb-0 pe-lg-0 pt-lg-5 align-items-center">
            <div class="col-lg-4">
                <div class="screenshot_image"> <img src="/assets/milkMonster-image1.png"/> </div>
                <br>
            </div>
            <div class="col-lg-4">
                <div class="screenshot_image"> <img src="/assets/milkMonster-image2.png"/> </div>
                <br>
            </div>
            <div class="col-lg-4">
                <div class="screenshot_image"> <img src="/assets/milkMonster-image3.png"/> </div>
                <br>
            </div>
        </div>

        <div class="row p-4 pb-0 pe-lg-0 pt-lg-5 align-items-center">
            <div class="col-lg-2"></div>
            <div class="col-lg-4">
                <div class="screenshot_image"> <img src="/assets/milkMonster-image4.png"/> </div>
                <br>
            </div>
            <div class="col-lg-4">
                <div class="screenshot_image"> <img src="/assets/milkMonster-image5.png"/> </div>
                <br>
            </div>
            <div class="col-lg-2"></div>
        </div>
"""
    static let milkMonsterPrivacyPolicyHTML = """
        <div class="row p-4 pb-0 pe-lg-0 pt-lg-5 align-items-center rounded-3 border shadow-lg">
            <div class="col-lg-7 p-3 p-lg-5 pt-lg-3">
                <h1 class="display-4 fw-bold lh-1">Milk Monster</h1>
                <h2>Privacy Policy</h2>
                <p class="lead">Any data collected is completely anonymous and will be used to improve the app experience.</p>
                <p class="lead">If you choose to share your tracking with another iCloud user, you will be sharing each others recordings. You will be able to stop sharing the data at any point in time.</p>
            </div>

            <div class="col-lg-5 p-3 p-lg-5 pt-lg-3">
                <div class="card_image"> <img src="/assets/milkMonster.png"/> </div>
            </div>
        </div>
"""
    static let milkMonster = App(name: "Milk Monster",
                                 iconPath: "assets/milkMonster.png",
                                 carouselImagesPath: ["milkMonster-image1",
                                                      "milkMonster-image2",
                                                      "milkMonster-image3",
                                                      "milkMonster-image4",
                                                      "milkMonster-image5"])
}
