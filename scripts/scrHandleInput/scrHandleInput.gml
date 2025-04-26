/**
 * Handle the camera transform on user input (mouse/keyboard)
 */
function scrHandleInput() {
    winMouseX = window_mouse_get_x();
    winMouseY = window_mouse_get_y();

    var deltaX = winMouseX - winOldMouseX;
    var deltaY = winMouseY - winOldMouseY;

    // Fix the mouse position when going out of the screen
    if (mouse_button != mb_none) {
        var fixMousePos = false;

        if (winMouseX < 1) {
            winMouseX = winW - 2;
            fixMousePos = true;
        } else if (winMouseY < 1) {
            winMouseY = winH - 2;
            fixMousePos = true;
        } else if (winMouseX > winW - 2) {
            winMouseX = 2;
            fixMousePos = true;
        } else if (winMouseY > winH - 1) {
            winMouseY = 2;
            fixMousePos = true;
        }

        if (fixMousePos) {
            window_mouse_set(winMouseX, winMouseY);
            winOldMouseX = winMouseX;
            winOldMouseY = winMouseY;
			winMouseDragX = winMouseX;
			winMouseDragY = winMouseY;
            return;
        }
    }

	// Get the directional vectors of the camera
    var dx = camViewMat[2];
    var dy = camViewMat[6];
    var dz = camViewMat[10];
	
	// Camera speed & boost
    var shiftSpd = keyboard_check(vk_shift) * cameraSpeed * 4;
    var cameraRealSpeed = cameraSpeed + shiftSpd;

    // Keyboard: move the camera position
    if (keyboard_check(ord("A"))) {
        x -= dsin(direction) * cameraRealSpeed;
        y -= dcos(direction) * cameraRealSpeed;
    } else if (keyboard_check(ord("D"))) {
        x += dsin(direction) * cameraRealSpeed;
        y += dcos(direction) * cameraRealSpeed;
    }

    if (keyboard_check(ord("S"))) {
        speed = -cameraRealSpeed;
    } else if (keyboard_check(ord("W"))) {
        speed = cameraRealSpeed;
    } else {
        speed = 0;
    }

	// Orbit around the target
	if (mouse_check_button_pressed(mb_left)) {
		winRadius = point_distance_3d(x, y, z, 0, 0, 0);
		winTargetX = x + dx * winRadius;
		winTargetY = y + dy * winRadius;
		winTargetZ = z + dz * winRadius;
		winMouseDragX = winMouseX;
		winMouseDragY = winMouseY;
	}
		
	if (mouse_check_button(mb_left)) {
	    window_set_cursor(cr_none);
	    cursorSprite = sprCursorOrbit;

	    x = winTargetX + dcos(direction+180) * dcos(-oCtrl.zdir) * winRadius;
	    y = winTargetY + dsin(direction+180) * -dcos(-oCtrl.zdir) * winRadius;
	    z = winTargetZ - dsin(-oCtrl.zdir) * winRadius;
		
		direction += deltaX;
		//zdir = clamp(zdir - deltaY *cameraRealSpeed * .3, -89, 89);
		
		//direction = lerp(direction, direction + deltaX, .1);
		//zdir = clamp(lerp(zdir, zdir - deltaY, .1), -89, 89);
	}


    // Rotazione della fotocamera mentre si sta fermi (con tasto destro)
    if (mouse_check_button(mb_right)) {
        window_set_cursor(cr_none);
        cursorSprite = sprCursorEye;
        direction -= (winMouseX - winOldMouseX) / 10;
        zdir = clamp(zdir + (winMouseY - winOldMouseY) / 10, -89, 89);
    }

    // Elevazione/discesa con E/Space o Q/Ctrl
    if (keyboard_check(ord("E")) || keyboard_check(vk_space)) {
        z += cameraRealSpeed * 2;
    }
    if (keyboard_check(ord("Q")) || keyboard_check(vk_control)) {
        z -= cameraRealSpeed * 2;
    }

    // Zoom con rotella del mouse o tasti PageUp/PageDown
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

    // Pan della fotocamera con tasto centrale
    if (mouse_check_button(mb_middle)) {
        window_set_cursor(cr_none);
        cursorSprite = sprCursorDrag;

        // Pan XY
	    if (deltaX > 0) {
	        shfDirX = -90;
	    } else if (deltaX < 0) {
	        shfDirX = 90;
	    } else {
	        shfDirX = 0;
	    }

	    var deltaXYPan = abs(deltaX) / 5;
	    if (shfDirX != 0) {
	        x += dcos(direction + shfDirX) * dcos(-zdir) * deltaXYPan;
	        y += dsin(direction + shfDirX) * -dcos(-zdir) * deltaXYPan;
	    }

        // Calcola il pan Z
	    if (deltaY > 0) {
	        shfDirY = -90;
	    } else if (deltaY < 0) {
	        shfDirY = 90;
	    } else {
	        shfDirY = 0;
	    }

	    var deltaZPan = abs(deltaY) / 5;
	    if (shfDirY != 0) {
	        z -= -dsin(zdir + shfDirY) * deltaZPan;
	    }

        // Salva la posizione del mouse
        winOldMouseX = winMouseX;
        winOldMouseY = winMouseY;
    }

    // Reset della posizione del cursore
    if (keyboard_check_released(ord("A")) ||
        keyboard_check_released(ord("D")) ||
        keyboard_check_released(ord("W")) ||
        keyboard_check_released(ord("S")) ||
        keyboard_check_released(ord("E")) ||
        keyboard_check_released(ord("Q")) ||
        keyboard_check_released(vk_space) ||
        keyboard_check_released(vk_control) ||
        mouse_check_button_released(mb_left) ||
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
