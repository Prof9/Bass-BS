var Animations = {
	Explosion: {
		width: 48,
		height: 48,
		anim: 0,
		url: 'explosion.png',
		loop: false,
		flip: false,
		frames: [
			0, 1,
			2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9,
			10, 10, 10, 11, 11, 11, 12, 12, 12
		]
	},
	MegaManBattlePose: {
		width: 64,
		height: 144,
		anim: 26,
		url: 'megaman.png',
		loop: true,
		flip: false,
		frames: [
			0,
		]
	},
	MegaManUsePose: {
		width: 64,
		height: 144,
		anim: 43,
		url: 'megaman.png',
		loop: true,
		flip: true,
		frames: [
			0,
		]
	},
	MegaManUsePoseFlashing: {
		width: 64,
		height: 144,
		anim: 42,
		url: 'megaman.png',
		loop: true,
		flip: true,
		frames: [
			0, 0,
			1, 1,
		]
	},
	MegaManDashStart: {
		width: 64,
		height: 144,
		anim: 59,
		url: 'megaman.png',
		loop: true,
		flip: false,
		frames: [
			2, 2, 2,
			3, 3,
		]
	},
	MegaManDash: {
		width: 64,
		height: 144,
		anim: 59,
		url: 'megaman.png',
		loop: true,
		flip: false,
		frames: [
			3,
		]
	},
	MegaManDashRise: {
		width: 64,
		height: 144,
		anim: 59,
		url: 'megaman.png',
		loop: true,
		flip: false,
		frames: [
			5, 5,
			6, 6,
			7, 7,
			8, 8,
			9, 9,
			10, 10,
			21, 21,
			10, 10,
			21, 21,
			10, 10,
			21, 21,
			10, 10,
			21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21, 21,
			22, 22,
			23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23, 23
		]
	},
	MegaManDashFall: {
		width: 64,
		height: 144,
		anim: 59,
		url: 'megaman.png',
		loop: true,
		flip: false,
		frames: [
			13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13,
			13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13,
			12, 12, 12, 12,
			11, 11, 11, 11,
			14, 14,
			11, 11,
			14, 14,
			11, 11,
			14, 14,
			11, 11,
			14, 14,
			15, 15,
			16, 16,
			17, 17,
			18, 18,
			19, 19,
			20, 20
		]
	},
	MegaManLand: {
		width: 64,
		height: 144,
		anim: 59,
		url: 'megaman.png',
		loop: true,
		flip: false,
		frames: [
			20
		]
	},
	Bass: {
		width: 88,
		height: 80,
		anim: 5,
		url: 'bass.png',
		loop: true,
		flip: false,
		frames: [
			0, 0, 0, 0, 0, 0, 0, 0, 0,
			1, 1, 1, 1, 1, 1, 1, 1, 1,
			2, 2, 2, 2, 2, 2, 2, 2, 2,
			3, 3, 3, 3, 3, 3, 3, 3, 3
		]
	},
	BassFlashing: {
		width: 88,
		height: 80,
		anim: 28,
		url: 'bass.png',
		loop: true,
		flip: false,
		frames: [
			0, 0, 0, 0, 1, 1, 1, 1, 1,
			2, 2, 2, 2, 3, 3, 3, 3, 3,
			4, 4, 4, 4, 5, 5, 5, 5, 5,
			6, 6, 6, 6, 7, 7, 7, 7, 7
		]
	},
	BassHurt: {
		width: 88,
		height: 80,
		anim: 29,
		url: 'bass.png',
		loop: true,
		flip: false,
		frames: [
			0, 0, 0, 0, 0, 0, 0,
			1, 1, 1,
			2, 2, 2, 2, 2, 2, 2,
			3, 3, 3
		]
	},
	BassDeath: {
		width: 88,
		height: 80,
		anim: 30,
		url: 'bass.png',
		loop: true,
		flip: false,
		frames: [
			0, 0,
			1, 1
		]
	},
	SlashHorizontal: {
		width: 152,
		height: 43,
		anim: 0,
		url: 'slash1.png',
		loop: false,
		flip: false,
		frames: [
			0, 0,
			1, 1,
			2, 2, 2, 2,
			3, 3,
			4, 4,
			5,
		]
	},
	SlashVertical: {
		width: 81,
		height: 107,
		anim: 0,
		url: 'slash2.png',
		loop: false,
		flip: false,
		frames: [
			0, 0,
			1, 1,
			2, 2, 2, 2,
			3, 3,
			4, 4,
			5,
		]
	}
}

var bg = $('#bg');
var fade = $('#fade');
var sprites = [];
var timers = [];
var seed = 0xA338244F;
var camera = {
	x: 584,
	y: 132,
	vx: 0,
	vy: 0
}
var fadeColor = 'transparent';
var fadeCur = 0;
var fadeLen = 0;
var fadeVel = 0;
var exploding = {
	active: false,
	timer: 0,
	speed: 0,
	sprite: 0,
	first: true
}
var map = {
	width: 1344,
	height: 992,
	url: 'map.png',
	timer: 0,
	speed: 20,
	frame: 0,
	frames: [
		0, 1, 2, 3, 4, 5, 4, 3, 2, 1
	]
}
var frame = 0;
var speed = 1;

