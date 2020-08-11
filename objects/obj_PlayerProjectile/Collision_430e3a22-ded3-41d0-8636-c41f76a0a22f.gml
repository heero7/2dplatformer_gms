/// @description Colliding with enemy objects.

with (other) {
	healthPoints -= other.attackPower;
	flash = 3; // Flash number of the enemy.
}

instance_destroy();
