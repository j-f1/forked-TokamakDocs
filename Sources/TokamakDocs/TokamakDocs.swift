import TokamakDOM
import TokamakCore
import DiffModel

struct Link: View {
    let destination: String
    let label: String
    
    var body: some View {
        DynamicHTML("a", ["style": "text-decoration: none;", "href": destination]) {
            Text(label)
        }
    }
}

struct PageLink<Content>: View where Content: View {
    let title: String
    let content: Content
    var body: some View {
        NavigationLink(title, destination: PageView(title: title) { content })
    }

    init(_ title: String, _ content: Content) {
        self.title = title
        self.content = content
    }
}

struct TokamakDocs : View {
    var body: some View {
        return NavigationView {
            VStack(alignment: .leading) {
                List {
                    Logo()
                    PageLink("Getting Started", GettingStartedPage())
                    PageLink("Progress", ProgressPage())
                    Section(header: Text("Views")) {
                        ForEach(Array(docsObj.enumerated()), id: \.offset) { (offset, page) in
                            PageLink(page.title, DocPageView(sections: page.sections, idx: offset))
                        }
                    }
                }.listStyle(SidebarListStyle())
            }
        }
    }
}
