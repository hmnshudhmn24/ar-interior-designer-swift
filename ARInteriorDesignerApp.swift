import SwiftUI
import RealityKit
import ARKit
import SceneKit
import Firebase

class ARViewModel: ObservableObject {
    @Published var selectedModelName: String? = nil
    var arView: ARView?

    func setupARView(container: UIView) {
        let arView = ARView(frame: container.bounds)
        container.addSubview(arView)
        arView.session.delegate = self
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        arView.session.run(config)
        self.arView = arView
    }

    func placeModel(named modelName: String) {
        guard let arView = arView,
              let modelEntity = try? ModelEntity.load(named: modelName) else { return }

        let anchorEntity = AnchorEntity(plane: .horizontal)
        anchorEntity.addChild(modelEntity)
        arView.scene.addAnchor(anchorEntity)
    }

    func saveSceneLayout() {
        // Firebase Firestore code to save anchor entities
    }
}

extension ARViewModel: ARSessionDelegate {}

struct ARContainerView: UIViewRepresentable {
    let viewModel: ARViewModel

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            viewModel.setupARView(container: view)
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

struct ContentView: View {
    @StateObject private var arViewModel = ARViewModel()

    let models = ["chair", "table", "lamp"]

    var body: some View {
        VStack {
            ARContainerView(viewModel: arViewModel)
                .edgesIgnoringSafeArea(.all)
                .frame(height: 500)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(models, id: \.self) { model in
                        Button(action: {
                            arViewModel.placeModel(named: model)
                        }) {
                            Text(model.capitalized)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
                .padding()
            }

            Button("Save Design") {
                arViewModel.saveSceneLayout()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

@main
struct ARInteriorDesignerApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
