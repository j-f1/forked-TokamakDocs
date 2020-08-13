import TokamakDOM
import DiffModel

func indent(_ string: Substring) -> UInt {
    if string.starts(with: "  ") {
        return 1 + indent(string.dropFirst(2))
    } else {
        return 0
    }
}

struct DocPageView: View {
    let sections: [DocSection]
    let idx: Int
    
    var body: some View {
        ScrollView {
            ForEach(Array(sections.enumerated()), id: \.offset) { (offset, section) in
                VStack {
                    VStack(alignment: .leading) {
                        ForEach(section.text.split(separator: "\n"), id: \.self) { line in
                            Text(line)
                                .font(section.isCode ? .system(.body, design: .monospaced) : .body)
                                .padding(.leading, Double(indent(line) * 11 * 2))
                        }
                    }
                    (section.isCode ? AnyView(Divider()) : AnyView(EmptyView()))
                    demos[idx][offset]()
                        .padding(.leading)
                }
                .padding(section.isCode ? 10 : 0)
                .background(
                    section.isCode
                        ? Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 1)
                        : Color(red: 1, green: 1, blue: 1, opacity: 1)
                )
                .cornerRadius(section.isCode ? 10 : 0)
                .padding(section.isCode ? 10 : 0)
            }
        }
    }
}
