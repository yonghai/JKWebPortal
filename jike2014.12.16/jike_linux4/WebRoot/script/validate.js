$.extend($.fn.validatebox.defaults.rules, {    
    /*是否为qq格式*/
	qq: {    
        validator: function(value, param){    
            return value.length >= param[0] 
                   && value.length <= param[1]
                   &&  /^\d+$/.test(value);    
        },    
        message: 'Please enter at least {0} and at max {1} numbers.'   
    },
    /*是否为手机格式*/
    mobile: {
    	    validator: function(value, param){
    			return  /^[1][3,4,5,8][0-9]{9}$/.test(value);
            },
            message: 'Please enter a valid phone number.'
    },
    integer : {// 验证整数
        validator : function(value) {
            return /^[+]?[1-9]+\d*$/i.test(value);
        },
        message : '请输入整数'
    }, 
    /*性别验证*/
    sex: {
	    validator: function(value, param){
			return  value=='女' || value=='男';
        },
        message: 'Please enter man or woman.'
    },
    number: {
		validator: function(value, param){
			return /^\d+$/.test(value);
		},
		message: 'please enter a number'
    }
});  

