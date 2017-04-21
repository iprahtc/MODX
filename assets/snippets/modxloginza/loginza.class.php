<?
/* v0.5
*Использованы части кода WebloginPE
*Raymond Irving, Scotty Delicious
*
*части сниппета Кузьмина Антона
*http://community.modx-cms.ru/blog/addons/1233.html
*
*доработал Генин Михаил
*http://community.modx-cms.ru/profile/marconi/
*
* проверено на facebook, google, яндекс, вконтакте
*/
class MODxLoginza
{
    public $Username;
    public $User;
    public $Debug;
    public $login_id;
    public $register_id;
    public $button;
    private $mysecret;
    private $UserImageSettings;
    
    function __construct($providers,$landing_url,$secret,$debug,$login_id,$register_id)
    {
        include_once MODX_BASE_PATH.'assets/snippets/modxloginza/lang.const.php';
        $this->button = '<script src="http://loginza.ru/js/widget.js" type="text/javascript"></script><h6><a href="https://loginza.ru/api/widget?providers_set='.$providers.'&token_url='.$landing_url.'" class="loginza">'.DEFAULT_ENTER.'</a></h6>';
        $this->mysecret=$secret;
        $this->Debug=$debug;
        $this->login_id=$login_id;
        $this->register_id=$register_id;
        $this->UserImageSettings= '105000,100,100'; //магические цифры - дурной тон :)
    }

    function Login($loginza_token,$groups)
    {
		global $modx;

        $json = new Services_JSON();    // получаем и декодируем данные от Логинзы
        $loginza_data = file_get_contents('http://loginza.ru/api/authinfo?token='.$loginza_token);
        $ldata = $json->decode($loginza_data);
        if(isset($ldata->error_type)) return ENTER_ERROR.$ldata->error_message.RETRY_ENTER;

        // определяем имя провайдера, логин и никнейм пользователя
        $ltype = parse_url($ldata->provider);
        $ltype = $ltype['host'];
        if(!isset($ldata->uid)) {
            $luid = parse_url($ldata->identity);
            $luid = explode('.',$luid['host']);
            $luid = $luid[0];

        } else $luid =  $ldata->uid;

        if(empty($ldata->nickname)) $lnick = $luid; else $lnick = $ldata->nickname;
        // здесь нужно помещать обработку для отдельных провайдеров:
        // [lambrusco] 29.05.2013
        if (strpos($ltype, 'openid.yandex.ru') !== false) {
                        $ltype = 'yandex.ru';
                        $identityArr = explode('/', $ldata->identity);
                        $lnick =  $identityArr[count($identityArr)-2];
                }       

        $this->User = array();
        $this->User['username'] = $lnick.'@'.$ltype;
        $this->User['password'] = substr(md5($this->User['username'].$this->mysecret), 0, 12);

        //отдача email разными сервисами
        // vkontakte -
        // facebook +
        // yandex -/+ (если пользователь разрешил, по умолчанию нету)
        // google +
        // .....
        //____!!! В Н И М А Н И Е !!!____
        //на данный момент если сервис не отдал емайл
        //то устанавливается "левый-подставной"
        //_НЕ ОТСЫЛАЙТЕ НА НЕГО ПОЧТУ!_
        if(isset($ldata->email)) $this->User['email'] = $ldata->email;
          else {                        // [lambrusco] 29.05.2013
                        // обтабатываем различные исключительные ситуации
                        // вконтакте не возвращает адрес электронной почты, и т.д.
                        $preg_template_vk = '/([0-9]*@vk.com)/';
                        if (preg_match($preg_template_vk, $this->User['username'])) {
                                // опа, нет мыла, тогда запихаем пользователя в группу email_request
                                if (trim($groups) !== '') 
                                {
                                        $groups .= ",email_request";
                                } 
                                else 
                                {
                                        $groups = "email_request";                              
                                }
                                // адрес уникальный, значит, нам подходит
                                $this->User['email'] = $this->User['username'];
                        } 
                        elseif ($ltype == 'yandex.ru')
                        {
                                // ранее мы получили корректный email для yandex
                                $this->User['email'] = $this->User['username'];                         
                        }       
                        else
                        {
                                // обрабатываем подобные варианты развития событий для других провайдеров
                                // z-z-z...
                                // а пока что
                                $this->User['email'] = $this->User['username'];
                        }
                }


        if(isset($ldata->name->full_name))
            $this->User['fullname'] = $ldata->name->full_name;
        elseif( isset($ldata->name->last_name) && isset($ldata->name->first_name) )
            $this->User['fullname'] = $ldata->name->last_name.' '.$ldata->name->first_name;

        // расширенные атрибуты пользователя
        $uattr = array();
        if($ldata->gender=="M") { $uattr['gender'] = "1"; } else if ($ldata->gender=="F") { $uattr['gender'] = "2"; } else { $uattr['gender'] = ""; }
        if($ldata->dob)         { $uattr['dob'] = date(strtotime($ldata->dob)); }
        if($ldata->nickname)    { $uattr['comment'] = $modx->db->escape( $ldata->nickname ); }
        if($ldata->photo)       { $uattr['photo'] = $modx->db->escape( $ldata->photo ); }

        if($this->Debug == 1)
        {
          echo '<pre>'; print_r($ldata); print_r($udata); print_r($uattr); echo '</pre>';
          return;
        }
        // создаем пользователя, если такого еще не существует
        if(!$modx->db->getValue( $modx->db->select('count(*)',$modx->getFullTableName("web_users"),'username="'.$modx->db->escape($this->User['username']).'"')))
        {
          //проверим, вдруг есть такая почта
          if($modx->db->getValue( $modx->db->select('count(*)',$modx->getFullTableName("web_user_attributes"),'email="'.$modx->db->escape($this->User['email']).'"')))
          {
            echo ERROR_ALREADY_EXIST;
            return;
          }
          //создание
          $web_users = $modx->getFullTableName('web_users');
     	  $web_user_attributes = $modx->getFullTableName('web_user_attributes');

          $this->OnBeforeWebSaveUser($this->User['username'], array());
          $newUser = "INSERT INTO ".$web_users." (`username`, `password`, `cachepwd`) VALUES ('".$this->User['username']."', '".$this->User['password']."', '')";
   		  $createNewUser = $modx->db->query($newUser);

          if (!$createNewUser) //если запрос не прошел
          {
            echo ERROR_FATAL;
            return;
          }
          $key = $modx->db->getInsertId();
          $NewUser['internalKey'] = $key;
          $this->User['internalKey'] = $key;
          $newUserAttr = "INSERT INTO ".$web_user_attributes.
		    " (internalKey, fullname, email, phone, mobilephone, dob, gender, country, state, zip, fax, photo, comment) VALUES".
		    " ('".$key."', '".$this->User['fullname']."', '".$this->User['email']."', '".$phone."', '".$mobilephone."', '".$uattr['dob']."', '".$uattr['gender']."', '".$country."', '".$state."', '".$zip."', '".$fax."', '".$uattr['photo']."', '".$comment."')";
		  $insertUserAttr = $modx->db->query($newUserAttr);

          if (!$insertUserAttr) //  если запрос не выполнен
		  {

            echo ERROR_FATAL;
            return;
          }

          $moveto = $this->register_id;

          $groups = str_replace(', ', ',', $groups);
		  $GLOBALS['groupsArray'] = explode(',', $groups);

          $this->OnBeforeAddToGroup($GLOBALS['groupsArray']);
          if (count($GLOBALS['groupsArray']) > 0)
		  {

            $web_groups = $modx->getFullTableName('web_groups');
            $webgroup_names = $modx->getFullTableName('webgroup_names');

            $groupsList = "'".implode("','", $GLOBALS['groupsArray'])."'";
			$groupNames = $modx->db->query("SELECT `id` FROM ".$webgroup_names." WHERE `name` IN (".$groupsList.")");
			if (!$groupNames)
			{
                //может быть имеет смысл тогда создать группу
                //ну вдруг просто опечатка..насоздает мильон
                echo ERROR_GROUP;
                return;
			}
			else
			{
				while ($row = $modx->db->getRow($groupNames))
				{
					$webGroupId = $row['id'];
					$modx->db->query("INSERT INTO ".$web_groups." (`webgroup`, `webuser`) VALUES ('".$webGroupId."', '".$key."')");
				}
			}
		  }

     		$this->OnWebSaveUser('new', $this->User['username']);
            //фух готово :)
        } else $moveto=$this->login_id;

        //начинаем логин

        $this->User = $this->QueryDbForUser($this->User['username']);
		$_SESSION['groups'] = array('Registered Users', 'Fans'); //Fans?????!!!! шо за нафиг :)
		$this->OnBeforeWebLogin();

		$this->UserIsBlocked();
		$this->Authenticate();
		$this->SessionHandler('start');
		$this->OnWebLogin();
		$this->ActiveUsers();
		$this->UserDocumentGroups();

        //записываем в историю
        $dbname = $modx->db->config['dbase'];
        if ($modx->db->getRecordCount($modx->db->query("show tables from $dbname like 'modx_log_history'"))==0)
        {
            $sql = "CREATE TABLE modx_log_history (id INT(11) NOT NULL AUTO_INCREMENT,user_name VARCHAR(100) NOT NULL, ip VARCHAR(100), stamp INT(11), PRIMARY KEY (id))";
            $modx->db->query($sql);
        }
        $sql = "INSERT INTO modx_log_history VALUES (NULL,'{$this->Username}','".$_SERVER["REMOTE_ADDR"]."',".time().")";
        $modx->db->query($sql);

        $url = $modx->makeURL($moveto);
        header("location: $url");
        return;
	}

