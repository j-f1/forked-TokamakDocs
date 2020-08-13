import JavaScriptKit
import TokamakDOM
import DiffModel

let diffObj = try JSONDecoder().decode(Diff.self, from: Data(stringValue: diff))
let docsObj = try JSONDecoder().decode([DocPage].self, from: Data(stringValue: docs))

let document = JSObjectRef.global.document.object!

//div.set("style", "display: flex; width: 100%; height: 100%; justify-content: center; align-items: center;")
struct TokamakDocsApp: App {
  var body: some Scene {
    WindowGroup("Tokamak Docs") {
      TokamakDocs()
    }
  }
}

TokamakDocsApp.main()
