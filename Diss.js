var container, controls, camera, renderer, scene, light, time;
rotationSpeed = 1;
clock = new THREE.Clock();
WIDTH = window.innerWidth - 30;
HEIGHT = window.innerHeight - 30;
var delta=0;
//cam vars
var angle = 45,
aspect = WIDTH / HEIGHT,
near = 0.1,
far = 10000;
locked=0;

Myo.connect('com.stolksdorf.myAwesomeApp');

Myo.on('fist', function(){
	console.log('Hello Myo!');
	this.vibrate();
		for (var i = 0; i < 6; i++)
		{
			zoomIn();
		}
});
Myo.on('fingers_spread', function(){
	console.log('Hello Myo!');
	this.vibrate();
	for (var i = 0; i < 6; i++)
		{
			zoomOut();
		}
});
Myo.on('wave_in', function(){
	console.log('Hello Myo!');
	this.vibrate();
		for (var i = 0; i < 6; i++)
		{
			cameraLeft();
		}
});
Myo.on('wave_out', function(){
	console.log('Hello Myo!');
	this.vibrate();
		for (var i = 0; i < 6; i++)
		{
			cameraRight();
		}
});
var numZooms = 0;
function zoomIn() {
	var cameraX = camera.position.x;
	var cameraY = camera.position.y;
	var cameraZ = camera.position.z;
	cameraZ -= 10;
	camera.position.set(cameraX, cameraY, cameraZ);
 	controls.update();
 	numZooms++;
 	if (numZooms <= 10) setTimeout("zoomIn();", 100);
}
function zoomOut() {
	var cameraX = camera.position.x;
	var cameraY = camera.position.y;
	var cameraZ = camera.position.z;
	cameraZ += 10;
	camera.position.set(cameraX, cameraY, cameraZ);
 	controls.update();
 	numZooms++;
 	if (numZooms <= 10) setTimeout("zoomOut();", 100);
}
function cameraLeft() {
    var position = new THREE.Vector3();
    position.setFromMatrixPosition(sunMesh.matrixWorld);
    controls.target.set(position.x,position.y,position.z);
	var cameraX = camera.position.x;
	var cameraY = camera.position.y;
	var cameraZ = camera.position.z;
	cameraX -= Math.sin(4.15*0.5);
	cameraZ += Math.sin(4.15*0.5);
	camera.position.set(cameraX, cameraY, cameraZ);
 	controls.update();
 	numZooms++;
 	if (numZooms <= 10) setTimeout("cameraLeft();", 100);
}
function cameraRight() {
    var position = new THREE.Vector3();
    position.setFromMatrixPosition(sunMesh.matrixWorld);
    controls.target.set(position.x,position.y,position.z);
	var cameraX = camera.position.x;
	var cameraY = camera.position.y;
	var cameraZ = camera.position.z;
	cameraX +=Math.sin(4.15*0.5);
	cameraZ -=Math.sin(4.15*0.5);
	camera.position.set(cameraX, cameraY, cameraZ);
 	controls.update();
 	numZooms++;
 	if (numZooms <= 10) setTimeout("cameraRight();", 100);
}
 container = document.createElement('div');
    document.body.appendChild(container);
                
    //cam
    camera = new THREE.PerspectiveCamera(angle, aspect, near, far);
    camera.position.set(250, 50, 250);

     //scene
    scene = new THREE.Scene();
    camera.lookAt(scene.position);
                 

        // Options to be added to the GUI