    function UserDocumentGroups()
	{
		global $modx;

		$web_groups = $modx->getFullTableName('web_groups');
		$webgroup_access = $modx->getFullTableName('webgroup_access');

		$documentGroups = '';
		$i = 0;
	    $sql = "SELECT {$webgroup_access}.documentgroup FROM ".$web_groups."  INNER JOIN ".$webgroup_access."  ON {$webgroup_access}.webgroup={$web_groups}.webgroup WHERE {$web_groups}.webuser =".$this->User['internalKey'];

	    $currentUsersGroups = $modx->db->query($sql);
	    while ($row = $modx->db->getRow($currentUsersGroups,'num')) $documentGroups[$i++] = $row[0];
	    $_SESSION['webDocgroups'] = $documentGroups;
	}

    function logOut()
	{
		$this->OnBeforeWebLogout;
		$this->StatusToOffline();
		$this->SessionHandler('destroy');
		$this->OnWebLogout;
                echo $this->button;
                return;
	}

    function Authenticate()
	{
		global $modx;

		$web_users = $modx->getFullTableName('web_users');
		$web_user_attributes = $modx->getFullTableName('web_user_attributes');

		$CurrentSessionID = session_id();

	    if(!isset($_SESSION['webValidated']))
		{
	        $isNowWebValidated = $modx->db->query("UPDATE ".$web_user_attributes." SET `failedlogincount` = 0, `logincount` = `logincount` + 1, `lastlogin` = `thislogin`, `thislogin` = ".time().", `sessionid` = '".$CurrentSessionID."' where internalKey='".$this->User['internalKey']."'");
	    }
		// Flag the account as "Activated" by deleting the timestamp in `cachepwd`
		$cacheTimestamp = $modx->db->query("UPDATE ".$web_users." SET `cachepwd`='' WHERE `id`='".$this->User['internalKey']."'");
 	}

