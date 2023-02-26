function scrUiCreateCullbackMode() {
	uiYCurrent += 30;
	var w = guiLeftWidth - uiX*2;
	var h = 30;
	var btnW = 30;
	
	var selectArrows = new UiSelectArrows(uiX, uiYCurrent, w, h);
	
	with (selectArrows.state) {
		wrap_selection = true;
		
		on_change = function(elem, selected) {
			oCtrl.settings.camera.culling = selected.key;
			gpu_set_cullmode(selected.key);
		};
	}
	
	selectArrows.set_items([
		{ key: cull_counterclockwise, label: "Front culling" },
		{ key: cull_clockwise, label: "Back culling" },
		{ key: cull_noculling, label: "No culling"}
	]);
	
	var selectArrowsBtnPrev = new UiButton(0, 0, btnW, h, selectArrows);
	var selectArrowsBtnNext = new UiButton(w-btnW, 0, btnW, h, selectArrows);
	
	with (selectArrowsBtnPrev.state) {
		text = "<";
		if (!selectArrows.state.wrap_selection) {
			enabled = false;
		}
	
		on_click = method({ select: selectArrows, prevBtn: selectArrowsBtnPrev, nextBtn: selectArrowsBtnNext }, function() {
			var select = self.select;
			select.previous();
		});
	}
	
	with (selectArrowsBtnNext.state) {
		text = ">";
		on_click = method({ select: selectArrows, prevBtn: selectArrowsBtnPrev, nextBtn: selectArrowsBtnNext }, function() {
			var select = self.select;
			select.next();
		});
	}
	
	scrUiAddTooltip(selectArrows, "Select the backface culling mode");
}