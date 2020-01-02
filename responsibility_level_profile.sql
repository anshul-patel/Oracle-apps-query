/******************************************
** Responsibility level Profile Options **
******************************************/

select fpot.USER_PROFILE_OPTION_NAME, 
	   frt.responsibility_name, 
	   fpov.profile_option_value,
        fu1.user_name "Created By",
       fu2.user_name "Last Updated By"
from   	   apps.fnd_profile_options fpo, 
	   apps.fnd_profile_options_tl fpot, 
	   apps.fnd_profile_option_values fpov, 
	   apps.fnd_RESPONSIBILITY_tl frt,
       fnd_user fu1,
       fnd_user fu2
where 
	   fpo.profile_option_name = fpot.profile_option_name 
and	   fpot.language = 'US' 
and	   fpov.profile_option_id = fpo.profile_option_id 
and	   fpov.level_id = 10003 
and	   fpov.level_value = frt.responsibility_id 
and	   frt.language = 'US' 
and fpo.created_by=fu1.user_id
and fpo.last_updated_by=fu2.user_id