    function UserIsBlocked()
	{
		global $modx;

		if (!empty($this->Report))
		{
			return; //не было ошибки на предыдущем этапе
		}

		$web_users = $modx->getFullTableName('web_users'); // таблица пользователей
		$web_user_attributes = $modx->getFullTableName('web_user_attributes'); // таблица аттрибутов пользователей

		if ($this->User['failedlogincount'] >= $modx->config['failed_login_attempts'] && $this->User['blockeduntil'] > time())   // если количество неудавшихся попыток входа больше, чем установлено в modx и время его блокировки еще не закончено, то пользователь заблокирован
		{
                echo ERROR_LOGIN;
                return;
	    }

		if ($this->User['failedlogincount'] >= $modx->config['failed_login_attempts'] && $this->User['blockeduntil'] < time())// тоже, что и сверху, только время блокировки закончилось, поэтому обвовляем таблицу
		{
	        $sql = "UPDATE ".$web_user_attributes." SET failedlogincount='0', blockeduntil='".(time()-1)."' where internalKey=".$this->User['internalKey'];
	        $updateFailedLoginCount = $modx->db->query($sql);
			return;
	    }
		if ($this->User['blocked'] == "1")
		{ //Если админ сам заблокировал пользователя
                echo ERROR_BAN;
                return;
	    }

		if ($this->User['blockeduntil'] >= time())
		{ // заблокирован до
			$blockedUntilTime = $this->User['blockeduntil'] - time();
			$UserIsBlockedUntil = $blockedUntilTime / 60;
			$blockedMinutes = substr($UserIsBlockedUntil, 0, strpos($UserIsBlockedUntil, "."));

			$this->SessionHandler('destroy');
                        
			$anError = str_replace('[+000+]', $blockedMinutes, ERROR_TEMP_CLOSE);
			echo $anError;
                        return;
		}

		if($this->User['blockedafter'] > 0 && $this->User['blockedafter'] < time())
		{ // также если он будет заблокирован
	        $this->SessionHandler('destroy');
                echo ERROR_BAN;
                return;	        
	    }

		if (isset($modx->config['allowed_ip'])) // блокировка по ip , то есть если адрес занесен в списов блокированных
		{
	        if (strpos($modx->config['allowed_ip'],$_SERVER['REMOTE_ADDR'])===false)
		{
                    echo ERROR_IP;
	            return;
	        }
	    }

		if (isset($modx->config['allowed_days']))
		{ // если в modx запрещена регистрация в какое-то время
	        $date = getdate();
	        $day = $date['wday']+1;
	        if (strpos($modx->config['allowed_days'], $day) === false)
		{
	            echo ERROR_NO_REG;
                    return;
	        }
	    }

	}

   function SessionHandler($directive)
	{
		global $modx;
		
		if ($directive == 'start')
		{
		    $_SESSION['webShortname'] = $this->Username;
		    $_SESSION['webFullname'] = $this->User['fullname'];
		    $_SESSION['webEmail'] = $this->User['email'];
		    $_SESSION['webValidated'] = 1;
		    $_SESSION['webInternalKey'] = $this->User['internalKey'];
		    $_SESSION['webValid'] = base64_encode($this->Password);
		    $_SESSION['webUser'] = base64_encode($this->Username);
		    $_SESSION['webFailedlogins'] = $this->User['failedlogincount'];
		    $_SESSION['webLastlogin'] = $this->User['lastlogin'];
		    $_SESSION['webnrlogins'] = $this->User['logincount'];
		    $_SESSION['webUserGroupNames'] = ''; // обнуляем имена групп


				$cookieName = 'MODxLoginza';
				$cookieValue = md5($this->User['username']).'|'.$this->User['password'];
				$cookieExpires = time() + (60 * 60); //запоминаем на 1 час

				setcookie($cookieName, $cookieValue, $cookieExpires, '/', $_SERVER['SERVER_NAME'], 0);

		}

		if ($directive == 'destroy')
		{
			// не гасить сессию менеджера!!!
            if (isset($_SESSION['mgrValidated']))
			{

	            unset($_SESSION['webShortname']);
	            unset($_SESSION['webFullname']);
	            unset($_SESSION['webEmail']);
	            unset($_SESSION['webValidated']);
	            unset($_SESSION['webInternalKey']);
	            unset($_SESSION['webValid']);
	            unset($_SESSION['webUser']);
	            unset($_SESSION['webFailedlogins']);
	            unset($_SESSION['webLastlogin']);
	            unset($_SESSION['webnrlogins']);
	            unset($_SESSION['webUsrConfigSet']);
	            unset($_SESSION['webUserGroupNames']);
	            unset($_SESSION['webDocgroups']);

                $cookieName = 'MODxLoginza';
				setcookie($cookieName, '', time()-60, '/', $_SERVER['SERVER_NAME'], 0);
            } else {

	         	$cookieName = 'MODxLoginza';
				setcookie($cookieName, '', time()-60, '/', $_SERVER['SERVER_NAME'], 0); // обнуляем куки
                session_destroy();
            }

		}
	}
    function GetInfo()
    {
        global $modx;

        $user_fullname = $modx->db->getValue( $modx->db->select('fullname',$modx->getFullTableName("web_user_attributes"),'internalKey="'.$modx->getLoginUserID().'"'));
        $username = $modx->db->getValue($modx->db->select('username',$modx->getFullTableName("web_users"),"id='".$modx->getLoginUserID()."'"));
        $username_r = explode('@',$username);
        print_r($modx->getLoginUserName());
        if(strlen($username_r[1])>2) $user_type = $username_r[1];
        echo HELLO_TEXT.' <img src="http://'.$user_type.'/favicon.ico" alt="'.$user_type.'"/> <b>'.$user_fullname.'</b>! <a href="[~[*id*]~]?webloginmode=logout">'.LOGOUT_TEXT.'</a>';
        return; 
    }
    function ActiveUsers()
	{
		global $modx;

		if (!$modx->getLoginUserID() || !empty($this->Report))
		{
			return;
		}
		$CurrentUser = $modx->getWebUserInfo($modx->getLoginUserID()); // информация о текущем юзере

		if ($_SERVER['HTTP_X_FORWARD_FOR'])
		{
			$ip = $_SERVER['HTTP_X_FORWARD_FOR'];
		}
		else
		{
			$ip = $_SERVER['REMOTE_ADDR'];
		}

		$active_users = $modx->getFullTableName('active_users');
		$activityCheck = "SELECT * FROM ".$active_users." WHERE `internalKey` = '-".$CurrentUser['internalKey']."'";
		$IamActive = $modx->db->query($activityCheck);
		$limit = $modx->db->getRecordCount($IamActive);
		if ($limit == 0)
		{ // если не помещен в активные пользователи
			$makeMeActive = $modx->db->query("INSERT INTO ".$active_users." (`internalKey`,`username`,`lasthit`,`id`,`action`,`ip`) VALUES ('-".$CurrentUser['internalKey']."','".$CurrentUser['username']."','".time()."','0','998','".$ip."')");
		}
		else
		{ //если есть, то обновяем
			$updateActivity = $modx->db->query("UPDATE ".$active_users." SET `lasthit` = '".time()."', `ip` = '".$ip."' WHERE `internalKey` = '-".$CurrentUser['internalKey']."'");
		}

	}

