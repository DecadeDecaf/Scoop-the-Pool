function array_has(array, thing) {
	var has = false
	for (var i = 0; i < array_length(array); i++) {
		if (array[@ i] == thing) {
			has = true
			break
		}
	}
	return has
}

function array_remove(array, value) {
	var old = array
	var len = array_length(array)
	var a = 0
	for (var i = 0; i < len; i++) {
		if (old[@ i] != value) {
			array[@ a] = old[@ i]
			a++
		}
	}
	array_resize(array, a)
}

function array_remove_at(array, pos) {
	var old = array
	var len = array_length(array)
	var a = 0
	for (var i = 0; i < len; i++) {
		if (i != pos) {
			array[@ a] = old[@ i]
			a++
		}
	}
	array_resize(array, a)
}