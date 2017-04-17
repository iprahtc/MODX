<?
$DefaultProfileTpl = '[+wlpe.message+]
	<div id="wlpeUser">
		<form enctype="multipart/form-data" id="wlpeUserProfileForm" action="[~[*id*]~]" method="POST">
			<fieldset id="wlpeUserProfileInput">
				<div id="wlpeUserInfo">
					<h3 id="wlpeProfileWelcome">Hello [+user.fullname+]!</h3>
					<p id="wlpeProfileInfo" class="info">Use this form to update your profile information</p>
				</div>
				<h1>OKKKKKKKKKKKKK</h1>
				<legend>Your User Profile</legend>

				<label for="wlpeUserProfileFullName">Full Name
				<input id="wlpeUserProfileFullName" type="text" name="fullname" value="[+user.fullname+]" />
				</label><br />

				<label for="wlpeUserProfileEmail">Email
				<input id="wlpeUserProfileEmail" type="text" name="email" value="[+user.email+]" />
				</label><br />

				<label for="wlpeUserProfilePhone">Phone number
				<input id="wlpeUserProfilePhone" type="text" name="phone" value="[+user.phone+]" />
				</label><br />

				<label for="wlpeUserProfileMobile">Mobile number
				<input id="wlpeUserProfileMobile" type="text" name="mobilephone" value="[+user.mobilephone+]" />
				</label><br />

				<label for="wlpeUserProfileDob">Date of birth <span class="info">(DD-MM-YYYY)</span>
				<input id="wlpeUserProfileDob" type="text" name="dob" value="[+user.dob+]" />
				</label><br />

				[+form.gender+]

				<label for="wlpeUserProfileComment">Comment/Signature
				<textarea id="wlpeUserProfileComment" name="comment">[+user.comment+]</textarea>
				</label><br />

				<img id="wlpeUserProfilePhotoImg" src="[+user.photo+]" alt="[+user.username+]" title="[+user.fullname+]" height="100" width="100" />
                <br />
				<input type="hidden" id="wlpeUserHiddenPhoto" name="userphoto" value="[+user.photo+]" />
				<input id="wlpeUserProfilePhoto" type="file" name="photo" value="" />
				</label>

				<p id="wlpeUserProfilePhotoInfo" class="info">No bigger than 100kb. will be resized to 100 x 100.</p>



			</fieldset>
			<fieldset id="wlpeUserProfileButtons">
				<button type="submit" id="wlpeSaveProfileButton" name="service" value="saveprofile">Save</button>
				<button type="submit" id="wlpeProfileDoneButton" name="service" value="cancel">Done</button>
				<button type="submit" id="wlpeProfileLogoutButton" name="service" value="logout">Logout</button>
				<button type="submit" id="wlpeProfileDeleteButton" name="service" value="deleteprofile">Delete My Profile</button>
			</fieldset>
		</form>
	</div>';

$ProfileDeleteTpl = '[+wlpe.message+]
	<div id="wlpeProfileDelete">
		<form id="wlpeProfileDeleteForm" name="profileDelteForm" action="[~[*id*]~]" method="POST">
			<fieldset id="wlpeProfileDeleteFieldset">
				<legend id="wlpeProfileDeleteFieldsetLegend">Delete Your Profile</legend>
				<h1 id="wlpeProfileDeleteWarning" class="warning">WARNING!</h1>
				<p>You are about to delete your profile. Are you sure you want to continue?</p>
				
			</fieldset>
			<fieldset id="wlpeProfileDeleteButtonsFieldset">
				<button type="submit" id="wlpeProfileDeleteButton" name="service" value="confirmdeleteprofile">YES! DELETE my profile</button>
				<button type="submit" id="wlpeProfileCancelButton" name="service" value="doNotDelete">NO! Keep my profile</button>
			</fieldset>
		</form>
	</div>'; 
?>