	function StatusToOffline()
	{
		global $modx;
		$CurrentUser =  $modx->getWebUserInfo($modx->getLoginUserID());
		$active_users = $modx->getFullTableName('active_users');
		$IamOffline =   $modx->db->query("UPDATE ".$active_users." SET `lasthit` = '0' WHERE `internalKey` = '-".$CurrentUser['internalKey']."'");
	}

    function QueryDbForUser($Username)
	{
		global $modx;

		$web_users = $modx->getFullTableName('web_users');
		$web_user_attributes = $modx->getFullTableName('web_user_attributes');

		$query = "SELECT * FROM ".$web_users.", ".$web_user_attributes." WHERE BINARY LOWER(".$web_users.".username) = '".strtolower($Username)."' AND ".$web_user_attributes.".`internalKey` = ".$web_users.".`id`";
		$query2 = "SELECT * FROM ".$web_users.", ".$web_user_attributes." WHERE(".$web_users.".username) = '".$Username."' AND ".$web_user_attributes.".`internalKey` = ".$web_users.".`id`";
		if (!$limit = $modx->db->getRecordCount($dataSource = $modx->db->query($query))) $limit = $modx->db->getRecordCount($dataSource = $modx->db->query($query2));

        // WTF ????!!!!!
        if ($limit == 0)
		{
            // WTF ????!!!!!
            $query = "SELECT * FROM ".$web_users.", ".$web_user_attributes." WHERE BINARY LOWER(".$web_users.".username) = '".strtolower($Username)."' AND ".$web_user_attributes.".`internalKey` = ".$web_users.".`id`";
			$query2 = "SELECT * FROM ".$web_users.", ".$web_user_attributes." WHERE(".$web_users.".username) = '".$Username."' AND ".$web_user_attributes.".`internalKey` = ".$web_users.".`id`";
			if (!$limit = $modx->db->getRecordCount($dataSource = $modx->db->query($query))) $limit = $modx->db->getRecordCount($dataSource = $modx->db->query($query2));
		}

		if ($limit == 0 || $limit > 1)
		{
			$this->User = false;
			return false;
		}
		else
		{
			return $modx->db->getRow($dataSource);
		}
	}

    function ShowButton()
    {        
        echo $this->button;
        return;
    }

    function Template($chunk)
	{
		global $modx;

		$template = '';
		if ($modx->getChunk($chunk) != '')
		{
			$template = $modx->getChunk($chunk);
		}
		else if (is_file($chunk))
		{
			$template = file_get_contents($chunk);
		}
		else
		{
			$template = $chunk;
		}
		return $template;
	}

