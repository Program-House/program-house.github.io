_           = require 'lodash'
Regl        = require 'regl'
mat4        = require 'gl-mat4'
bunny       = require 'bunny'
normals     = require 'angle-normals'

window.onkeydown = (e) ->
  if e.keyCode is 32 
    if e.target is document.body 
      e.preventDefault()
      false

app         = Elm.Main.fullscreen()
{mountRegl, unmountRegl, scrollToTop} = app.ports


scrollToTop.subscribe ->
  window.scrollTo 0, 0


runRegl = (mount) =>
  regl = Regl mount

  envmap = regl.texture()

  setupEnvMap = regl
    frag: 'precision mediump float;
      uniform sampler2D envmap;
      varying vec3 reflectDir;


      vec4 lookupEnv (vec3 dir) {
        float lat = atan(dir.z, dir.x);
        float lon = acos(dir.y / length(dir));
        return texture2D(envmap, vec2(
          0.5 + lat / (2.0 * 3.14),
          lon / 3.14));
      }

      void main () {
        gl_FragColor = lookupEnv(reflectDir);
      }'

    uniforms: 
      envmap: envmap

      view: regl.prop 'view'

      projection: (view) =>
        mat4.perspective [],
          Math.PI / 4,
          view.viewportWith / view.viewPortHeight,
          0.01,
          1000

      invView: (context, view) =>
        mat4.invert [], view.view


  drawBackground = regl
    vert: 'precision mediump float;
      attribute vec2 position;
      uniform mat4 view;
      varying vec3 reflectDir;
      void main() {
        reflectDir = (view * vec4(position, 1, 0)).xyz;
        gl_Position = vec4(position, 0, 1);
      }'

    attributes: 
      position: [
        -4, -4
        -4, 4,
        8, 0
      ]

    depth: 
      mask:   false
      enable: false

    count: 3

  drawBunny = regl
    vert: '
    precision mediump float;
    attribute vec3 position, normal;
    uniform mat4 view, projection;
    varying vec3 fragNormal, fragPosition;
    void main() {
      fragNormal = normal;
      fragPosition = position;
      gl_Position = projection * view * vec4(position, 1);
    }',

    frag: '
    precision mediump float;
    struct Light {
      vec3 color;
      vec3 position;
    };
    uniform Light lights[4];
    varying vec3 fragNormal, fragPosition;
    void main() {
      vec3 normal = normalize(fragNormal);
      vec3 light = vec3(0, 0, 0);
      for (int i = 0; i < 4; ++i) {
        vec3 lightDir = normalize(lights[i].position - fragPosition);
        float diffuse = max(0.0, dot(lightDir, normal));
        light += diffuse * lights[i].color;
      }
      gl_FragColor = vec4(light, 1);
    }',

    attributes:
      position: bunny.positions
      normal: normals bunny.cells, bunny.positions

    elements: bunny.cells

    uniforms:
      view: (tick) =>
        t = 0.01 * tick.tick
        mat4.lookAt([],
          [ 10 * Math.cos(t), t * 2, Math.sin(t) * 10 ]
          [0, 2.5, 0],
          [0, 2, 0])

      projection: (vp) =>
        mat4.perspective([],
          Math.PI / 2,
          vp.viewportWidth / vp.viewportHeight,
          0.01,
          100)
      'lights[0].color': [0, 0.1, 0],
      'lights[1].color': [0.9, 0, 0.1],
      'lights[2].color': [0.9, 1, 0.9],
      'lights[3].color': [0.7, 0.1, 0.25],
      'lights[0].position': (tick) =>
        t = 0.1 * tick.tick
        [
          10 * Math.cos(0.09 * (t)),
          10 * Math.sin(0.09 * (2 * t)),
          10 * Math.cos(0.09 * (3 * t))
        ]
      'lights[1].position': (tick) =>
        t = 0.1 * tick.tick
        [
          10 * Math.cos(0.05 * (5 * t + 1)),
          90 * Math.sin(0.05 * (4 * t)),
          10 * Math.cos(0.05 * (0.1 * t))
        ]
      'lights[2].position': (tick) =>
        t = 0.1 * tick.tick
        [
          10 * Math.cos(0.05 * (9 * t)),
          10 * Math.sin(0.05 * (0.25 * t)),
          10 * Math.cos(0.05 * (4 * t))
        ]
      'lights[3].position': (tick) =>
        t = 0.1 * tick.tick
        [
          10 * Math.cos(0.1 * (0.3 * t)),
          10 * Math.sin(0.1 * (2.1 * t)),
          10 * Math.cos(0.1 * (1.3 * t))
        ]
  

  (require 'resl')
    manifest: 
      envmap:
        type: 'image'
        stream: true
        src: 'stars.png'
        parser: envmap


    onDone: =>
      regl.frame (payload) =>
        {tick} = payload

        t = 0.01 * tick

        draw = =>
          drawBackground()
          drawBunny()

        setupEnvMap
          view: mat4.lookAt([],
            [10 * Math.cos(t), t * 2, 10 * Math.sin(t)],
            [0, 2.5, 0],
            [0, 1, 0]),

          draw

    onProgress: (fraction) =>
      intensity = 1.0 - fraction

      regl.clear
        color: [ intensity, intensity, intensity, 1 ]



mountRegl.subscribe (id) ->

  mount = null

  checkForMount = =>
    setTimeout setMount, 100

  setMount = => 
    mount = document.getElementById id

    if mount?
      runRegl mount

      mount.children[0].id = 'regl-canvas'

    else
      checkForMount()

  checkForMount mount

unmountRegl.subscribe ->
  canvas = document.getElementById 'regl-canvas'

  canvas.remove()


