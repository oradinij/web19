$(function () {


	$('#datePickerVisita').datetimepicker({
		useCurrent: false,
		format: 'YYYY-MM-DD',
		locale: 'it',
		daysOfWeekDisabled: [0, 6],
		ignoreReadonly: true,
		inline: true,
		sideBySide: true
	});
});