    function PlaceHolders($inputHandler, $MessageTemplate = '[+wlpe.message.text+]')
	{
		global $modx;

		$this->MessageTemplate = $MessageTemplate;
		$CurrentUser = $modx->getWebUserInfo($modx->getLoginUserID());
		$modx->setPlaceholder('user.username', $CurrentUser['username']);

		$web_users = $modx->getFullTableName('web_users');
		$web_user_attributes = $modx->getFullTableName('web_user_attributes');

		$extraFields = $modx->db->query("SELECT * FROM ".$web_user_attributes." WHERE ".$web_user_attributes.".`internalKey` = '".$modx->getLoginUserID()."'");
		$limit = $modx->db->getRecordCount($extraFields);

		if ($limit == 0)
		{
			$extraFields = $modx->db->query("SELECT * FROM ".$web_user_attributes." WHERE ".$web_user_attributes.".`internalKey` = '".$modx->getLoginUserID()."'");
		}

		if ($modx->getLoginUserID() && $extraFields)
		{
			$CurrentUser = $modx->db->getRow($extraFields);
			if (!empty($CurrentUser))
			{
				foreach ($CurrentUser as $key => $value)
				{
					// $value = html_entity_decode($value);
					if ($key == 'id')
					{
						// Do Nothing, we don't need that shit in the placeholders.
					}
					else if ($key == 'dob')
					{
						// CREDIT : Guillaume for not format an empty date
						$value==0?'':$modx->setPlaceholder('user.'.$key, strftime('%m-%d-%Y', $value));
						$modx->setPlaceholder('user.age', strftime('%Y', time() - $value));

					}
					else if ($key == 'thislogin' || $key == 'lastlogin')
					{
						if ($value == 0)
						{
							$modx->setPlaceholder('user.'.$key, $this->LanguageArray[33]);
						}
						else
						{
							$modx->setPlaceholder('user.'.$key, strftime($this->DateFormat, $value));
						}
					}
					else if ($key == 'country')
					{
						$modx->setPlaceholder('user.country.integer', stripslashes($value));
						//$modx->setPlaceholder('user.country', $this->StringForCountryInt($value));
					}
					else if ($key == 'gender')
					{
						$modx->setPlaceholder('user.gender.integer', stripslashes($value));
						$modx->setPlaceholder('user.gender', $this->StringForGenderInt($value));
					}
					else
					{
						$modx->setPlaceholder('user.'.$key, stripslashes($value));
					}

					$needToSplit = strpos($value, '||');
					if ($needToSplit > 0)
					{
						$CurrentUser[$key] = explode('||', $value);
					}
				}
			}
		}
		$modx->setPlaceholder('user.defaultphoto', 'assets/snippets/modxloginza/userimages/default_user.jpg');
		$modx->setPlaceholder('request.userid', $_REQUEST['userid']);
		$modx->setPlaceholder('request.activationkey', $_REQUEST['activationkey']);
		$modx->setPlaceholder('form.captcha', 'manager/includes/veriword.php');

		// Handle Special input placeholders.
		//$inputHandler[9998] = str_replace('[+COUNTRYLABEL+]', $this->LanguageArray[39], $countryCodes);
		$inputHandler[9999] = str_replace('[+GENDERLABEL+]', $this->LanguageArray[40], $genderCodes);

		foreach ($inputHandler as $value)
		{
			$dataType = explode(':', $value);
			$label = $dataType[0];
			$DOMid = $dataType[1];
			$name = $dataType[2];
			$type = $dataType[3];
			$values = $dataType[4];

			if ($type == 'select multiple' || $type == 'select')
			{
				$ph = '';
				$ph .= '<label for="'.$DOMid.'" id="'.$DOMid.'Label">'.$label."\n";
				if ($type == 'select multiple')
				{
					$ph .= '<'.$type.' id="'.$DOMid.'" name="'.$name.'[]">'."\n";
				}
				else
				{
					$ph .= '<'.$type.' id="'.$DOMid.'" name="'.$name.'">'."\n";
				}
				$options = explode(',', $values);
				foreach ($options as $eachOption)
				{
					$option = explode('(', $eachOption);
					$option = str_replace(')', '', $option);
					if (isset($CurrentUser[$name]))
					{
						if (is_array($CurrentUser[$name]))
						{
							if (in_array($option[1], $CurrentUser[$name]))
							{
								$ph .= "\t".'<option selected="selected" value ="'.$option[1].'">'.$option[0].'</option>'."\n";

							}
							else
							{
								$ph .= "\t".'<option value ="'.$option[1].'">'.$option[0].'</option>'."\n";
							}
						}
						else
						{
							if ($option[1] == $_POST[$name])
							{
								$ph .= "\t".'<option selected="selected" value ="'.$option[1].'">'.$option[0].'</option>'."\n";
							}

							else if ($option[1] == $CurrentUser[$name])
							{
								$ph .= "\t".'<option selected="selected" value ="'.$option[1].'">'.$option[0].'</option>'."\n";
							}

							else
							{
								$ph .= "\t".'<option value ="'.$option[1].'">'.$option[0].'</option>'."\n";
							}
						}
					}
					else
					{
						$ph .= "\t".'<option value ="'.$option[1].'">'.$option[0].'</option>'."\n";
					}
				}
				$ph .= '</select>'."\n";
				$ph .= '</label>'."\n";
				// Set the Placeholder
				$modx->setPlaceholder('form.'.$name, $ph);
			}

			if ($type == 'radio')
			{
				$ph = '';
				$ph .= '<label for="'.$DOMid.'" id="'.$DOMid.'Label">'.$label."\n";
				$ph .= '<div id="'.$DOMid.'Div">'."\n";
				$options = explode(',', $values);
				foreach ($options as $eachOption)
				{
					$option = explode('(', $eachOption);
					$option = str_replace(')', '', $option);
					if (isset($CurrentUser[$name]))
					{
						if ($option[1] == $CurrentUser[$name])
						{
							$ph .= '</span><input type="radio" id="'.$DOMid.$option[0].'" name="'.$name.'" value="'.$option[1].'" checked="checked" /><span class="'.$DOMid.'Span">'.$option[0].'</span>'."\n";
						}
						else
						{
							$ph .= '<input type="radio" id="'.$DOMid.$option[0].'" name="'.$name.'" value="'.$option[1].'" /><span class="'.$DOMid.'Span">'.$option[0].'</span>'."\n";
						}
					}
					else
					{
						$ph .= '<input type="radio" id="'.$DOMid.$option[0].'" name="'.$name.'" value="'.$option[1].'" /><span class="'.$DOMid.'Span">'.$option[0].'</span>'."\n";
					}
				}
				$ph .= '</div>'."\n";
				$ph .= '</label>'."\n";
				// Set the Placeholder
				$modx->setPlaceholder('form.'.$name, $ph);
			}

			if ($type == 'checkbox')
			{
				$ph = '';
				$ph .= '<label for="'.$DOMid.'" id="'.$DOMid.'Label">'.$label."\n";
				$options = explode(',', $values);
				foreach ($options as $eachOption)
				{
					$option = explode('(', $eachOption);
					$option = str_replace(')', '', $option);
					if (isset($CurrentUser[$name]))
					{
						if ($CurrentUser[$name] == 'on')
						{
							$ph .= $option[0].' <input type="checkbox" id="'.$DOMid.'" name="'.$name.'" checked="checked" />'."\n";
						}
						else
						{
							$ph .= $option[0].' <input type="checkbox" id="'.$DOMid.'" name="'.$name.'" />'."\n";
						}
					}
					else
					{
						$ph .= $option[0].' <input type="checkbox" id="'.$DOMid.'" name="'.$name.'" />'."\n";
					}
				}
				$ph .= '</label>'."\n";
				// Set the Placeholder
				$modx->setPlaceholder('form.'.$name, $ph);
			}
		}

		if (!empty($_POST))
		{
			foreach ($_POST as $key => $value)
			{
				$modx->setPlaceholder('post.'.$key, $value);
			}
		}
	}
    function StringForGenderInt($genderInt)
	{
		if ($genderInt == 1)
		{
			return 'Male';
		}
		else if ($genderInt == 2)
		{
			return 'Female';
		}
		else
		{
			return 'Unknown';
		}

	}
        function RemoveUserProfile()
	{
		global $modx;
		
		$currentWebUser = $modx->getWebUserInfo($modx->getLoginUserID());
		$internalKey = $currentWebUser['internalKey'];
		$this->RemoveProfile($internalKey);
		$this->SessionHandler('destroy');		
                echo DELETE_USER;
		return;
	}
        
