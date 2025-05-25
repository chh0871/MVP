import 'package:cherry_mvp/core/config/config.dart'; 
import 'package:cherry_mvp/core/models/model.dart';

const dummyAccountSection = [ 
  SectionSettingsItem(title: AppStrings.language_Text, trailing: AppStrings.english_Text),
  SectionSettingsItem(title: AppStrings.security_Text, trailing: ''),
  SectionSettingsItem(title: AppStrings.about_us_Text, trailing: ''),
  SectionSettingsItem(title: AppStrings.legal_information_Text, trailing: ''),
  SectionSettingsItem(title: AppStrings.cookie_settings_Text, trailing: ''),
  SectionSettingsItem(title: AppStrings.log_out_Text, trailing: '')
]; 

const dummyShopSection = [  
  SectionSettingsItem(title: AppStrings.country_Text, trailing: AppStrings.united_kingdom_Text),
  SectionSettingsItem(title: AppStrings.currency_Text, trailing: AppStrings.pound_Text), 
  SectionSettingsItem(title: AppStrings.sizes_Text, trailing: AppStrings.UK_Text)
  
const dummySupportSection = [   
  SectionSettingsItem(title: AppStrings.chat_with_us_Text, trailing: ''), 
  SectionSettingsItem(title: AppStrings.FAQ_Text, trailing: '')

const dummyPersonalSection = [    
  SectionSettingsItem(title: AppStrings.profile_Text, trailing: ''), 
  SectionSettingsItem(title: AppStrings.shipping_address_Text, trailing: ''),
  SectionSettingsItem(title: AppStrings.payment_methods_Text, trailing: ''),  
  SectionSettingsItem(title: AppStrings.postage_Text, trailing: '')
]; 