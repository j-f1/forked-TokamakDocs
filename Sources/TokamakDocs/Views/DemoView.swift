import TokamakDOM
import TokamakStaticHTML
import TokamakCore

struct DemoView<Content> : View where Content : View {
    let code: String
    let content: Content
    
    init(code: String, @ViewBuilder content: () -> Content) {
        self.code = code
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                HTML("pre", content: code)
                Spacer()
            }
            Divider()
            content.frame(maxWidth: 380, maxHeight: 300).padding(10)
        }
        .padding(10)
        .background(Color(white: 0.9, opacity: 1))
        .cornerRadius(15)
        .frame(maxWidth: 400)
        .padding()
    }
}
