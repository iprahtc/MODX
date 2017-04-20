/**
@name jQuery pwdMeter 1.0.1
@author Shouvik Chatterjee (mailme@shouvik.net)
@date 31 Oct 2010
@modify 31 Dec 2010
@license Free for personal and commercial use as long as the author's name retains
*/

(function(jQuery){

jQuery.fn.pwdCompare = function(options){


        options = jQuery.extend({
			
			passwordId: "#password1",
			passwordBox: this
        
        }, options);
		
		
		return this.each(function(index){
		
			$(this).keyup(function(){
				
				cmpPassword();
			});
		
			function cmpPassword() {
				
				$('#pwdCompare').removeClass();
				$('#pwdCompare').addClass('neutral');
				
				if($(options.passwordBox).val() == $(options.passwordId).val()) {
					
					$('#pwdCompare').addClass('strong');
					$('#pwdCompare').text('Ок');
				}
				else {
					
					$('#pwdCompare').addClass('veryweak');
					$('#pwdCompare').text('Пароли не совпадают!');
				}
			}
		});
}

jQuery.fn.pwdMeter = function(options){


        options = jQuery.extend({
        
                minLength: 6,
                displayGeneratePassword: false,
                generatePassText: 'Password Generator',
                generatePassClass: 'GeneratePasswordLink',
                randomPassLength: 13,
        passwordBox: this
        
        }, options);


        return this.each(function(index){
        
                $(this).keyup(function(){
					
					evaluateMeter();
                });
                
                function evaluateMeter(){

                        var passwordStrength   = 0;
                        var password = $(options.passwordBox).val();

                        if ((password.length >0) && (password.length <=5)) passwordStrength=1;
                
                        if (password.length >= options.minLength) passwordStrength++;

                        if ((password.match(/[a-z]/)) && (password.match(/[A-Z]/)) ) passwordStrength++;

                        if (password.match(/\d+/)) passwordStrength++;

                        if (password.match(/.[!,@,#,$,%,^,&,*,?,_,~,-,(,)]/))        passwordStrength++;

                        if (password.length > 12) passwordStrength++;
						
						if (password.length < options.minLength) passwordStrength=0;
                
                        $('#pwdMeter').removeClass();
                        $('#pwdMeter').addClass('neutral');
                
                        switch(passwordStrength){
						case 0:
							$('#pwdMeter').addClass('veryweak');
							$('#pwdMeter').text('должен быть не меньше 6 символов!');
							break;
                        case 1:
                          $('#pwdMeter').addClass('veryweak');
                          $('#pwdMeter').text('Очень слабый');
                          break;
                        case 2:
                          $('#pwdMeter').addClass('weak');
                          $('#pwdMeter').text('Слыбый');
                          break;
                        case 3:
                          $('#pwdMeter').addClass('medium');
                          $('#pwdMeter').text('Средний');
                          break;
                        case 4:
                          $('#pwdMeter').addClass('strong');
                          $('#pwdMeter').text('Сильный');
                          break;
                        case 5:
                          $('#pwdMeter').addClass('verystrong');
                          $('#pwdMeter').text('Очень сильный');
                          break;                                                      
                        default:
                          $('#pwdMeter').addClass('neutral');
                          $('#pwdMeter').text('Very Weak');
                        }                
                
                }
                
        
                if(options.displayGeneratePassword){
                        $('#pwdMeter').after('&nbsp;<span id="Spn_PasswordGenerator" class="'+options.generatePassClass+'">'+ options.generatePassText +'</span>&nbsp;<span id="Spn_NewPassword" class="NewPassword"></span>');
                }
                
                $('#Spn_PasswordGenerator').click(function(){
                        var randomPassword = random_password();
                        $('#Spn_NewPassword').text(randomPassword);
                        $(options.passwordBox).val(randomPassword);
                        evaluateMeter();
                });
                
                
                function random_password() {
                        var allowed_chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz!?$?%^&*()_-+={[}]:;@~#|\<,>.?/";
                        var pwd_length = options.randomPassLength;
                        var rnd_pwd = '';
                        for (var i=0; i<pwd_length; i++) {
                                var rnd_num = Math.floor(Math.random() * allowed_chars.length);
                                rnd_pwd += allowed_chars.substring(rnd_num,rnd_num+1);
                        }
                        return rnd_pwd;
                }                
        
        });

}

})(jQuery)