        function RemoveProfile($internalKey)
	{
		global $modx;
		$deletedUser = $modx->getWebUserInfo($internalKey);
		$web_users = $modx->getFullTableName('web_users');
		$web_user_attributes = $modx->getFullTableName('web_user_attributes');
		$web_groups = $modx->getFullTableName('web_groups');
		$active_users = $modx->getFullTableName('active_users');
		
		$deleteUser = $modx->db->query("DELETE FROM ".$web_users." WHERE `id`='".$internalKey."'");
		$deleteAttributes = $modx->db->query("DELETE FROM ".$web_user_attributes." WHERE `internalKey`='".$internalKey."'");
		$deleteFromGroups = $modx->db->query("DELETE FROM ".$web_groups." WHERE `webuser`='".$internalKey."'");
		$deleteFromActiveUsers = $modx->db->query("DELETE FROM ".$active_users." WHERE `internalKey`='-".$internalKey."'");
		
		if (!$deleteUser || !$deleteAttributes || !$deleteFromGroups || !$deleteFromActiveUsers)
		{
                    echo ERROR_DELETE;
                    return;
                        
		}
		$this->OnWebDeleteUser($internalKey, $deleteUser['username']);
		return;
	}
        
        function SaveUserProfile($internalKey = '')
	{
		global $modx;
		if ($internalKey == '' || empty($internalKey))
		{
			$currentWebUser = $modx->getWebUserInfo($modx->getLoginUserID());
			$internalKey = $currentWebUser['internalKey'];
			$refreshSession = true;
		}
		else
		{
			$currentWebUser = $modx->getWebUserInfo($internalKey);
			$refreshSession = false;
		}
		
		$web_users = $modx->getFullTableName('web_users');
		$web_user_attributes = $modx->getFullTableName('web_user_attributes');
		
		// EVENT: OnBeforeWebSaveUser
		$this->OnBeforeWebSaveUser(array(), array()); // pixelchutes
				
		// Check for arrays and that "confirm" fields match.
		foreach ($_POST as $field => $value)
		{
			if (is_array($_POST[$field]))
			{
				$_POST[$field] = implode('||', $_POST[$field]);
			}
			
			$confirm = $field.'_confirm';
			if (isset($_POST[$confirm]))
			{
				if ($_POST[$field] !== $_POST[$confirm])
				{
					$error = $this->LanguageArray[2].' <br />';
					$fieldMessage .= str_replace('[+000+]', '"'.$field.'"', $error);
				}
			}
		}
		
		// If confirm fields were mismatched, throw this error:
		if (!empty($fieldMessage))
		{
			$err = $fieldMessage;
			unset($fieldMessage);
			return $this->FormatMessage($err);
		}
		
		$generalElementsArray = array('fullname','email','phone','mobilephone','dob','gender','country','state','zip','fax','photo','comment');
		$generalElementsUpdate = array();
		
		// CREDIT: Guillaume to delete data and for code optimisation
		foreach ($generalElementsArray as $field)
		{
			if ($field == 'photo')
			{
				if ($_FILES['photo']['name'] !== '' && !empty($_FILES['photo']['name']))
				{
					$_POST['photo'] = $this->CreateUserImage();
					if (!empty($this->Report))
					{
						return;
					}
				}
			}
			if ($field == 'dob' && trim($_POST['dob'])!='') // for not format an empty date else date is 0 (01-01-1970)
			{
				$_POST['dob'] = $this->MakeDateForDb($_POST['dob']);
			}
			if ($field!='photo' || ($_FILES['photo']['name'] !== '' && !empty($_FILES['photo']['name']))) // for update db with value and blank value (except if the field is 'photo')
{
	// CREDIT: Mike Reid (aka Pixelchutes) for the string escape code.
	$charset='"'.$modx->config['modx_charset'].'"';
	$generalElementsUpdate[] = " `".$field."` = '".$modx->db->escape(stripslashes(htmlentities(trim($_POST[$field]), ENT_QUOTES, $modx->config['modx_charset'])))."'";
}
		}
		
		if (!empty($this->CustomFields) && $this->CustomFields !== '')
		{
			$checkForExtended = "SELECT * FROM ".$this->CustomTable." WHERE `internalKey` = '".$internalKey."'";
			$isExtended = $modx->db->query($checkForExtended);
			$extendedRows = $modx->db->getRow($isExtended);
			
			if (!empty($extendedRows))
			{
				$extendedFieldValues = array();
				foreach ($this->CustomFields as $field)
				{
					// CREDIT: Mike Reid (aka Pixelchutes) for the string escape code.
					$extendedFieldValues[] = " `".$field."` = '".$modx->db->escape(stripslashes(trim($_POST[$field])))."'";
				}
				$this->OnBeforeWebSaveUser($generalElementsUpdate, $extendedFieldValues);
				
				$extendedUserAttr = "UPDATE ".$this->CustomTable." SET".implode(', ', $extendedFieldValues)." WHERE `internalkey` = '".$internalKey."'";
			}
			else
			{
				$extendedFieldValues = array();
				foreach ($this->CustomFields as $field)
				{
					// CREDIT: Mike Reid (aka Pixelchutes) for the string escape code.
					$charset=$modx->config['modx_charset'];
					$extendedFieldValues[$field] = $modx->db->escape(stripslashes(htmlentities(trim($_POST[$field]), ENT_QUOTES,$charset)));
				}
				$this->OnBeforeWebSaveUser($generalElementsUpdate, $extendedFieldValues);
								
			}
		}
		// Prepare the query for General Elements
		$generalElementsSQL = "UPDATE ".$web_user_attributes." SET ".implode(', ', $generalElementsUpdate)." WHERE `internalkey` = '".$internalKey."'";
		
		// Execute the database queries.
		if( count($generalElementsUpdate) > 0 ) $saveMyProfile = $modx->db->query($generalElementsSQL);
				
		$this->User = $this->QueryDbForUser($currentWebUser['username']);
		$this->OnWebSaveUser('update', $this->User);
		
		if ($refreshSession === true)
		{
			$this->SessionHandler('start');
		}
		
		echo UPDATE_OK;
                
	}
        
