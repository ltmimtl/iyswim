init = (container) ->
  camera = new THREE.PerspectiveCamera(75, 1, 1, 10000)
  camera.position.z = 700
  scene = new THREE.Scene()
  geometry = new THREE.BoxGeometry(200, 200, 200)
  material = new THREE.MeshBasicMaterial
    color: 0xff0000
    wireframe: true
  mesh = new THREE.Mesh(geometry, material)
  scene.add(mesh)
  renderer = new THREE.CanvasRenderer()
  renderer.setSize(container.innerWidth(), container.innerWidth())
  container.append(renderer.domElement)
  animate = ->
    # note: three.js includes requestAnimationFrame shim
    requestAnimationFrame(animate)
    mesh.rotation.x += 0.01
    mesh.rotation.y += 0.01
    renderer.render(scene, camera)
  animate()

jQuery ->
  $(document).foundation()
  $(".home_animation").each (index) ->
  init($(this))
  #animate()
