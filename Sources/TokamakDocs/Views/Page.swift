import TokamakDOM
import TokamakCore

struct PageView<Content>: View where Content: View {
    let title: String
    let content: Content
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack { Spacer() }
            Text(title)
                .font(.title)
                .bold()
                .padding(.bottom)
            Divider()
            VStack(alignment: .leading) {
                content
            }.padding(.top)
        }.padding()
    }
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
}