        function MakeDateForDb($date)
	{
		// $date is a string like 01-22-1975.
		if (strpos($date, '-'))
		{
			$dateArray = explode('-', $date);
		}
		else if (strpos($date, '/'))
		{
			$dateArray = explode('/', $date);
		}
		else
		{
                        echo ERROR_DOB;
			return;
		}
		
		$dateArray = explode('-', $date);
		// $dateArray is somethink like [0]=01, [1]=22, [2]=1975
		// make a unix timestamp out of the original date string.
		$timestamp = mktime(0, 0, 0, $dateArray[0], $dateArray[1], $dateArray[2]);
		return $timestamp;
	}
        function CreateUserImage()
	{
		global $modx;
		
		$imageAttributes = str_replace(', ', ',', $this->UserImageSettings);
		$imageAttributes = explode(',', $imageAttributes);
		
		if ($_FILES['photo']['size'] >= $imageAttributes[0])
		{
			$sizeInKb = round($imageAttributes[0] / 1024);
			$sizeError = str_replace('[+000+]', $sizeInKb, SIZE_ERROR);
                        return $sizeError;
		}
		
		$userImage = $modx->config['base_path'].strtolower(str_replace(' ', '-', basename( $_FILES['photo']['name'])));
		if (!move_uploaded_file($_FILES['photo']['tmp_name'], $userImage))
		{
			return ERROR_UPLOAD;
		}
		
		// License and registration ma'am. I need to se an ID!
		if ($modx->getLoginUserID())
		{
			$currentWebUser = $modx->getWebUserInfo($modx->getLoginUserID());
			if ($this->Type == 'manager')
			{
				$currentWebUser['username'] = $_POST['username'];
			}
		}
		else
		{
			$currentWebUser['username'] = $this->Username;
			if ($this->Username == '' || empty($this->Username))
			{
				$currentWebUser['username'] = $_POST['username'];
			}
		}
		
		// Get dimensions and set new ones.
		list($width, $height) = getimagesize($userImage);
		$new_width = $imageAttributes[1];
		$new_height = $imageAttributes[2];
		
		$wm = $width / $new_width;
		$hm = $height / $new_height;
		if ($wm > 1 || $hm > 1) // (don't magnify a smaller image)
		{
			if ($wm > $hm) $new_height = $height / $wm;
			else $new_width = $width / $hm;
		}
		else { $new_width = $width; $new_height = $height; } // (must set the original size)

		// Resample
		$image_p = imagecreatetruecolor($new_width, $new_height);
		
		switch ($_FILES['photo']['type'])
		{
			case 'image/jpeg':
			case 'image/jpg': // added support for .jpg to the "default" support for .jpeg, so WLPE doesn't give a filetype error
			case 'image/pjpeg': // fix for IE6, which handles the .jpg filetype incorrectly
				$image = imagecreatefromjpeg($userImage);
				$ext = '.jpg';
				break;
				
			case 'image/gif':
				$image = imagecreatefromgif($userImage);
				imageSaveAlpha($image, true);
				imagesavealpha($image_p, true);
				$trans = imagecolorallocatealpha($image_p,255,255,255,127);
				imagefill($image_p,0,0,$trans);
				$ext = '.gif';
				break;
				
			case 'image/png':
				$image = imagecreatefrompng($userImage);
				imageSaveAlpha($image, true);
				imagesavealpha($image_p, true);
				$trans = imagecolorallocatealpha($image_p,255,255,255,127);
				imagefill($image_p,0,0,$trans);
				$ext = '.png';
				break;
				
			default	:
                                return ERROR_FORMAT; 
				break;
		}
		imagecopyresampled($image_p, $image, 0, 0, 0, 0, $new_width, $new_height, $width, $height);

		// Output
		$userImageFilePath = $modx->config['base_path'].'assets/snippets/modxloginza/userimages/'.str_replace(' ', '_', strtolower($currentWebUser['username'])).$ext;
		//$userImageFileURL = $modx->config['site_url'].'assets/snippets/modxloginza/userimages/'.str_replace(' ', '_', strtolower($currentWebUser['username'])).$ext;
		$userImageFileURL = 'assets/snippets/modxloginza/userimages/'.str_replace(' ', '_', strtolower($currentWebUser['username'])).$ext;
		
		switch ($_FILES['photo']['type'])
		{
			case 'image/jpeg':
				imagejpeg($image_p, $userImageFilePath, 100);
				break;
				
			case 'image/gif':
				imagegif($image_p, $userImageFilePath);
				break;
				
			case 'image/png':
				imagepng($image_p, $userImageFilePath, 0);
				break;
				
			default	:
				imagejpeg($image_p, $userImageFilePath, 100);
		}
		
		unlink($userImage);
		
		return $userImageFileURL;
	}

