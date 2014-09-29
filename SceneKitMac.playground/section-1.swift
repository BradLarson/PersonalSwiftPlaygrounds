import Cocoa
import XCPlayground
import QuartzCore
import SceneKit

// Scene
let scene = SCNScene()
let objectsNode = SCNNode()
scene.rootNode.addChildNode(objectsNode)

// Ambient light
let ambientLight = SCNLight()
let ambientLightNode = SCNNode()
ambientLight.type = SCNLightTypeAmbient
ambientLight.color = NSColor(deviceWhite:0.1, alpha:1.0)
ambientLightNode.light = ambientLight
scene.rootNode.addChildNode(ambientLightNode)

// Diffuse light
let diffuseLight = SCNLight()
let diffuseLightNode = SCNNode()
diffuseLight.type = SCNLightTypeOmni;
diffuseLightNode.light = diffuseLight;
diffuseLightNode.position = SCNVector3(x:0, y:300, z:0);
scene.rootNode.addChildNode(diffuseLightNode)

// Torus
let torusReflectiveMaterial = SCNMaterial()
torusReflectiveMaterial.diffuse.contents = NSColor.blueColor()
torusReflectiveMaterial.specular.contents = NSColor.whiteColor()
torusReflectiveMaterial.shininess = 5.0

let torus = SCNTorus(ringRadius:60, pipeRadius:20)
let torusNode = SCNNode(geometry:torus)
torusNode.position = SCNVector3(x:-50, y:0, z:-100)
torus.materials = [torusReflectiveMaterial]
objectsNode.addChildNode(torusNode)

let animation = CAKeyframeAnimation(keyPath:"transform")
animation.values = [
    NSValue(CATransform3D:CATransform3DRotate(torusNode.transform, CGFloat((0.0 * M_PI) / 2.0), CGFloat(1.0), CGFloat(0.5), CGFloat(0.0))),
    NSValue(CATransform3D:CATransform3DRotate(torusNode.transform, CGFloat((1.0 * M_PI) / 2.0), CGFloat(1.0), CGFloat(0.5), CGFloat(0.0))),
    NSValue(CATransform3D:CATransform3DRotate(torusNode.transform, CGFloat((2.0 * M_PI) / 2.0), CGFloat(1.0), CGFloat(0.5), CGFloat(0.0))),
    NSValue(CATransform3D:CATransform3DRotate(torusNode.transform, CGFloat((3.0 * M_PI) / 2.0), CGFloat(1.0), CGFloat(0.5), CGFloat(0.0))),
    NSValue(CATransform3D:CATransform3DRotate(torusNode.transform, CGFloat((4.0 * M_PI) / 2.0), CGFloat(1.0), CGFloat(0.5), CGFloat(0.0)))]

animation.duration = 3.0
animation.repeatCount = 100000
torusNode.addAnimation(animation, forKey:"transform")

// Display
let sceneKitView = SCNView(frame:NSRect(x:0.0, y:0.0, width:400.0, height:400.0), options:nil)!
sceneKitView.scene = scene
sceneKitView.backgroundColor = NSColor.grayColor()

XCPShowView("SceneKit view", sceneKitView)




