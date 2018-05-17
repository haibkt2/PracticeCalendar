$('.form').find('input, textarea').on('keyup blur focus', function (e) {
  
  var $this = $(this),
      label = $this.prev('label');

	  if (e.type === 'keyup') {
			if ($this.val() === '') {
          label.removeClass('active highlight');
        } else {
          label.addClass('active highlight');
        }
    } else if (e.type === 'blur') {
    	if( $this.val() === '' ) {
    		label.removeClass('active highlight'); 
			} else {
		    label.removeClass('highlight');   
			}   
    } else if (e.type === 'focus') {
      
      if( $this.val() === '' ) {
    		label.removeClass('highlight'); 
			} 
      else if( $this.val() !== '' ) {
		    label.addClass('highlight');
			}
    }

});

$('.tab a').on('click', function (e) {
  
  e.preventDefault();
  
  $(this).parent().addClass('active');
  $(this).parent().siblings().removeClass('active');
  
  target = $(this).attr('href');

  $('.tab-content > div').not(target).hide();
  
  $(target).fadeIn(600);
  
});

function startTime() {
	$.get("/getServerTime", function(data, status){
		document.getElementById("serverTime").value = data;
		getServerTime();
    });
}
var startDate = new Date();
function getServerTime() {
	var diff = new Date().getTime() - startDate.getTime();
	var serverTimezone = 7;
	var serverTime = document.getElementById("serverTime").value;
	var userTimezone = 7;
	var mytime;

	if (userTimezone == "null") {
		serverTimezone = userTimezone = 1;
		startDate = mytime = new Date();
	} else {
		mytime = new Date(parseInt(serverTime));
	}

	mytime.setMilliseconds(mytime.getMilliseconds()
			- ((serverTimezone - userTimezone) * 3600000));
	mytime.setMilliseconds(mytime.getMilliseconds() + diff);

	var month = [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
			"11", "12" ];
	var year = mytime.getFullYear();
	var day = addZero(mytime.getDate());
	var hours = addZero(mytime.getHours());
	var minutes = addZero(mytime.getMinutes());
	var seconds = addZero(mytime.getSeconds());

	var currentTime = " <span style='font-size: 25px;'> " + year + "/"
			+ month[mytime.getMonth()] + "/" + day + "</span> <span>  " + hours
			+ ":" + minutes + ":" + seconds + "</span></h4>";

	document.getElementById("header-time").innerHTML = currentTime;

	var t = setTimeout(getServerTime, 500);
}
function addZero(i) {
	if (i < 10) {
		i = "0" + i
	}
	;
	return i;
}
function getTokens() {
	var tokens = [];
	var query = location.search;
	query = query.slice(1);
	query = query.split('&');
	$.each(query, function(i, value) {
		var token = value.split('=');
		var key = decodeURIComponent(token[0]);
		var data = decodeURIComponent(token[1]);
		tokens[key] = data;
	});
	return tokens;
}

function startTime() {
	$.get("/getServerTime", function(data, status){
		document.getElementById("serverTime").value = data;
		getServerTime();
    });
}

var startDate = new Date();
function getServerTime() {
	var diff = new Date().getTime() - startDate.getTime();
	var serverTimezone = document.getElementById("serverTimezone").value;
	var serverTime = document.getElementById("serverTime").value;
	var userTimezone = document.getElementById("userTimezone").value;
	var mytime;

	if (userTimezone == "null") {
		serverTimezone = userTimezone = 1;
		startDate = mytime = new Date();
	} else {
		mytime = new Date(parseInt(serverTime));
	}

	mytime.setMilliseconds(mytime.getMilliseconds()
			- ((serverTimezone - userTimezone) * 3600000));
	mytime.setMilliseconds(mytime.getMilliseconds() + diff);

	var month = [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
			"11", "12" ];
	var year = mytime.getFullYear();
	var day = addZero(mytime.getDate());
	var hours = addZero(mytime.getHours());
	var minutes = addZero(mytime.getMinutes());
	var seconds = addZero(mytime.getSeconds());

	var currentTime = " <span style='font-size: 25px;'> " + year + "/"
			+ month[mytime.getMonth()] + "/" + day + "</span> <span>  " + hours
			+ ":" + minutes + ":" + seconds + "</span></h4>";

	document.getElementById("header-time").innerHTML = "sssssss";

	var t = setTimeout(getServerTime, 500);
}

function addZero(i) {
	if (i < 10) {
		i = "0" + i
	}
	;
	return i;
}

function currentYm() {
	var today = new Date();
	var month = [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
			"11", "12" ];
	var year = today.getFullYear();
	var currYm = year + "/" + month[today.getMonth()];
	document.getElementById('month-picker').value = currYm;
}

function currentYmd() {
	var today = new Date();
	var year = today.getFullYear();
	var month = [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10",
			"11", "12" ];
	var date = today.getDate();
	date = addZero(date);
	var currYmd = year + "/" + month[today.getMonth()] + "/" + date;
	document.getElementById('date-picker').value = currYmd;
}

function setGetParameter(url, paramName, paramValue) {
	//url = window.location.href;
	var hash = location.hash;
	url = url.replace(hash, '');
	if ((url.split("/"))[3] === '') {
		url = url + "login";
	}
	if (url.indexOf(paramName + "=") >= 0) {
		var prefix = url.substring(0, url.indexOf(paramName));
		var suffix = url.substring(url.indexOf(paramName));
		suffix = suffix.substring(suffix.indexOf("=") + 1);
		suffix = (suffix.indexOf("&") >= 0) ? suffix.substring(suffix
				.indexOf("&")) : "";
		url = prefix + paramName + "=" + paramValue + suffix;
	} else {
		if (url.indexOf("?") < 0)
			url += "?" + paramName + "=" + paramValue;
		else
			url += "&" + paramName + "=" + paramValue;
	}
	return url + hash;
}

function formatDateChange() {
	var getdate = document.getElementById('date-format').value;
    var d = new Date(getdate),
        month = d.getMonth() + 1,
        day = d.getDate(),
        year = d.getFullYear();
    var month = addZero(month);
    var day = addZero(day);

    document.getElementById('date-format').value = [year, month, day].join('/');
}

function formatDate() {
    document.getElementById('date-format').value = 'yyyy'+'/'+'mm'+'/'+'dd';
}