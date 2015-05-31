init = (container) ->
  scene = new THREE.Scene()
  
  camera = new THREE.PerspectiveCamera(100, 1, 1, 10000)
  camera.position.z = 800
  
  geometry = new THREE.SphereGeometry(200)
  geometry2 = new THREE.SphereGeometry(20)
  material = new THREE.MeshBasicMaterial
    color: 0xff0000
    wireframe: true
  
  mesh = new THREE.Mesh(geometry, material)
  mesh2 = new THREE.Mesh(geometry2, material)
  mesh2.position.set(200, 0, 0)
  
  scene.add(mesh)
  scene.add(mesh2)
  
  renderer = new THREE.WebGLRenderer()
  renderer.setSize(container.innerWidth(), container.innerWidth())
  container.append(renderer.domElement)

  x = (radius, angle) ->
    radius*Math.cos(angle)*Math.sin(angle)

  y = (radius, angle) ->
    radius*Math.sin(angle)*Math.sin(angle)

  z = (radius, angle) ->
    radius*Math.cos(angle)
  
  angle = 0
  animate = ->
    # note: three.js includes requestAnimationFrame shim
    requestAnimationFrame(animate)
    mesh.rotation.x += 0.01
    mesh.rotation.y += 0.01
    angle += 0.03
    mesh2.position.set(x(200, angle), y(200, angle), z(200, angle))
    renderer.render(scene, camera)
  animate()

jQuery ->
  $(document).foundation()
  $(".home_animation").each (index) ->
    init($(this))
