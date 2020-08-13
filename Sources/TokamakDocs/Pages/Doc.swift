import TokamakDOM
import TokamakStaticHTML
import DiffModel

struct DocPageView: View {
    let sections: [DocSection]
    let idx: Int
    
    var body: some View {
        ForEach(Array(sections.enumerated()), id: \.offset) { (offset, section) in
            if section.isCode {
                DemoView(code: section.text, content: demos[idx][offset])
            } else {
                VStack(alignment: .leading) {
                    ForEach(section.text.split(separator: "\n"), id: \.self) { line in
                        Text(line)
                    }
                }
            }
        }
    }
}
