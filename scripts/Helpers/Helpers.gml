function bubbleSort(_list){
	function bubbleSort(_list){
	var _listSize = ds_list_size(_list);
	for (var i = 0; i < _listSize - 1; i++){
		for (var j = 0; j < _listSize - i - 1; j++){
			if (_list[|j].currentSpeed < _list[|j + 1].currentSpeed){ // > Fastest last, < Slowest last
				//swap the two
				var _temp = _list[| j];
				_list[|j] = _list[|j + 1];
				_list[|j + 1] = _temp;
			}
		}
	}
	show_debug_message("Sort Completed");
}
}