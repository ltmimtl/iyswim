# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require foundation
#= require turbolinks
#= require three.min
#= require_tree .

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