function rng() {
	seed = (((seed << 1) + (seed >>> 0x1F) + 1) ^ 0x873CA9E5) >>> 0;
	return seed;
}
function spawnSprite(name, x, y, under) {
	var anim = Animations[name];
	var elem = $('<div/>').addClass('sprite').css({
		left: x,
		top: y,
		width: anim.width,
		height: anim.height,
		background: "url(" + anim.url + ")"
	});
	var sprite = {
		anim: anim,
		elem: elem,
		frame: 0,
		x: x,
		y: y,
		vx: 0,
		vy: 0,
		z: 100,
		remove: false
	};
	sprites.push(sprite);
	if (under) {
		elem.prependTo(bg);
	} else {
		elem.appendTo(bg);
	}
	
	return sprite;
}
function setSprite(sprite, name, reset) {
	var anim = Animations[name];
	sprite.anim = anim;
	
	if (reset) {
		sprite.frame = 0;
	}
}
function spawnExplosion(x, y, first) {
	var seed = Math.floor(Math.random() * 4294967296);
	if (first) {
		seed = 0x0F0F0F;
	} else {
		seed = rng();
	}
	x += ((seed & 0x1F) - 15) * 1.5;
	y += ((seed >>> 8) & 0x1F) - 15;
	
	return spawnSprite("Explosion", x, y);
}
function startExploding(sprite, speed) {
	exploding = {
		active: true,
		timer: 0,
		speed: speed,
		sprite: sprite,
		first: true
	}
}
function setTimer(frames, callback) {
	timers.push({
		count: frames,
		callback: callback
	})
}
function startFadeOut(color, length) {
	fadeColor = color;
	fadeCur = 0;
	fadeLen = length;
	fadeVel = 1;
	setTimer(length + 1, function() {
		fadeVel = 0;
	});
}
function startFadeIn(length) {
	fadeCur = length;
	fadeLen = length;
	fadeVel = -1;
	setTimer(length + 1, function() {
		fadeVel = 0;
	});
}

var x = 0;
function update() {
	if (++frame >= speed) {
		// Update RNG
		rng();
		
		// Update timers
		for (var i = 0; i < timers.length; i++) {
			var timer = timers[i];
			
			if (--timer.count == 0) {
				timers.splice(i--, 1);
				timer.callback();
			}
		}
		
		// Update explosion
		if (exploding.active) {
			if (++exploding.timer == exploding.speed) {
				exploding.timer = 0;
				var explosion = spawnExplosion(exploding.sprite.x, exploding.sprite.y, exploding.first);
				explosion.z = exploding.sprite.z + (Math.random() >= 0.5 ? 1 : -1);
				exploding.first = false;
			}
		}
		
		// Update sprites
		for (var i = 0; i < sprites.length; i++) {
			var sprite = sprites[i];
			
			if (sprite.remove || ++sprite.frame >= sprite.anim.frames.length) {
				if (sprite.anim.loop && !sprite.remove) {
					sprite.frame = 0;
				} else {
					sprite.elem.css({
						display: 'none',
					})
					sprite.elem.remove();
					sprites.splice(i--, 1);
					continue;
				}
			}
			
			sprite.x += sprite.vx;
			sprite.y += sprite.vy;
			sprite.elem.css({
				left: sprite.x - sprite.anim.width / 2,
				top: sprite.y - sprite.anim.height / 2,
				width: sprite.anim.width,
				height: sprite.anim.height,
				zIndex: sprite.z,
				background: 'url(' + sprite.anim.url + ')',
				backgroundPositionX: -sprite.anim.frames[sprite.frame] * sprite.anim.width,
				backgroundPositionY: -sprite.anim.anim * sprite.anim.height,
				transform: 'scaleX(' + (sprite.anim.flip ? '-1' : '1') + ')'
			})
		}
		
		// Update map
		if (++map.timer == map.speed) {
			map.timer = 0;
			if (++map.frame >= map.frames.length) {
				map.frame = 0;
			}
			
			bg.css({
				background: 'url(' + map.url + ')',
				backgroundPositionX: -map.frames[map.frame] * map.width,
				backgroundPositionY: 0
			})
		}
		
		// Update camera
		camera.x += camera.vx;
		camera.y += camera.vy;
		bg.css({
			left: -camera.x + 'px',
			top: -camera.y + 'px'
		});
		
		// Update fade
		fadeCur += fadeVel;
		fade.css({
			background: fadeColor,
			opacity: fadeCur / fadeLen
		});
		
		frame = 0;
	}
	
	requestAnimationFrame(update);
}
requestAnimationFrame(update);