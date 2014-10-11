# given a set U of n elements, a collection S_1,...,S_m subsets of U, and a number k, 
# does there exist a collection of at most k of these sets whose union is equal to all
# of U?
class SetCover
  constructor: (@num_elements, @num_subsets, @k) ->
    @subsets = []
    this.generate_subsets()

  generate_subsets: ->
    samples = [true, false]
    for [1..@num_subsets]
      subset = (samples[Math.floor(Math.random()*2)] for element in [1..@num_elements])
      @subsets.push subset

  # S_1 u S_2 u ... u S_m == U
  validate: ->
    for element_i in [0..@num_elements-1]
      for subset_i in [0..@num_subsets-1]
        break if @subsets[subset_i][element_i]
        return false if subset_i == @num_subsets-1
    return true

  solve: ->


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
  renderer = new THREE.WebGLRenderer()
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
  set_cover = new SetCover 100, 20, 5
