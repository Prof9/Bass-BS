speed = 1;

var bass = spawnSprite("BassFlashing", 733, 161);
var megaman = spawnSprite("MegaManBattlePose", 675, 164);
megaman.z = 150;

var script = [
	{	delay: 60,
		then: function() {
			setSprite(megaman, "MegaManUsePose", true);
		}
	},{	delay: 30,
		then: function() {
			setSprite(megaman, "MegaManUsePoseFlashing", true);
		}
	},{	delay: 30,
		then: function() {
			var slash1 = spawnSprite("SlashHorizontal", bass.x - 7, bass.y);
			slash1.z = 125;
			slash1.vx = 0.5;
		}
	},{	delay: 5,
		then: function() {
			setSprite(bass, "BassHurt", true);
			bass.vx = 1;
		}
	},{	delay: 2,
		then: function() {
			bass.vx = -3;
		}
	},{	delay: 2,
		then: function() {
			bass.vx = 4;
		}
	},{	delay: 2,
		then: function() {
			bass.vx = -3;
		}
	},{	delay: 2,
		then: function() {
			bass.vx = 1;
		}
	},{	delay: 2,
		then: function() {
			bass.vx = 0;
			var slash2 = spawnSprite("SlashVertical", bass.x - 2, bass.y + 14);
			slash2.z = 125;
			slash2.vy = -0.25;
		}
	},{	delay: 5,
		then: function() {
			setSprite(bass, "BassHurt", true);
			bass.vx = -1;
		}
	},{	delay: 2,
		then: function() {
			bass.vx = 3;
		}
	},{	delay: 2,
		then: function() {
			bass.vx = -4;
		}
	},{	delay: 2,
		then: function() {
			bass.vx = 3;
		}
	},{	delay: 2,
		then: function() {
			bass.vx = -1;
		}
	},{	delay: 2,
		then: function() {
			bass.vx = 0;
		}
	},{	delay: 20,
		then: function() {
			setSprite(megaman, "MegaManDashStart", true);
			camera.vx = 0.5;
			camera.vy = -0.25;
			megaman.vx = 1;
			megaman.vy = -0.5;
		}
	},{	delay: 4,
		then: function() {
			setSprite(megaman, "MegaManDashRise", true);
		}
	},{	delay: 12,
		then: function() {
			camera.vx = 0;
			camera.vy = 0;
			megaman.vx = 0;
			megaman.vy = 0;
		}
	},{	delay: 22,
		then: function() {
			camera.vx = 2;
			camera.vy = -1;
			megaman.vx = 4;
			megaman.vy = -2;
			startFadeOut("#F8F8F8", 8);
		}
	},{	delay: 8,
		then: function() {
			camera.vx = 0;
			camera.vy = 0;
			megaman.vx = 0;
			megaman.vy = 0;
		}
	},{	delay: 60,
		then: function() {
			megaman.x = 751;
			megaman.y = 126;
			megaman.z = 50;
			megaman.vx = 0.5;
			megaman.vy = -0.25;
			camera.x += 14;
			camera.vx = 0.25;
			camera.vy = -0.125;
			setSprite(bass, "BassDeath", true);
			setSprite(megaman, "MegaManDashFall", true);
			startFadeIn(64);
		}
	},{	delay: 64,
		then: function() {
			camera.vx = 0;
			camera.vy = 0;
			megaman.vx = 0;
			megaman.vy = 0;
			setSprite(megaman, "MegaManLand", true);
		}
	},{	delay: 30,
		then: function() {
			startExploding(bass, 12);
		}
	}
];

var total = 0;
for (var i = 0; i < script.length; i++) {
	total += script[i].delay;
	setTimer(total, script[i].then);
}
