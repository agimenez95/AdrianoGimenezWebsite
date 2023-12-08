//
//  Theme+Extensions.swift
//  
//
//  Created by Adriano Gimenez on 24/11/2023.
//

import Foundation
import Publish
import Plot

extension Theme where Site == MyWebsite {
    static var basic: Self {
        Theme(htmlFactory: BasicHTMLFactory(),
              resourcePaths: ["Resources/css/app.css",
                              "Resources/css/apps.css",
                              "Resources/css/base.css",
                              "Resources/css/blog.css",
                              "Resources/css/styles.css",
                              "Resources/assets/milkMonster.png"])
    }

    private struct BasicHTMLFactory: HTMLFactory {
        func makeItemHTML(for item: Publish.Item<MyWebsite>,
                          context: Publish.PublishingContext<MyWebsite>) throws -> Plot.HTML {
            var stylesheetPaths: [Path] = ["apps.css",
                                           "base.css",
                                           "styles.css",
                                           "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
                                           "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"]
            if item.content.title != "Apps" {
                stylesheetPaths.append("app.css")
            }
            if item.content.title != "Blog" {
                stylesheetPaths.append("blog.css")
            }

            return HTML(.head(for: item,
                           on: context.site,
                           stylesheetPaths: stylesheetPaths),
                        makeBaseBody(from: item)
            )
        }

        func makeIndexHTML(for index: Publish.Index,
                           context: Publish.PublishingContext<MyWebsite>) throws -> Plot.HTML {
            return try makeItemHTML(for: .init(path: "/", sectionID: .home, metadata: .init()), context: context)
        }

        func makeSectionHTML(for section: Publish.Section<MyWebsite>,
                             context: Publish.PublishingContext<MyWebsite>) throws -> Plot.HTML {
            return Plot.HTML(.head(for: section, on: context.site),
                             .body(.p("this is the body of the section html")))
        }

        func makePageHTML(for page: Publish.Page,
                          context: Publish.PublishingContext<MyWebsite>) throws -> Plot.HTML {
            return Plot.HTML(.head(for: page, on: context.site),
                             .body(.p("this is the body of the page html")))
        }

        func makeTagListHTML(for page: Publish.TagListPage,
                             context: Publish.PublishingContext<MyWebsite>) throws -> Plot.HTML? {
            return Plot.HTML(.head(for: page, on: context.site),
                             .body(.p("this is the body of the TagList html")))
        }

        func makeTagDetailsHTML(for page: Publish.TagDetailsPage,
                                context: Publish.PublishingContext<MyWebsite>) throws -> Plot.HTML? {
            return Plot.HTML(.head(for: page, on: context.site),
                             .body(.p("this is the body of the TagDetails html")))
        }


        private struct Constants {
            static let baseHTML = """
        """
        }

        private func makeBaseBody(from item: Publish.Item<MyWebsite>) -> Node<HTML.DocumentContext> {
            .body(
               .div(
                   .class("container"),
                   .header(
                       .class("border-bottom lh-1 py-3"),
                       .div(
                           .class("row flex-nowrap justify-content-between align-items-center"),
                           .div(
                               .class("text-center"),
                               .a(
                                   .class("blog-header-logo text-body-emphasis text-decoration-none"),
                                   .href("/"),
                                   "Adriano Giménez Fernandez"
                               )
                           )
                       )
                   ),
                   .div(
                       .class("nav-scroller py-1 mb-3 border-bottom"),
                       .nav(
                           .class("nav nav-underline justify-content-between"),
                           .a(
                               .class("nav-item nav-link link-body-emphasis activ"),
                               .href("/home"),
                               "Home"
                           ),
                           .a(
                               .class("nav-item nav-link link-body-emphasis activ"),
                               .href("/apps"),
                               "Apps"
                           ),
                           .a(
                               .class("nav-item nav-link link-body-emphasis activ"),
                               .href("/blog"),
                               "Blog"
                           ),
                           .a(
                               .class("nav-item nav-link link-body-emphasis activ"),
                               .href("/cv"),
                               "CV"
                           )
                       )
                   )
               ),
               .main(
                   .class("container"),
                   .div(
                       .class("container my-5"),
                       .contentBody(item.body)
                   )
               )
            )
        }
    }
}