var options = {
  vel: 1,
  stop: function() {
	if(locked==0)
    {
		locked=1;
	}
	else
    {
		locked=0;
	}
		this.vely = 0;
		clock.start();
        var position = new THREE.Vector3();
        position.setFromMatrixPosition(earthMesh.matrixWorld);
        position.x = 1;
   		position.z = 1;
        position.setFromMatrixPosition(moonMesh.matrixWorld);
        position.x = 1;
        position.z = 1;
  },
  reset: function()
  {
    this.vel = 1;
        controls.reset();
    var position = new THREE.Vector3();
    position.setFromMatrixPosition(sunMesh.matrixWorld);
    controls.target.set(position.x,position.y,position.z);
 	camera.position.set(position.x-250,position.y+50,position.z-250);
 	 	controls.update();
  },  
  mercury: function()
 {
   var v=document.getElementById("Mercury");
   if(v.style.visibility=="visible")
  {
   	v.style.visibility = "hidden";
   	options.stop();
   }
   else
   {
    v.style.visibility = "visible";
    controls.reset();
    var position = new THREE.Vector3();
    position.setFromMatrixPosition(mercuryMesh.matrixWorld);
    controls.target.set(position.x,position.y,position.z);
 	camera.position.set(position.x-30,position.y+50,position.z-30);
 	
 	controls.update();
 	
 	options.stop();
   }
 },
   venus: function()
 {
   var v=document.getElementById("Venus");
   if(v.style.visibility=="visible")
  {
   	v.style.visibility = "hidden";
   	options.stop();
   }
   else
   {
    v.style.visibility = "visible";
    controls.reset();
    var position = new THREE.Vector3();
    position.setFromMatrixPosition(venusMesh.matrixWorld);
    controls.target.set(position.x,position.y,position.z);
 	camera.position.set(position.x-30,position.y+50,position.z-30);
 	
 	controls.update();
 	
 	options.stop();
   }
 },
  earth: function()
  {
    var v=document.getElementById("Earth");
    if(v.style.visibility=="visible")
   {
    	v.style.visibility = "hidden";
    	options.stop();
    }
    else
    {
     v.style.visibility = "visible";
     controls.reset();
     var position = new THREE.Vector3();
     position.setFromMatrixPosition(earthMesh.matrixWorld);
     controls.target.set(position.x,position.y,position.z);
  	camera.position.set(position.x-30,position.y+50,position.z-30);
  	
  	controls.update();
  	
  	options.stop();
    }
  },
  moon: function()
{
  var m=document.getElementById("Moon");
  if(m.style.visibility=="visible")
  {
  	m.style.visibility = "hidden";
  	options.stop();
  }
  else
  {
    m.style.visibility = "visible";
    controls.reset();
    var position = new THREE.Vector3();
    position.setFromMatrixPosition(moonMesh.matrixWorld);
    controls.target.set(position.x,position.y,position.z);
	camera.position.set(position.x-30,position.y+50,position.z-30);
		
   	controls.update();
	
   	options.stop();
  }
},
  mars: function()
  {
    var v=document.getElementById("Mars");
    if(v.style.visibility=="visible")
   {
    	v.style.visibility = "hidden";
    	options.stop();
    }
    else
    {
     v.style.visibility = "visible";
     controls.reset();
     var position = new THREE.Vector3();
     position.setFromMatrixPosition(marsMesh.matrixWorld);
     controls.target.set(position.x,position.y,position.z);
  	camera.position.set(position.x-30,position.y+50,position.z-30);
  	
  	controls.update();
  	
  	options.stop();
    }
  },
    jupiter: function()
  {
    var v=document.getElementById("Jupiter");
    if(v.style.visibility=="visible")
   {
    	v.style.visibility = "hidden";
    	options.stop();
    }
    else
    {
     v.style.visibility = "visible";
     controls.reset();
     var position = new THREE.Vector3();
     position.setFromMatrixPosition(jupiterMesh.matrixWorld);
     controls.target.set(position.x,position.y,position.z);
  	camera.position.set(position.x-300,position.y+500,position.z-300);
  	
  	controls.update();
  	
  	options.stop();
    }
  },
   saturn: function()
  {
    var v=document.getElementById("Saturn");
    if(v.style.visibility=="visible")
   {
    	v.style.visibility = "hidden";
    	options.stop();
    }
    else
    {
     v.style.visibility = "visible";
     controls.reset();
     var position = new THREE.Vector3();
     position.setFromMatrixPosition(saturnMesh.matrixWorld);
     controls.target.set(position.x,position.y,position.z);
  	camera.position.set(position.x-300,position.y+500,position.z-300);
  	
  	controls.update();
  	
  	options.stop();
    }
  },
uranus: function()
{
  var m=document.getElementById("Uranus");
  if(m.style.visibility=="visible")
  {
  	m.style.visibility = "hidden";
  	options.stop();
  }
  else
  {
    m.style.visibility = "visible";
    controls.reset();
    var position = new THREE.Vector3();
    position.setFromMatrixPosition(uranusMesh.matrixWorld);
    controls.target.set(position.x,position.y,position.z);
	camera.position.set(position.x-200,position.y+400,position.z-200);
		
   	controls.update();
	
   	options.stop();
  }
},
};

