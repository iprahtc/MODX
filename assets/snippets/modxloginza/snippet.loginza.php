<?php
// изменить это обязательно!
// иначе ваш сайт поломают
$secret = 'secret_use';

include_once MODX_BASE_PATH.'assets/snippets/modxloginza/loginza.class.php';
include_once MODX_BASE_PATH.'assets/snippets/modxloginza/json.php';
include_once MODX_BASE_PATH.'assets/snippets/modxloginza/profiletpl.php'; //шаблон профиля

// конфигурация по-умолчанию
$providers = isset($providers) ? $providers : 'google,yandex,mailru,vkontakte,facebook,openid';
$login_id = isset($login_id) ? $login_id : 1;  // ресурс, на который будет переадресован пользователь после авторизации
$register_id = isset($register_id) ? $register_id : 1; // ресурс, на который будет переадресован пользователь после регистраици
$landing_url = isset($landing_url) ? $landing_url : '[(site_url)][~[*id*]~]';// ресурс, на котором установлен сниппет loginza
$groups = isset($groups) ? $groups : '';  //группа для пользователей
$debug = isset($debug) ? $debug : 0; //отладка, при включенной регистрация и авторизация не происходит. Выводится информация для отладки
$type = isset($type) ? $type : ''; //заготовка под кабинет

//проверка на копи-пастера :) это важно на самом деле!
if ($secret=='secret_user' ) die('Вы не прочли инструкцию по установке сниппета loginza!');

$loginza =  new MODxLoginza($providers,$landing_url,$secret,$debug,$login_id,$register_id);

if($_REQUEST['webloginmode']=='logout') {

   return $loginza->logOut();
}

//реакция на кнопки в профайле
$service = $_REQUEST['service'];
if (empty($service) || $service == '')
{
	$service = $_REQUEST['serviceButtonValue'];
}

$loginza->ActiveUsers();

if ($modx->getLoginUserID())
{
  //пользователь уже авторизован на сайте
  if($type == 'profile')
  {
    //if (in_array('profile', $disableServices)){return;}
    $displayProfileTpl = isset($profileTpl) ? $loginza->Template($profileTpl) : $DefaultProfileTpl; //шаблон профайла из файла или чанка
    $loginza->PlaceHolders($inputHandler, $messageTpl);
		switch ($service)
		{
                        //проверено
			case 'saveprofile' :
				$loginza->SaveUserProfile();
				$loginza->PlaceHolders($inputHandler, $messageTpl);
				return $displayProfileTpl;
				break;
                        //проверно
			case 'cancel':
				$url = $modx->makeURL($register_id);
                                $modx->sendRedirect($url,0,'REDIRECT_REFRESH');
				break;

                        //проверно
			case 'logout':
				$loginza->Logout();
				break;
                        //проверно
			case 'deleteprofile':                                
				echo $ProfileDeleteTpl;
				break;
                        //проверено
			case 'confirmdeleteprofile':
				echo $loginza->RemoveUserProfile();
				break;

			default :
				echo $displayProfileTpl;
				break;
		}
		return;
  }  
  return $loginza->GetInfo();  
} else {
  //пользователь не авторизован
  $loginza_token = $_POST['token'];
  if($loginza_token)
  {
     //токен есть
     return $loginza->Login($loginza_token,$groups);

  } else {
      return $loginza->ShowButton(); //токена нет, показываем кнопку входа
  }

}