    /*********************************************************
	 * System Events
	 ********************************************************/

	function OnBeforeWebLogin()
	{
		global $modx;

		$parameters = array(
			'username'		=> $this->Username,
			'password'		=> $this->Password,
			'rememberme'	=> null,
			'stayloggedin'	=> null
			);
		$modx->invokeEvent("OnBeforeWebLogin", $parameters);
	}

	function OnWebLogin()
	{
		global $modx;
		$parameters = array('user' => $this->User);
		$modx->invokeEvent('OnWebLogin', $parameters);
	}

	function OnWebAuthentication()
	{
		global $modx;

		$parameters = array(
		    'internalKey'	=> $this->User['internalKey'],
		    'username'      => $this->Username,
		    'form_password'	=> $this->Password,
		    'db_password'	=> $this->User['password'],
		    'rememberme'    => null,
			'stayloggedin'	=> null
		);
		$modx->invokeEvent('OnWebAuthentication', $parameters);
	}

	function OnBeforeWebSaveUser($Attributes = array(), $ExtendedFields = array())
	{
		global $modx;

		$parameters = array(
			'Attributes'	=> $Attributes,
			'ExtendedFields'=> $ExtendedFields
			);
		$modx->invokeEvent('OnBeforeWebSaveUser', $parameters);
	}

	function OnWebSaveUser($mode = 'new', $user = array())
	{
		global $modx;

		$parameters = array(
			'mode'	=> $mode,
			'user'	=> $user
			);
		$modx->invokeEvent('OnWebSaveUser', $parameters);
	}

	function OnBeforeAddToGroup($groups = array())
	{
		global $modx;
		$parameters = array('groups' => $groups);
		$modx->invokeEvent('OnBeforeAddToGroup', $parameters);
	}

	function OnWebChangePassword($internalKey, $username, $newPassword)
	{
		global $modx; // pixelchutes 1:56 AM 9/19/2007
		$parameters = array(
			'internalKey'	=> $internalKey,
			'username'		=> $username,
			'password'		=> $newPassword
			);
        $modx->invokeEvent('OnWebChangePassword', $parameters);
	}

	function OnViewUserProfile($internalKey, $username, $viewerKey, $viewerName)
	{
		global $modx;
		$parameters = array(
			'internalKey'	=> $internalKey,
			'username'		=> $username,
			'viewerKey'		=> $viewerKey,
			'viewername'	=> $viewerName
			);
		$modx->invokeEvent('OnViewProfile', $parameters);
	}

	function OnWebDeleteUser($internalKey, $username)
	{
		global $modx;
		$parameters = array(
			'internalKey'	=> $internalKey,
			'username'		=> $username,
			'timestamp'		=> time()
			);
		$modx->invokeEvent('OnWebDeleteUser', $parameters);
	}

	function OnBeforeWebLogout()
	{
		global $modx;
		$parameters = array(
			'userid'		=> $_SESSION['webInternalKey'],
			'internalKey'	=> $_SESSION['webInternalKey'],
			'username'		=> $_SESSION['webShortname']
			);
		$modx->invokeEvent('OnBeforeWebLogout', $parameters);
	}

	function OnWebLogout()
	{
		global $modx;
		$parameters = array(
			'userid'		=> $_SESSION['webInternalKey'],
			'internalKey'	=> $_SESSION['webInternalKey'],
			'username'		=> $_SESSION['webShortname']
			);
		$modx->invokeEvent('OnWebLogout', $parameters);
	}


}




?>