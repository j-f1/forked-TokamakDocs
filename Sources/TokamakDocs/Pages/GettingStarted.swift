import TokamakDOM

public struct Clicker: View {
    public init() {}
    @State private var counter: Int = 0
    public var body: some View {
        Button(action: { counter += 1 }) {
            Text("Clicked \(counter) times")
        }
    }
}

let buttonDemoSource = """
public struct Clicker: View {
    public init() {}
    @State private var counter: Int = 0
    public var body: some View {
        Button(action: { counter += 1 }) {
            Text("Clicked \\(counter) times")
        }
    }
}
"""

struct GettingStartedPage: View {
    var body: some View {
        Text("Welcome to Tokamak. A SwiftUI-compatible framework for building browser apps with WebAssembly.")
        Text("Tokamak gives you the full power of SwiftUI inside of your browser, with the flexibility to tap into HTML when needed.")
        Text("Your SwiftUI skills will transfer seamlessly to Tokamak:")
        DemoView(code: buttonDemoSource) {
            Clicker()
        }
    }
}
