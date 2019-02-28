
<html>
<head>
	
</head>
<body>
<style>
	.container {
		padding-right: 15px;
		padding-left: 15px;
		margin-right: auto;
		margin-left: auto;
		max-width: 600px;
	}
	.panel {
	    margin-bottom: 20px;
	    background-color: #fff;
	    border: 1px solid transparent;
	    border-radius: 4px;
	    -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.05);
	    box-shadow: 0 1px 1px rgba(0,0,0,.05);
	}
	.panel-success {
	    border-color: #d6e9c6;
	}
	.panel-success>.panel-heading {
    color: #3c763d;
    background-color: #dff0d8;
    border-color: #d6e9c6;
	}
	.panel-heading {
	    padding: 10px 15px;
	    border-bottom: 1px solid transparent;
	    border-top-left-radius: 3px;
	    border-top-right-radius: 3px;
	}
	.panel-body {
    padding: 15px;
	}
	.panel-footer {
    padding: 10px 15px;
    background-color: #f5f5f5;
    border-top: 1px solid #ddd;
    border-bottom-right-radius: 3px;
    border-bottom-left-radius: 3px;
	}
	.list-group {
    padding-left: 0;
    margin-bottom: 20px;
	}
	
	ol, ul {
	    margin-top: 0;
	    margin-bottom: 10px;
	}
	.list-group-item:first-child {
    border-top-left-radius: 4px;
    border-top-right-radius: 4px;
	}
	
	.list-group-item {
	    position: relative;
	    display: block;
	    padding: 10px 15px;
	    margin-bottom: -1px;
	    background-color: #fff;
	    border: 1px solid #ddd;
	}
</style>
<div class="container">
	<div class="panel panel-success">
	  <div class="panel-heading">${uiLabelMap.UserLoginChangePassword}</div>
		  <div class="panel-body">
		    ${uiLabelMap.SecurityExtThisEmailIsInResponseToYourRequestToHave}
		    <!-- List group -->
			</div>  
			<div class="panel-body">
			<ul class="list-group">
		    <li class="list-group-item">${uiLabelMap.SecurityExtYourUserloginId}&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<span>${userLoginId}</span></li>
		    <li class="list-group-item">${uiLabelMap.SecurityExtNewPasswordMssgEncryptionOn}&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;<span style="color: #3c753c;font-size: 24px;display: inline-block;">${autoPassword}</span></li>
		  </ul>
		  </div> 
		  <div class="panel-body" style="color: red;">
		    ${uiLabelMap.SendNewPasswordToEmail_3}
		    <!-- List group -->
			</div> 
			<div class="panel-footer">
      	<a style="font-size: 18px;" href="${baseEcommerceSecureUrl}/control/passwordChange?USERNAME=${userLogin.userLoginId!}&password=${password!}&forgotPwdFlag=true&tenantId=${tenantId!}" target="_blank">${uiLabelMap.ResetPassword}</a>
			</div> 
	 </div>
  
</div>
</body>
</html>
