/**
 * Handle the camera transform on user input (mouse/keyword)
 */
 c = 0
 
function scrHandleInput() {
	winMouseX = window_mouse_get_x();
	winMouseY = window_mouse_get_y();	
	
	// Move the mouse on the other edge of the screen, when transforming the camera with the mouse
	if (mouse_button != mb_none && mouse_button != mb_left) {
		var fixMousePos = false;
	
		if (winMouseX < 1) {
			winMouseX = winW-2;
			fixMousePos = true;
		} else if (winMouseY < 1) {
			winMouseY = winH-2;
			fixMousePos = true;
		} else if (winMouseX > winW-2) {
			winMouseX = 2;
			fixMousePos = true;
		} else if (winMouseY > winH-1) {
			winMouseY = 2;
			fixMousePos = true;
		}
	
		if (fixMousePos) {
			window_mouse_set(winMouseX, winMouseY);
			winOldMouseX = winMouseX;
			winOldMouseY = winMouseY;
			return;
		}
	}

	// Handle the mouse input
	var dx = camViewMat[2];
	var dy = camViewMat[6];
	var dz = camViewMat[10];	
	var cameraSpeed = settings.camera.speed;
	var shiftSpd = keyboard_check(vk_shift) * cameraSpeed * 4;
	var cameraRealSpeed = cameraSpeed + shiftSpd;
	var mouseSensX = 1;
	var mouseSensY = 1;
	
	// Lateral movement
	if (keyboard_check(ord("A"))) {
		  x = x - dsin(direction) * cameraRealSpeed;
		  y = y - dcos(direction) * cameraRealSpeed;
	} else if (keyboard_check(ord("D"))) {
		  x = x  + dsin(direction) * cameraRealSpeed;
		  y = y  + dcos(direction) * cameraRealSpeed;
	}
	
	// Forward/backward movement
	if (keyboard_check(ord("S"))) {
		speed = -cameraRealSpeed;
	} else if (keyboard_check(ord("W"))) {
		speed = cameraRealSpeed;
	} else {
		speed = 0; 
	}
	
	if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(ord("S"))) {
		zPitchDist = point_distance(0, 0, x, y);
		zPitchFrom = z;		
		zPitchZdir = zdir;
	}
	
	// Rotate camera 
	if (mouse_check_button(mb_right)) {
		window_set_cursor(cr_none);
		cursorSprite = sprCursorEye;
		direction -= (winMouseX - winOldMouseX) / (10 / mouseSensX);
		zdir = clamp(zdir + (winMouseY - winOldMouseY) / (10 / mouseSensY), -89, 89);
	}
	
	// Elevate/descend
	if (keyboard_check(ord("E")) || keyboard_check(vk_space)) {
		z += cameraRealSpeed * 2;
	}
	if (keyboard_check(ord("Q")) || keyboard_check(vk_control)) {
		z -= cameraRealSpeed * 2;
	}
	
	// Move the camera towards the direction its facing
	if (mouse_wheel_up() || keyboard_check(vk_pageup)) {
		x += dx * cameraRealSpeed * 5;
		y += dy * cameraRealSpeed * 5;
		z += dz * cameraRealSpeed * 5;
	}
	
	if (mouse_wheel_down() || keyboard_check(vk_pagedown)) {
		x -= dx * cameraRealSpeed * 5;
		y -= dy * cameraRealSpeed * 5;
		z -= dz * cameraRealSpeed * 5;
	}
	
	// Camera Pan
	if (mouse_check_button(mb_middle)) {
		window_set_cursor(cr_none);
		cursorSprite = sprCursorDrag;
		
		// XY Pan
		if (winMouseX > winOldMouseX) {
			shfDir = -90;
		} else if (winMouseX < winOldMouseX) {
			shfDir = 90;
		} else { 
			shfDir = 0;
		}
		var delta = abs(winMouseX - winOldMouseX)/5;
		if (shfDir != 0) {
			x += dcos(direction+shfDir) * dcos(-zdir) * delta;
			y += dsin(direction+shfDir) * -dcos(-zdir) * delta;
		}
		
		// Z Pan
		if (winMouseY > winOldMouseY) {
			shfDir = -90;
		} else if (winMouseY < winOldMouseY) {
			shfDir = 90;
		} else { 
			shfDir = 0;
		}
		var delta = abs(winMouseY - winOldMouseY) / (5 / mouseSensY);
		if (shfDir != 0) {
			z -= -dsin(zdir + shfDir) * delta;
		}
	}
	
	// Reset the cursor when the scene has finished changing
	if (keyboard_check_released(ord("A")) || 
	  keyboard_check_released(ord("D")) || 
 	  keyboard_check_released(ord("W")) || 
	  keyboard_check_released(ord("S")) || 
	  keyboard_check_released(ord("E")) || 
	  keyboard_check_released(ord("Q")) || 
	  keyboard_check_released(vk_space)  ||
	  keyboard_check_released(vk_control)  ||
	  mouse_check_button_released(mb_right) ||
	  mouse_check_button_released(mb_middle) ||
	  mouse_wheel_up() || 
	  mouse_wheel_down() ||
	  keyboard_check(vk_pageup) ||
	  keyboard_check(vk_pagedown)) {
	 	window_set_cursor(cr_default);
		cursorSprite = undefined;
	}
}