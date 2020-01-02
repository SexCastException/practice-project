function formatDate(timestamp){
	if (timestamp){
		var datetime = new Date(timestamp);
		return datetime.getFullYear()+'/'+((datetime.getMonth()+1)<10?('0'+(datetime.getMonth()+1)):(datetime.getMonth()+1))+'/'+datetime.getDate()+
			' '+datetime.getHours()+':'+datetime.getMinutes()+':'+datetime.getSeconds()
	}
}