// DAT.GUI Related Stuff

var gui = new dat.GUI();

var velocity = gui.addFolder('Velocity');
velocity.add(options, 'vel', -50, 50).name('Vel').listen();

velocity.open();

gui.add(options, 'mercury');
gui.add(options, 'venus');
gui.add(options, 'earth');
gui.add(options, 'moon');
gui.add(options, 'mars');
gui.add(options, 'jupiter');
gui.add(options, 'saturn');
gui.add(options, 'uranus');
gui.add(options, 'stop');
gui.add(options, 'reset');

    //sun
    var sunGeo = new THREE.SphereGeometry (109, 400, 400),
        sunMat = new THREE.MeshPhongMaterial();
        sunMesh = new THREE.Mesh(sunGeo, sunMat);
                
    sunMesh.position.set(0, 0, 0);
    sunMesh.rotation.y=5;
    scene.add(sunMesh);

    //light          
    light = new THREE.SpotLight(0xFFFFFF, 1, 0, Math.PI / 2, 1);
    light.position.set(45, 4000, 1500);
    light.target.position.set (1000, 3800, 1000);
    light.castShadow = true;

        scene.add(light);
                
    //diffuseS
    sunMat.map = THREE.ImageUtils.loadTexture('1024-512-sun.jpg');

    sunMesh.castShadow = true;
    sunMesh.receiveShadow = true;

    //path
    var pathMERGeo = new THREE.TorusGeometry (160, 0.5, 16, 100),
    pathMERMat = new THREE.MeshBasicMaterial({color: 0xFFFFFF});
    pathMERMesh = new THREE.Mesh(pathMERGeo, pathMERMat);
                
    pathMERMesh.rotation.y=5;
    pathMERMesh.rotation.y=15.7;
    pathMERMesh.rotation.x =230.9;

    var pathVGeo = new THREE.TorusGeometry (436, 0.5, 16, 100),
    pathVMat = new THREE.MeshBasicMaterial({color: 0xFFFFFF});
    pathVMesh = new THREE.Mesh(pathVGeo, pathVMat);
                
    pathVMesh.rotation.y=5;
    pathVMesh.rotation.y=15.7;
    pathVMesh.rotation.x =230.9;

    var pathEGeo = new THREE.TorusGeometry (608, 0.5, 16, 100),
    pathEMat = new THREE.MeshBasicMaterial({color: 0xFFFFFF});
    pathEMesh = new THREE.Mesh(pathEGeo, pathEMat);
                
    pathEMesh.rotation.y=5;
    pathEMesh.rotation.y=15.7;
    pathEMesh.rotation.x =230.9;

    var pathMARGeo = new THREE.TorusGeometry (911.6, 0.5, 16, 100),
    pathMARMat = new THREE.MeshBasicMaterial({color: 0xFFFFFF});
    pathMARMesh = new THREE.Mesh(pathMARGeo, pathMARMat);
                
    pathMARMesh.rotation.y=5;
    pathMARMesh.rotation.y=15.7;
    pathMARMesh.rotation.x =230.9;
    
    var pathJUPGeo = new THREE.TorusGeometry (1857, 0.5, 16, 100),
    pathJUPMat = new THREE.MeshBasicMaterial({color: 0xFFFFFF});
    pathJUPMesh = new THREE.Mesh(pathJUPGeo, pathJUPMat);
                
    pathJUPMesh.rotation.y=5;
    pathJUPMesh.rotation.y=15.7;
    pathJUPMesh.rotation.x =230.9;

    var pathSATGeo = new THREE.TorusGeometry (3114, 0.5, 16, 100),
    pathSATMat = new THREE.MeshBasicMaterial({color: 0xFFFFFF});
    pathSATMesh = new THREE.Mesh(pathSATGeo, pathSATMat);
                
    pathSATMesh.rotation.y=5;
    pathSATMesh.rotation.y=15.7;
    pathSATMesh.rotation.x =230.9;

    var pathURGeo = new THREE.TorusGeometry (6228, 0.5, 16, 100),
    pathURMat = new THREE.MeshBasicMaterial({color: 0xFFFFFF});
    pathURMesh = new THREE.Mesh(pathURGeo, pathURMat);
                
    pathURMesh.rotation.y=5;
    pathURMesh.rotation.y=15.7;
    pathURMesh.rotation.x =230.9;

	scene.add(pathMERMesh);
    scene.add(pathVMesh);
	scene.add(pathEMesh);
    scene.add(pathMARMesh);
    scene.add(pathJUPMesh);
    scene.add(pathSATMesh);
    scene.add(pathURMesh);

    //mercury
    var mercuryGeo = new THREE.SphereGeometry (3, 400, 400),
        mercuryMat = new THREE.MeshPhongMaterial();
        mercuryMesh = new THREE.Mesh(mercuryGeo, mercuryMat);
                
    mercuryMesh.rotation.y=5;
    scene.add(mercuryMesh);
                
    //diffuseMer
    mercuryMat.map = THREE.ImageUtils.loadTexture('1024-512-mercury.jpg');
    //bumpMer
    mercuryMat.bumpMap = THREE.ImageUtils.loadTexture('1024-512-mercury.jpg');
    mercuryMat.bumpScale = 5;
    //specularMer
    mercuryMat.specularMap = THREE.ImageUtils.loadTexture('1024-512-mercury.jpg');
    mercuryMat.specular = new THREE.Color('#2e2e2e');

    //venus
    var venusGeo = new THREE.SphereGeometry (10, 400, 400),
        venusMat = new THREE.MeshPhongMaterial();
    venusMesh = new THREE.Mesh(venusGeo, venusMat);
                
    venusMesh.rotation.y=5;
    scene.add(venusMesh);
                
    //diffuseV
    venusMat.map = THREE.ImageUtils.loadTexture('1024-512-venus.jpg');
    //bumpV
    venusMat.bumpMap = THREE.ImageUtils.loadTexture('1024-512-venus.jpg');
    venusMat.bumpScale = 5;
    //specularV
    venusMat.specularMap = THREE.ImageUtils.loadTexture('1024-512-venus.jpg');
    venusMat.specular = new THREE.Color('#2e2e2e');

    //earth
    var earthGeo = new THREE.SphereGeometry (10, 400, 400),
    earthMat = new THREE.MeshPhongMaterial();
    earthMesh = new THREE.Mesh(earthGeo, earthMat);
                
    earthMesh.rotation.y=5;
    scene.add(earthMesh);
                
    //diffuseE
    earthMat.map = THREE.ImageUtils.loadTexture('16200_x_8100_earth.jpg');
    //bumpE
    earthMat.bumpMap = THREE.ImageUtils.loadTexture('16200_x_8100_earth.jpg');
    earthMat.bumpScale = 5;
    //specularE
    earthMat.specularMap = THREE.ImageUtils.loadTexture('16200_x_8100_earth.jpg');
    earthMat.specular = new THREE.Color('#2e2e2e');

	//moon
    var moonGeo = new THREE.SphereGeometry (2.7, 400, 400),
    moonMat = new THREE.MeshPhongMaterial();
    moonMesh = new THREE.Mesh(moonGeo, moonMat);
                
    moonMesh.rotation.y=5;
    scene.add(moonMesh);
                
    //diffuseE
    moonMat.map = THREE.ImageUtils.loadTexture('moon-1k.jpg');
    //bumpE
    moonMat.bumpMap = THREE.ImageUtils.loadTexture('moon-1k.jpg');
    moonMat.bumpScale = 5;
    //specularE
    moonMat.specularMap = THREE.ImageUtils.loadTexture('moon-1k.jpg');
    moonMat.specular = new THREE.Color('#2e2e2e');

    //mars
    var marsGeo = new THREE.SphereGeometry (5, 400, 400),
    marsMat = new THREE.MeshPhongMaterial();
    marsMesh = new THREE.Mesh(marsGeo, marsMat);
                
    marsMesh.rotation.y=5;
    scene.add(marsMesh);
                
    //diffuseMa
    marsMat.map = THREE.ImageUtils.loadTexture('mars-1k.jpg');
    //bumpMa
    marsMat.bumpMap = THREE.ImageUtils.loadTexture('mars-1k.jpg');
    marsMat.bumpScale = 5;
    //specularMa
    marsMat.specularMap = THREE.ImageUtils.loadTexture('mars-1k.jpg');
    marsMat.specular = new THREE.Color('#2e2e2e');

    //jupiter
    var jupiterGeo = new THREE.SphereGeometry (110, 400, 400),
        jupiterMat = new THREE.MeshPhongMaterial();
    jupiterMesh = new THREE.Mesh(jupiterGeo, jupiterMat);
                
    jupiterMesh.rotation.y=5;
    scene.add(jupiterMesh);
                
    //diffuseJ
    jupiterMat.map = THREE.ImageUtils.loadTexture('jupiter-1k.jpg');
    jupiterMat.specularMap = THREE.ImageUtils.loadTexture('jupiter-1k.jpg');
    jupiterMat.specular = new THREE.Color('#2e2e2e');

    //ring1S
    var ringGeo1S = new THREE.RingGeometry(110, 140, 32);
    ringMat1S = new THREE.MeshBasicMaterial();
    ringMesh1S = new THREE.Mesh(ringGeo1S, ringMat1S);
                
    ringMesh1S.rotation.y=15.7;
    ringMesh1S.rotation.x =230.9;
    
                
    //diffuseR1S
    ringMat1S.map = THREE.ImageUtils.loadTexture('saturn-ring.jpg');
               
    ringMesh1S.castShadow = true;
    ringMesh1S.receiveShadow = true;
      scene.add(ringMesh1S);

    //ring2S
    var ringGeo2S = new THREE.RingGeometry(110, 140, 32);
    ringMat2S = new THREE.MeshBasicMaterial();
    ringMesh2S = new THREE.Mesh(ringGeo2S, ringMat2S);
                
    ringMesh2S.rotation.y=-15.7;
    ringMesh2S.rotation.x = -230.9;
    
                
    //diffuseR2S
    ringMat2S.map = THREE.ImageUtils.loadTexture('saturn-ring.jpg');
               
    ringMesh2S.castShadow = true;
    ringMesh2S.receiveShadow = true;
      scene.add(ringMesh2S);

    //saturn
    var saturnGeo = new THREE.SphereGeometry (95, 400, 400),
    saturnMat = new THREE.MeshPhongMaterial();
    saturnMesh = new THREE.Mesh(saturnGeo, saturnMat);
                
    saturnMesh.rotation.y=5;
    scene.add(saturnMesh);
                
    //diffuseS
    saturnMat.map = THREE.ImageUtils.loadTexture('saturn-planet.jpg');

    //specularS
    saturnMat.specularMap = THREE.ImageUtils.loadTexture('saturn-planet.jpg');
    saturnMat.specular = new THREE.Color('#2e2e2e');

    //ring1U
    var ringGeo1U = new THREE.RingGeometry(50, 70, 32);
    ringMat1U = new THREE.MeshBasicMaterial();
    ringMesh1U = new THREE.Mesh(ringGeo1U, ringMat1U);
                
    ringMesh1U.rotation.y=15.7;
    ringMesh1U.rotation.x =230.9;
    
                
    //diffuseR1U
    ringMat1U.map = THREE.ImageUtils.loadTexture('uranus-ring.jpg');
               
    ringMesh1U.castShadow = true;
    ringMesh1U.receiveShadow = true;
    scene.add(ringMesh1U);

    //ring2U
    var ringGeo2U = new THREE.RingGeometry(50, 70, 32);
    ringMat2U = new THREE.MeshBasicMaterial();
    ringMesh2U = new THREE.Mesh(ringGeo2U, ringMat2U);
                
    ringMesh2U.rotation.y=-15.7;
    ringMesh2U.rotation.x = -230.9;
                
    //diffuseR2
    ringMat2U.map = THREE.ImageUtils.loadTexture('uranus-ring.jpg');
               
    ringMesh2U.castShadow = true;
    ringMesh2U.receiveShadow = true;
    scene.add(ringMesh2U);

    //uranus
    var uranusGeo = new THREE.SphereGeometry (40, 400, 400),
        uranusMat = new THREE.MeshPhongMaterial();
    uranusMesh = new THREE.Mesh(uranusGeo, uranusMat);
                
    uranusMesh.rotation.y=5;
    scene.add(uranusMesh);
                
    //diffuseU
    uranusMat.map = THREE.ImageUtils.loadTexture('uranus-planet.jpg');
    //bumpU
    uranusMat.bumpMap = THREE.ImageUtils.loadTexture('uranus-planet.jpg');
    uranusMat.bumpScale = 5;

    //Stars
    var starGeo = new THREE.SphereGeometry (6700, 10, 100),
        starMat = new THREE.MeshBasicMaterial();
    starMat.map = THREE.ImageUtils.loadTexture('stars.jpg');
    starMat.side = THREE.BackSide;
                
    var starMesh = new THREE.Mesh(starGeo, starMat);
                
    scene.add(starMesh);
                
                
    //renderer
    renderer = new THREE.WebGLRenderer({antialiasing : true});
    renderer.setSize(WIDTH, HEIGHT);
                
    container.appendChild(renderer.domElement);


    //controls
    controls = new THREE.OrbitControls( camera, renderer.domElement);
    controls.addEventListener( 'change', render );

     function animate(){
                
        requestAnimationFrame(animate);
        controls.update();
        render();       
      }
      function render(){
 delta += clock.getDelta(); 

 				mercuryMesh.rotation.y = (rotationSpeed/56.85) * delta * options.vel;
 				venusMesh.rotation.y = (rotationSpeed/256) * delta * options.vel;
        		earthMesh.rotation.y = (rotationSpeed) * delta * options.vel;
                moonMesh.rotation.y = (rotationSpeed*27) * delta * options.vel;
                marsMesh.rotation.y = (rotationSpeed*1.88) * delta * options.vel;
                jupiterMesh.rotation.y = (rotationSpeed*2.4) * delta * options.vel;
                saturnMesh.rotation.y = (rotationSpeed*2.28) * delta * options.vel;
                uranusMesh.rotation.y = (rotationSpeed*3.31) * delta * options.vel;
			if(locked==0)
            {   
            	mercuryMesh.position.x = Math.sin(delta*4.15*0.5* options.vel) * 160;
                mercuryMesh.position.z = Math.cos(delta*4.15*0.5* options.vel) * 160; 
                venusMesh.position.x = Math.sin(delta*1.6*0.5* options.vel) * 432;
                venusMesh.position.z = Math.cos(delta*1.6*0.5* options.vel) * 432;
                earthMesh.position.x = Math.sin(delta*0.5* options.vel) * 608;
                earthMesh.position.z = Math.cos(delta*0.5* options.vel) * 608;
                moonMesh.position.x = Math.sin(delta*0.5* options.vel) * 608 + Math.cos(delta*-3.5* options.vel) * -60;
                moonMesh.position.z = Math.cos(delta*0.5* options.vel) * 608 + Math.sin(delta*-3.5* options.vel) * -60;
			    marsMesh.position.x = Math.sin(delta*options.vel) * 911.6;
                marsMesh.position.z = Math.cos(delta*options.vel) * 911.6;
                jupiterMesh.position.x = Math.sin(delta/12.5* options.vel) * 1857;
                jupiterMesh.position.z = Math.cos(delta/12.5* options.vel) * 1857;
                saturnMesh.position.x = Math.sin(delta/29.5* options.vel) * 3114;
                saturnMesh.position.z = Math.cos(delta/29.5* options.vel) * 3114;
                ringMesh1S.position.x = Math.sin(delta/29.5* options.vel) * 3114;
				ringMesh1S.position.z = Math.cos(delta/29.5* options.vel) * 3114;
				ringMesh2S.position.x = Math.sin(delta/29.5* options.vel) * 3113.95;
				ringMesh2S.position.z = Math.cos(delta/29.5* options.vel) * 3113.95;
                uranusMesh.position.x = Math.sin(delta/84.5* options.vel) * 6226;
                uranusMesh.position.z = Math.cos(delta/84.5* options.vel) * 6226;
                ringMesh1U.position.x = Math.sin(delta/84.5* options.vel) * 6226;
				ringMesh1U.position.z = Math.cos(delta/84.5* options.vel) * 6226;
				ringMesh2U.position.x = Math.sin(delta/84.5* options.vel) * 6225.95;
				ringMesh2U.position.z = Math.cos(delta/84.5* options.vel) * 6225.95;
			}
			else
            {
                clock.stop();
                mercuryMesh.position.x = (Math.sin((delta*4.15*0.5)-clock.elapsedTime()) * 160) * options.vel;
              	mercuryMesh.position.z = (Math.cos((delta*4.15*0.5)-clock.elapsedTime()) * 160) * options.vel;
              	venusMesh.position.x = (Math.sin((delta*1.6*0.5)-clock.elapsedTime()) * 432) * options.vel;
              	venusMesh.position.z = (Math.cos((delta*1.6*0.5)-clock.elapsedTime()) * 432) * options.vel;
				earthMesh.position.x = (Math.sin((delta*0.5)-clock.elapsedTime()) * 608) * options.vel;
              	earthMesh.position.z = (Math.cos((delta*0.5)-clock.elapsedTime()) * 608) * options.vel;
                moonMesh.position.x = (Math.sin((delta*0.5)-clock.elapsedTime()) * 608 + Math.cos((delta*-3.5)-clock.elapsedTime()) * -654.5) * options.vel;
                moonMesh.position.z = (Math.cos((delta*0.5)-clock.elapsedTime()) * 608 + Math.sin((delta*-3.5)-clock.elapsedTime()) * -654.5) * options.vel;
               	marsMesh.position.x = (Math.sin((delta)-clock.elapsedTime()) * 911.6) * options.vel;
              	marsMesh.position.z = (Math.cos((delta)-clock.elapsedTime()) * 911.6) * options.vel;
              	jupiterMesh.position.x = (Math.sin((delta/12.5)-clock.elapsedTime()) * 1857) * options.vel;
				jupiterMesh.position.z = (Math.cos((delta/12.5)-clock.elapsedTime()) * 1857) * options.vel;
              	saturnMesh.position.x = (Math.sin((delta/29.5)-clock.elapsedTime()) * 3114) * options.vel;
				saturnMesh.position.z = (Math.cos((delta/29.5)-clock.elapsedTime()) * 3114) * options.vel;
              	ringMesh1SMesh.position.x = (Math.sin((delta/29.5)-clock.elapsedTime()) * 3114) * options.vel;
				ringMesh1SMesh.position.z = (Math.cos((delta/29.5)-clock.elapsedTime()) * 3114) * options.vel;
              	ringMesh2SMesh.position.x = (Math.sin((delta/29.5)-clock.elapsedTime()) * 3113.95) * options.vel;
				ringMesh2SMesh.position.z = (Math.cos((delta/29.5)-clock.elapsedTime()) * 3113.95) * options.vel;
              	uranusMesh.position.x = (Math.sin((delta/84.5)-clock.elapsedTime()) * 6226) * options.vel;
				uranusMesh.position.z = (Math.cos((delta/84.5)-clock.elapsedTime()) * 6226) * options.vel;
              	ringMesh1UMesh.position.x = (Math.sin((delta/84.5)-clock.elapsedTime()) * 6226) * options.vel;
				ringMesh1UMesh.position.z = (Math.cos((delta/84.5)-clock.elapsedTime()) * 6226) * options.vel;
              	ringMesh2UMesh.position.x = (Math.sin((delta/84.5)-clock.elapsedTime()) * 6225.95) * options.vel;
				ringMesh2UMesh.position.z = (Math.cos((delta/84.5)-clock.elapsedTime()) * 6225.95) * options.vel;                
                mercuryMesh.rotation.y = (rotationSpeed/56.85 - clock.getElapsedTime()) * options.vel;
                venusMesh.rotation.y = (rotationSpeed/256 - clock.getElapsedTime()) * options.vel;
                earthMesh.rotation.y = (rotationSpeed - clock.getElapsedTime()) * options.vel;
                moonMesh.rotation.y = (rotationSpeed*27 - clock.getElapsedTime()) * options.vel;
                marsMesh.rotation.y = (rotationSpeed*1.88 - clock.getElapsedTime()) * options.vel;
                jupiterMesh.rotation.y = (rotationSpeed*2.4 - clock.getElapsedTime()) * options.vel;
                saturnMesh.rotation.y = (rotationSpeed*2.28 - clock.getElapsedTime()) * options.vel;
                uranusMesh.rotation.y = (rotationSpeed*3.31 - clock.getElapsedTime()) * options.vel;
			}  
        renderer.clear();
        renderer.render(scene, camera); 
      }
animate();