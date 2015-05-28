init = (container) ->
  scene = new THREE.Scene()
  
  camera = new THREE.PerspectiveCamera(100, 1, 1, 10000)
  camera.position.z = 800
  
  geometry = new THREE.SphereGeometry(200)
  geometry2 = new THREE.BoxGeometry(100, 100, 100)
  material = new THREE.MeshBasicMaterial
    color: 0xff0000
    wireframe: true
  
  mesh = new THREE.Mesh(geometry, material)
  mesh2 = new THREE.Mesh(geometry2, material)
  mesh2.position.set(300, 300, 300)
  
  scene.add(mesh)
  scene.add(mesh2)
  
  renderer = new THREE.WebGLRenderer()
  renderer.setSize(container.innerWidth(), container.innerWidth())
  container.append(renderer.domElement)
  
  animate = ->
    # note: three.js includes requestAnimationFrame shim
    requestAnimationFrame(animate)
    mesh.rotation.x += 0.01
    mesh.rotation.y += 0.01
    #mesh2.position.set(mesh2.position.getComponent(0)-1, mesh2.position.getComponent(1)-1, mesh2.position.getComponent(2)-1)
    renderer.render(scene, camera)
  animate()

jQuery ->
  $(document).foundation()
  $(".home_animation").each (index) ->
    init($(this))
