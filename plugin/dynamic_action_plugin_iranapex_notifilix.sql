prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>6663220589178937722
,p_default_application_id=>77574
,p_default_id_offset=>0
,p_default_owner=>'ARTABIT'
);
end;
/
 
prompt APPLICATION 77574 - Sample 2020
--
-- Application Export:
--   Application:     77574
--   Name:            Sample 2020
--   Date and Time:   13:51 Wednesday January 27, 2021
--   Exported By:     RAYANICO@GMAIL.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 30107914691810351214
--   Manifest End
--   Version:         20.2.0.00.20
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/iranapex_notifilix
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(30107914691810351214)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'IRANAPEX.NOTIFILIX'
,p_display_name=>'Notifilix'
,p_category=>'NOTIFICATION'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/***************************************************************************************************',
'Plugin Name:        Notifilix',
'Sponser:            ArtaBit Afzar (www.iranapex.ir)',
'Create Date:        2021-01-25',
'Author:             Mahdi Ahmadi',
'Email:              ahmadi@iranapex.ir ',
'Description:        Notiflix is a  library for client-side non-blocking notifications, popup boxes, ',
'                    loading indicators, and more to that makes your web projects much better.',
'Plugin Type:        [Dynamic Action]',
'',
'Version Support:    APEX 5.1 +',
'****************************************************************************************************',
'SUMMARY OF CHANGES',
'Date(yyyy-mm-dd)    Author              Comments',
'------------------- ------------------- ------------------------------------------------------------',
'2021-01-27          Mahdi Ahmadi        Add Confirm ',
'***************************************************************************************************/',
'',
'function render(p_dynamic_action in apex_plugin.t_dynamic_action',
'              , p_plugin         in apex_plugin.t_plugin)',
'return apex_plugin.t_dynamic_action_render_result is',
'    ',
'    l_rtl                  varchar2(5)    := p_plugin.attribute_01;',
'    l_def_ok_btn_label     varchar2(4000) := p_plugin.attribute_02;',
'    l_def_cancel_btn_label varchar2(4000) := p_plugin.attribute_03;',
'',
'    l_message_type       varchar2(4000) := p_dynamic_action.attribute_01;',
'    l_dialog_type        varchar2(4000) := p_dynamic_action.attribute_02;',
'    l_message            varchar2(4000) := p_dynamic_action.attribute_03;',
'    l_messageBody        varchar2(4000) := p_dynamic_action.attribute_04;',
'    l_width              varchar2(4000) := p_dynamic_action.attribute_05;',
'    l_position           varchar2(4000) := p_dynamic_action.attribute_06;',
'    l_backOverlay        varchar2(4000) := p_dynamic_action.attribute_07;',
'    l_AnimationStyle     varchar2(4000) := p_dynamic_action.attribute_08;',
'    l_useIcon            varchar2(6)    := p_dynamic_action.attribute_09;',
'    l_closeButton        varchar2(4000) := p_dynamic_action.attribute_10;',
'    l_borderRadius       varchar2(4000) := p_dynamic_action.attribute_11;',
'    l_distance           varchar2(4000) := p_dynamic_action.attribute_12;',
'    l_ok_label           varchar2(4000) := p_dynamic_action.attribute_13;',
'    l_cancel_label       varchar2(4000) := p_dynamic_action.attribute_14;',
'    l_timeout            varchar2(4000) := p_dynamic_action.attribute_15;',
'    ',
'    l_function_call varchar2(4000);',
'    l_render_result apex_plugin.t_dynamic_action_render_result;',
'    ',
'    function get_properties return varchar2 is',
'        l_props        varchar2(32767);',
'    begin',
'        if (l_message_type = ''NOTIFY'') then ',
'            l_props := ''Notiflix.Notify.Init({width:''''''|| l_width || ''px'''',rtl:''|| l_rtl ||'',borderRadius:"''|| l_borderRadius || ''px",distance:"''|| l_distance ||''px",position:"''|| l_position ||''",closeButton: ''|| l_closeButton ||'' ,backOverlay:''|| l_'
||'backOverlay ||'',timeout:''|| l_timeout ||'',useIcon:''|| l_useIcon ||'',cssAnimationStyle:"'' || l_AnimationStyle ||''",});'';',
'        ',
'        elsif (l_message_type = ''REPORT'') then',
'            l_props := ''Notiflix.Report.Init({width:''''''|| l_width || ''px'''',rtl:''|| l_rtl ||'',borderRadius:"''|| l_borderRadius || ''px",backOverlay:''|| l_backOverlay ||'',cssAnimationStyle:"'' || l_AnimationStyle ||''",});'';',
'        ',
'        elsif (l_message_type = ''CONFIRM'') then',
'            l_props := ''Notiflix.Confirm.Init({width:''''''|| l_width || ''px'''',rtl:''|| l_rtl ||'',borderRadius:"''|| l_borderRadius || ''px",distance:"''|| l_distance ||''px",backOverlay:''|| l_backOverlay ||'',cssAnimationStyle:"'' || l_AnimationStyle ||''",});'
||''';',
'        end if;',
'        ',
'        return l_props;',
'    end get_properties;',
'    ',
'begin',
'    ',
'    if (apex_application.g_debug) then',
'        apex_plugin_util.debug_dynamic_action(p_plugin, p_dynamic_action);',
'    end if;',
'    ',
'    -- Load Static Files (JS/CSS)',
'    apex_javascript.add_library(',
'        p_name      => ''notiflix-2.7.0.min'',',
'        p_directory => p_plugin.file_prefix,',
'        p_version   => null',
'    );',
'    apex_javascript.add_library(',
'        p_name      => ''apex.notiflix'',',
'        p_directory => p_plugin.file_prefix,',
'        p_version   => null',
'    );',
'    apex_css.add_file(',
'        p_name      => ''notiflix-2.7.0.min'',',
'        p_directory => p_plugin.file_prefix,',
'        p_version   => null',
'    );',
'',
'    l_render_result.attribute_03 := l_message;',
'    l_render_result.attribute_04 := l_messageBody;',
'    l_render_result.attribute_13 := l_ok_label;',
'    l_render_result.attribute_14 := l_cancel_label;',
'',
'    if (l_message_type = ''NOTIFY'') then',
'        ',
'        if (l_dialog_type = ''SUCCESS'') then',
'            l_function_call := ''beCtbNotiflix.Notify.Success(this);'';',
'        elsif (l_dialog_type = ''FAILURE'') then',
'            l_function_call := ''beCtbNotiflix.Notify.Failure(this);'';',
'        elsif (l_dialog_type = ''WARNING'') then',
'            l_function_call := ''beCtbNotiflix.Notify.Warning(this);'';',
'        elsif (l_dialog_type = ''INFO'') then',
'            l_function_call := ''beCtbNotiflix.Notify.Info(this);'';',
'        end if;',
'        ',
'        l_render_result.javascript_function := ''function() { ''|| get_properties || '' '' || l_function_call || ''}'';',
'',
'    elsif (l_message_type = ''REPORT'') then',
'',
'        if (l_dialog_type = ''SUCCESS'') then',
'            l_function_call := ''beCtbNotiflix.Report.Success(this);'';',
'        elsif (l_dialog_type = ''FAILURE'') then',
'            l_function_call := ''beCtbNotiflix.Report.Failure(this);'';',
'        elsif (l_dialog_type = ''WARNING'') then',
'            l_function_call := ''beCtbNotiflix.Report.Warning(this);'';',
'        elsif (l_dialog_type = ''INFO'') then',
'            l_function_call := ''beCtbNotiflix.Report.Info(this);'';',
'        end if;',
'        ',
'        l_render_result.javascript_function := ''function() { ''|| get_properties || '' '' || l_function_call || ''}'';',
'    ',
'    elsif (l_message_type = ''CONFIRM'') then',
'',
'        l_function_call := ''beCtbNotiflix.Confirm.Show(this);'';',
'        ',
'        l_render_result.javascript_function := ''function() { '' || get_properties || '' '' || l_function_call || ''}'';',
'        ',
'    end if;',
'',
'',
'    return l_render_result;',
'  ',
'end;',
''))
,p_api_version=>2
,p_render_function=>'render'
,p_standard_attributes=>'WAIT_FOR_RESULT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'www.iranapex.ir'
,p_files_version=>10
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30111381931014906334)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'RTL'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'false'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30111385602268907791)
,p_plugin_attribute_id=>wwv_flow_api.id(30111381931014906334)
,p_display_sequence=>10
,p_display_value=>'LTR'
,p_return_value=>'false'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30111389468652908615)
,p_plugin_attribute_id=>wwv_flow_api.id(30111381931014906334)
,p_display_sequence=>20
,p_display_value=>'RTL'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30113476053930565229)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'OK Button Label Default'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'OK'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30115233187439957660)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Cancel Button Label Default'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'Cancel'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30108764106642397652)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Message Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'NOTIFY'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30108776681156398784)
,p_plugin_attribute_id=>wwv_flow_api.id(30108764106642397652)
,p_display_sequence=>10
,p_display_value=>'Notify'
,p_return_value=>'NOTIFY'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30108781412708400063)
,p_plugin_attribute_id=>wwv_flow_api.id(30108764106642397652)
,p_display_sequence=>20
,p_display_value=>'Confirm'
,p_return_value=>'CONFIRM'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30108784089148401417)
,p_plugin_attribute_id=>wwv_flow_api.id(30108764106642397652)
,p_display_sequence=>30
,p_display_value=>'Report'
,p_return_value=>'REPORT'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30109180222824408617)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Dialog Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'SUCCESS'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(30108764106642397652)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'CONFIRM'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30109189195174410054)
,p_plugin_attribute_id=>wwv_flow_api.id(30109180222824408617)
,p_display_sequence=>10
,p_display_value=>'Success'
,p_return_value=>'SUCCESS'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30109198285364411252)
,p_plugin_attribute_id=>wwv_flow_api.id(30109180222824408617)
,p_display_sequence=>20
,p_display_value=>'Failure'
,p_return_value=>'FAILURE'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30109216043677412368)
,p_plugin_attribute_id=>wwv_flow_api.id(30109180222824408617)
,p_display_sequence=>30
,p_display_value=>'Warning'
,p_return_value=>'WARNING'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30108981070099803005)
,p_plugin_attribute_id=>wwv_flow_api.id(30109180222824408617)
,p_display_sequence=>40
,p_display_value=>'Info'
,p_return_value=>'INFO'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30109367266795820505)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Message/Title'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>true
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30109550672557827549)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Message Body'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>false
,p_max_length=>100
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(30108764106642397652)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'NOTIFY'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30112584051873927383)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Width'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'300'
,p_display_length=>300
,p_max_length=>999
,p_unit=>'px'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30113018380503935270)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Display Position'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'right-top'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(30108764106642397652)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'NOTIFY'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30114645017678936562)
,p_plugin_attribute_id=>wwv_flow_api.id(30113018380503935270)
,p_display_sequence=>10
,p_display_value=>'Right Top'
,p_return_value=>'right-top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30113449701943548328)
,p_plugin_attribute_id=>wwv_flow_api.id(30113018380503935270)
,p_display_sequence=>20
,p_display_value=>'Right Bottom'
,p_return_value=>'right-bottom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30115087282950939050)
,p_plugin_attribute_id=>wwv_flow_api.id(30113018380503935270)
,p_display_sequence=>30
,p_display_value=>'Left Top'
,p_return_value=>'left-top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30115117962740940198)
,p_plugin_attribute_id=>wwv_flow_api.id(30113018380503935270)
,p_display_sequence=>40
,p_display_value=>'Left Bottom'
,p_return_value=>'left-bottom'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30115259222058968338)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>'Back Overlay'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'true'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30116423979536580045)
,p_plugin_attribute_id=>wwv_flow_api.id(30115259222058968338)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30116425721612581082)
,p_plugin_attribute_id=>wwv_flow_api.id(30115259222058968338)
,p_display_sequence=>20
,p_display_value=>'No'
,p_return_value=>'false'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30118072600830597856)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Animation Style'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'fade'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30118080219646598883)
,p_plugin_attribute_id=>wwv_flow_api.id(30118072600830597856)
,p_display_sequence=>10
,p_display_value=>'fade'
,p_return_value=>'fade'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30118092427125599926)
,p_plugin_attribute_id=>wwv_flow_api.id(30118072600830597856)
,p_display_sequence=>20
,p_display_value=>'zoom'
,p_return_value=>'zoom'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30118102441154600990)
,p_plugin_attribute_id=>wwv_flow_api.id(30118072600830597856)
,p_display_sequence=>30
,p_display_value=>'from-right'
,p_return_value=>'from-right'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30117082150761991108)
,p_plugin_attribute_id=>wwv_flow_api.id(30118072600830597856)
,p_display_sequence=>40
,p_display_value=>'from-left'
,p_return_value=>'from-left'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30118108349489602379)
,p_plugin_attribute_id=>wwv_flow_api.id(30118072600830597856)
,p_display_sequence=>50
,p_display_value=>'from-top'
,p_return_value=>'from-top'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30118116585080603107)
,p_plugin_attribute_id=>wwv_flow_api.id(30118072600830597856)
,p_display_sequence=>60
,p_display_value=>'from-bottom'
,p_return_value=>'from-bottom'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30119004518311612468)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Use Icon'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'true'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(30108764106642397652)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'NOTIFY'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30119006442253613246)
,p_plugin_attribute_id=>wwv_flow_api.id(30119004518311612468)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30118315333802003463)
,p_plugin_attribute_id=>wwv_flow_api.id(30119004518311612468)
,p_display_sequence=>20
,p_display_value=>'No'
,p_return_value=>'false'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30119235038106010400)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>'Close Button'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'false'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(30108764106642397652)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'NOTIFY'
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30119108902511621855)
,p_plugin_attribute_id=>wwv_flow_api.id(30119235038106010400)
,p_display_sequence=>10
,p_display_value=>'Yes'
,p_return_value=>'true'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(30119111137730622648)
,p_plugin_attribute_id=>wwv_flow_api.id(30119235038106010400)
,p_display_sequence=>20
,p_display_value=>'No'
,p_return_value=>'false'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30119282363116019991)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Border Radius'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_default_value=>'10'
,p_display_length=>10
,p_max_length=>99
,p_unit=>'px'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30119599189002027755)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Distance'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'10'
,p_display_length=>10
,p_max_length=>999
,p_unit=>'px'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(30108764106642397652)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'REPORT'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30120745461388650593)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_prompt=>'OK Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'OK'
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(30108764106642397652)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_EQUALS'
,p_depending_on_expression=>'NOTIFY'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30120332960333044582)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Cancel Label'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'Cancel'
,p_is_translatable=>true
,p_depending_on_attribute_id=>wwv_flow_api.id(30108764106642397652)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'CONFIRM'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(30123506962541748528)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Time Out'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'3000'
,p_max_length=>999
,p_unit=>'ms'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(30108764106642397652)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'NOTIFY'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A204E6F7469666C6978202868747470733A2F2F7777772E6E6F7469666C69782E636F6D29202D2056657273696F6E3A20322E372E30202D20417574686F723A204675726B616E204D54202868747470733A2F2F6769746875622E636F6D2F66757263';
wwv_flow_api.g_varchar2_table(2) := '616E29202D20436F707972696768742032303230204E6F7469666C69782C204D4954204C6963656E6365202868747470733A2F2F6F70656E736F757263652E6F72672F6C6963656E7365732F4D495429202A2F0A0A5B69645E3D4E6F7469666C69784E6F';
wwv_flow_api.g_varchar2_table(3) := '74696679577261705D7B706F696E7465722D6576656E74733A6E6F6E653B706F736974696F6E3A66697865643B7A2D696E6465783A343030313B6F7061636974793A313B72696768743A313070783B746F703A313070783B77696474683A32383070783B';
wwv_flow_api.g_varchar2_table(4) := '6D61782D77696474683A3936253B2D7765626B69742D626F782D73697A696E673A626F726465722D626F783B626F782D73697A696E673A626F726465722D626F783B6261636B67726F756E643A7472616E73706172656E747D5B69645E3D4E6F7469666C';
wwv_flow_api.g_varchar2_table(5) := '69784E6F74696679577261705D2E6E782D666C65782D63656E7465722D63656E7465727B6D61782D6865696768743A63616C63283130307668202D2032307078293B6F766572666C6F772D783A68696464656E3B6F766572666C6F772D793A6175746F3B';
wwv_flow_api.g_varchar2_table(6) := '646973706C61793A2D7765626B69742D626F783B646973706C61793A2D7765626B69742D666C65783B646973706C61793A2D6D732D666C6578626F783B646973706C61793A666C65783B2D7765626B69742D666C65782D777261703A777261703B2D6D73';
wwv_flow_api.g_varchar2_table(7) := '2D666C65782D777261703A777261703B666C65782D777261703A777261703B2D7765626B69742D626F782D6F7269656E743A766572746963616C3B2D7765626B69742D626F782D646972656374696F6E3A6E6F726D616C3B2D7765626B69742D666C6578';
wwv_flow_api.g_varchar2_table(8) := '2D646972656374696F6E3A636F6C756D6E3B2D6D732D666C65782D646972656374696F6E3A636F6C756D6E3B666C65782D646972656374696F6E3A636F6C756D6E3B2D7765626B69742D626F782D7061636B3A63656E7465723B2D7765626B69742D6A75';
wwv_flow_api.g_varchar2_table(9) := '73746966792D636F6E74656E743A63656E7465723B2D6D732D666C65782D7061636B3A63656E7465723B6A7573746966792D636F6E74656E743A63656E7465723B2D7765626B69742D626F782D616C69676E3A63656E7465723B2D7765626B69742D616C';
wwv_flow_api.g_varchar2_table(10) := '69676E2D6974656D733A63656E7465723B2D6D732D666C65782D616C69676E3A63656E7465723B616C69676E2D6974656D733A63656E7465723B6D617267696E3A6175746F7D5B69645E3D4E6F7469666C69784E6F74696679577261705D3A3A2D776562';
wwv_flow_api.g_varchar2_table(11) := '6B69742D7363726F6C6C6261727B77696474683A303B6865696768743A307D5B69645E3D4E6F7469666C69784E6F74696679577261705D3A3A2D7765626B69742D7363726F6C6C6261722D7468756D627B6261636B67726F756E643A7472616E73706172';
wwv_flow_api.g_varchar2_table(12) := '656E747D5B69645E3D4E6F7469666C69784E6F74696679577261705D3A3A2D7765626B69742D7363726F6C6C6261722D747261636B7B6261636B67726F756E643A7472616E73706172656E747D5B69645E3D4E6F7469666C69784E6F7469667957726170';
wwv_flow_api.g_varchar2_table(13) := '5D202A7B2D7765626B69742D626F782D73697A696E673A626F726465722D626F783B626F782D73697A696E673A626F726465722D626F787D5B69645E3D4E6F7469666C69784E6F746966794F7665726C61795D7B2D7765626B69742D7472616E73697469';
wwv_flow_api.g_varchar2_table(14) := '6F6E3A6261636B67726F756E64202E337320656173652D696E2D6F75743B2D6F2D7472616E736974696F6E3A6261636B67726F756E64202E337320656173652D696E2D6F75743B7472616E736974696F6E3A6261636B67726F756E64202E337320656173';
wwv_flow_api.g_varchar2_table(15) := '652D696E2D6F75747D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469767B706F696E7465722D6576656E74733A616C6C3B2D7765626B69742D757365722D73656C6563743A6E6F6E653B2D6D6F7A2D757365722D73656C6563743A6E';
wwv_flow_api.g_varchar2_table(16) := '6F6E653B2D6D732D757365722D73656C6563743A6E6F6E653B757365722D73656C6563743A6E6F6E653B666F6E742D66616D696C793A22517569636B73616E64222C2D6170706C652D73797374656D2C426C696E6B4D616353797374656D466F6E742C22';
wwv_flow_api.g_varchar2_table(17) := '5365676F65205549222C526F626F746F2C2248656C766574696361204E657565222C417269616C2C73616E732D73657269663B77696474683A313030253B646973706C61793A2D7765626B69742D696E6C696E652D626F783B646973706C61793A2D7765';
wwv_flow_api.g_varchar2_table(18) := '626B69742D696E6C696E652D666C65783B646973706C61793A2D6D732D696E6C696E652D666C6578626F783B646973706C61793A696E6C696E652D666C65783B2D7765626B69742D666C65782D777261703A777261703B2D6D732D666C65782D77726170';
wwv_flow_api.g_varchar2_table(19) := '3A777261703B666C65782D777261703A777261703B2D7765626B69742D626F782D616C69676E3A63656E7465723B2D7765626B69742D616C69676E2D6974656D733A63656E7465723B2D6D732D666C65782D616C69676E3A63656E7465723B616C69676E';
wwv_flow_api.g_varchar2_table(20) := '2D6974656D733A63656E7465723B706F736974696F6E3A72656C61746976653B6D617267696E3A30203020313070783B626F726465722D7261646975733A3570783B6261636B67726F756E643A233165316531653B636F6C6F723A236666663B70616464';
wwv_flow_api.g_varchar2_table(21) := '696E673A3130707820313270783B666F6E742D73697A653A313470783B6C696E652D6865696768743A312E347D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469763A6C6173742D6368696C647B6D617267696E3A307D5B69645E3D4E';
wwv_flow_api.g_varchar2_table(22) := '6F7469666C69784E6F74696679577261705D3E6469762E776974682D63616C6C6261636B7B637572736F723A706F696E7465727D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D69636F6E7B70616464696E673A38';
wwv_flow_api.g_varchar2_table(23) := '70783B6D696E2D6865696768743A353670787D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E6E782D7061757365647B637572736F723A6175746F7D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E63';
wwv_flow_api.g_varchar2_table(24) := '6C69636B2D746F2D636C6F73657B637572736F723A706F696E7465727D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D636C6F73652D627574746F6E7B70616464696E673A31307078203330707820313070782031';
wwv_flow_api.g_varchar2_table(25) := '3270787D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D69636F6E2E776974682D636C6F73652D627574746F6E7B70616464696E673A367078203330707820367078203670787D5B69645E3D4E6F7469666C69784E';
wwv_flow_api.g_varchar2_table(26) := '6F74696679577261705D3E6469763E7370616E2E7468652D6D6573736167657B637572736F723A696E68657269743B666F6E742D7765696768743A6E6F726D616C3B666F6E742D66616D696C793A696E686572697421696D706F7274616E743B776F7264';
wwv_flow_api.g_varchar2_table(27) := '2D627265616B3A627265616B2D616C6C3B776F72642D627265616B3A627265616B2D776F72647D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469763E7370616E2E6E6F746966792D636C6F73652D627574746F6E7B637572736F723A';
wwv_flow_api.g_varchar2_table(28) := '706F696E7465723B2D7765626B69742D7472616E736974696F6E3A616C6C202E327320656173652D696E2D6F75743B2D6F2D7472616E736974696F6E3A616C6C202E327320656173652D696E2D6F75743B7472616E736974696F6E3A616C6C202E327320';
wwv_flow_api.g_varchar2_table(29) := '656173652D696E2D6F75743B706F736974696F6E3A6162736F6C7574653B72696768743A3870783B746F703A303B626F74746F6D3A303B6D617267696E3A6175746F3B636F6C6F723A696E68657269743B77696474683A313670783B6865696768743A31';
wwv_flow_api.g_varchar2_table(30) := '3670787D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469763E7370616E2E6E6F746966792D636C6F73652D627574746F6E3A686F7665727B2D7765626B69742D7472616E73666F726D3A726F74617465283930646567293B7472616E';
wwv_flow_api.g_varchar2_table(31) := '73666F726D3A726F74617465283930646567297D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469763E7370616E2E6E6F746966792D636C6F73652D627574746F6E3E7376677B706F736974696F6E3A6162736F6C7574653B77696474';
wwv_flow_api.g_varchar2_table(32) := '683A313670783B6865696768743A313670783B72696768743A303B746F703A307D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469763E2E6E6D697B706F736974696F6E3A6162736F6C7574653B77696474683A343070783B68656967';
wwv_flow_api.g_varchar2_table(33) := '68743A343070783B666F6E742D73697A653A333070783B6C696E652D6865696768743A343070783B746578742D616C69676E3A63656E7465723B6C6566743A3870783B746F703A303B626F74746F6D3A303B6D617267696E3A6175746F3B626F72646572';
wwv_flow_api.g_varchar2_table(34) := '2D7261646975733A696E68657269747D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469763E2E7766612E736861646F777B636F6C6F723A696E68657269743B6261636B67726F756E643A7267626128302C302C302C2E3135293B626F';
wwv_flow_api.g_varchar2_table(35) := '782D736861646F773A696E736574203020302033347078207267626128302C302C302C2E32293B746578742D736861646F773A3020302031307078207267626128302C302C302C2E33297D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E';
wwv_flow_api.g_varchar2_table(36) := '6469763E7370616E2E776974682D69636F6E7B706F736974696F6E3A72656C61746976653B666C6F61743A6C6566743B77696474683A63616C632831303025202D2034307078293B6D617267696E3A302030203020343070783B70616464696E673A3020';
wwv_flow_api.g_varchar2_table(37) := '30203020313070783B2D7765626B69742D626F782D73697A696E673A626F726465722D626F783B626F782D73697A696E673A626F726465722D626F787D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E72746C2D6F6E3E2E6E6D';
wwv_flow_api.g_varchar2_table(38) := '697B6C6566743A6175746F3B72696768743A3870787D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E72746C2D6F6E3E7370616E2E776974682D69636F6E7B70616464696E673A302031307078203020303B6D617267696E3A30';
wwv_flow_api.g_varchar2_table(39) := '2034307078203020307D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E72746C2D6F6E3E7370616E2E6E6F746966792D636C6F73652D627574746F6E7B72696768743A6175746F3B6C6566743A3870787D5B69645E3D4E6F7469';
wwv_flow_api.g_varchar2_table(40) := '666C69784E6F74696679577261705D3E6469762E776974682D69636F6E2E776974682D636C6F73652D627574746F6E2E72746C2D6F6E7B70616464696E673A367078203670782036707820333070787D5B69645E3D4E6F7469666C69784E6F7469667957';
wwv_flow_api.g_varchar2_table(41) := '7261705D3E6469762E776974682D636C6F73652D627574746F6E2E72746C2D6F6E7B70616464696E673A313070782031327078203130707820333070787D5B69645E3D4E6F7469666C69784E6F746966794F7665726C61795D2E776974682D616E696D61';
wwv_flow_api.g_varchar2_table(42) := '74696F6E2C5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D616E696D6174696F6E2E6E782D666164657B2D7765626B69742D616E696D6174696F6E3A6E6F746966792D616E696D6174696F6E2D66616465202E3373';
wwv_flow_api.g_varchar2_table(43) := '20656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A6E6F746966792D616E696D6174696F6E2D66616465202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D657320';
wwv_flow_api.g_varchar2_table(44) := '6E6F746966792D616E696D6174696F6E2D666164657B30257B6F7061636974793A307D313030257B6F7061636974793A317D7D406B65796672616D6573206E6F746966792D616E696D6174696F6E2D666164657B30257B6F7061636974793A307D313030';
wwv_flow_api.g_varchar2_table(45) := '257B6F7061636974793A317D7D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D616E696D6174696F6E2E6E782D7A6F6F6D7B2D7765626B69742D616E696D6174696F6E3A6E6F746966792D616E696D6174696F6E2D';
wwv_flow_api.g_varchar2_table(46) := '7A6F6F6D202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A6E6F746966792D616E696D6174696F6E2D7A6F6F6D202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65';
wwv_flow_api.g_varchar2_table(47) := '796672616D6573206E6F746966792D616E696D6174696F6E2D7A6F6F6D7B30257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3530257B2D7765626B69742D7472616E73666F726D';
wwv_flow_api.g_varchar2_table(48) := '3A7363616C6528312E3035293B7472616E73666F726D3A7363616C6528312E3035297D313030257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D406B65796672616D6573206E6F';
wwv_flow_api.g_varchar2_table(49) := '746966792D616E696D6174696F6E2D7A6F6F6D7B30257B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D3530257B2D7765626B69742D7472616E73666F726D3A7363616C6528312E30';
wwv_flow_api.g_varchar2_table(50) := '35293B7472616E73666F726D3A7363616C6528312E3035297D313030257B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D5B69645E3D4E6F7469666C69784E6F7469667957726170';
wwv_flow_api.g_varchar2_table(51) := '5D3E6469762E776974682D616E696D6174696F6E2E6E782D66726F6D2D72696768747B2D7765626B69742D616E696D6174696F6E3A6E6F746966792D616E696D6174696F6E2D66726F6D2D7269676874202E337320656173652D696E2D6F757420307320';
wwv_flow_api.g_varchar2_table(52) := '6E6F726D616C3B616E696D6174696F6E3A6E6F746966792D616E696D6174696F6E2D66726F6D2D7269676874202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573206E6F746966792D616E69';
wwv_flow_api.g_varchar2_table(53) := '6D6174696F6E2D66726F6D2D72696768747B30257B72696768743A2D33303070783B6F7061636974793A307D3530257B72696768743A3870783B6F7061636974793A317D313030257B72696768743A303B6F7061636974793A317D7D406B65796672616D';
wwv_flow_api.g_varchar2_table(54) := '6573206E6F746966792D616E696D6174696F6E2D66726F6D2D72696768747B30257B72696768743A2D33303070783B6F7061636974793A307D3530257B72696768743A3870783B6F7061636974793A317D313030257B72696768743A303B6F7061636974';
wwv_flow_api.g_varchar2_table(55) := '793A317D7D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D616E696D6174696F6E2E6E782D66726F6D2D6C6566747B2D7765626B69742D616E696D6174696F6E3A6E6F746966792D616E696D6174696F6E2D66726F';
wwv_flow_api.g_varchar2_table(56) := '6D2D6C656674202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A6E6F746966792D616E696D6174696F6E2D66726F6D2D6C656674202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765';
wwv_flow_api.g_varchar2_table(57) := '626B69742D6B65796672616D6573206E6F746966792D616E696D6174696F6E2D66726F6D2D6C6566747B30257B6C6566743A2D33303070783B6F7061636974793A307D3530257B6C6566743A3870783B6F7061636974793A317D313030257B6C6566743A';
wwv_flow_api.g_varchar2_table(58) := '303B6F7061636974793A317D7D406B65796672616D6573206E6F746966792D616E696D6174696F6E2D66726F6D2D6C6566747B30257B6C6566743A2D33303070783B6F7061636974793A307D3530257B6C6566743A3870783B6F7061636974793A317D31';
wwv_flow_api.g_varchar2_table(59) := '3030257B6C6566743A303B6F7061636974793A317D7D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D616E696D6174696F6E2E6E782D66726F6D2D746F707B2D7765626B69742D616E696D6174696F6E3A6E6F7469';
wwv_flow_api.g_varchar2_table(60) := '66792D616E696D6174696F6E2D66726F6D2D746F70202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A6E6F746966792D616E696D6174696F6E2D66726F6D2D746F70202E337320656173652D696E2D6F757420';
wwv_flow_api.g_varchar2_table(61) := '3073206E6F726D616C7D402D7765626B69742D6B65796672616D6573206E6F746966792D616E696D6174696F6E2D66726F6D2D746F707B30257B746F703A2D353070783B6F7061636974793A307D3530257B746F703A3870783B6F7061636974793A317D';
wwv_flow_api.g_varchar2_table(62) := '313030257B746F703A303B6F7061636974793A317D7D406B65796672616D6573206E6F746966792D616E696D6174696F6E2D66726F6D2D746F707B30257B746F703A2D353070783B6F7061636974793A307D3530257B746F703A3870783B6F7061636974';
wwv_flow_api.g_varchar2_table(63) := '793A317D313030257B746F703A303B6F7061636974793A317D7D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D616E696D6174696F6E2E6E782D66726F6D2D626F74746F6D7B2D7765626B69742D616E696D617469';
wwv_flow_api.g_varchar2_table(64) := '6F6E3A6E6F746966792D616E696D6174696F6E2D66726F6D2D626F74746F6D202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A6E6F746966792D616E696D6174696F6E2D66726F6D2D626F74746F6D202E3373';
wwv_flow_api.g_varchar2_table(65) := '20656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573206E6F746966792D616E696D6174696F6E2D66726F6D2D626F74746F6D7B30257B626F74746F6D3A2D353070783B6F7061636974793A307D353025';
wwv_flow_api.g_varchar2_table(66) := '7B626F74746F6D3A3870783B6F7061636974793A317D313030257B626F74746F6D3A303B6F7061636974793A317D7D406B65796672616D6573206E6F746966792D616E696D6174696F6E2D66726F6D2D626F74746F6D7B30257B626F74746F6D3A2D3530';
wwv_flow_api.g_varchar2_table(67) := '70783B6F7061636974793A307D3530257B626F74746F6D3A3870783B6F7061636974793A317D313030257B626F74746F6D3A303B6F7061636974793A317D7D5B69645E3D4E6F7469666C69784E6F746966794F7665726C61795D2E776974682D616E696D';
wwv_flow_api.g_varchar2_table(68) := '6174696F6E2E72656D6F76652C5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D616E696D6174696F6E2E6E782D666164652E72656D6F76657B6F7061636974793A303B2D7765626B69742D616E696D6174696F6E3A';
wwv_flow_api.g_varchar2_table(69) := '6E6F746966792D72656D6F76652D66616465202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A6E6F746966792D72656D6F76652D66616465202E337320656173652D696E2D6F7574203073206E6F726D616C7D';
wwv_flow_api.g_varchar2_table(70) := '402D7765626B69742D6B65796672616D6573206E6F746966792D72656D6F76652D666164657B30257B6F7061636974793A317D313030257B6F7061636974793A307D7D406B65796672616D6573206E6F746966792D72656D6F76652D666164657B30257B';
wwv_flow_api.g_varchar2_table(71) := '6F7061636974793A317D313030257B6F7061636974793A307D7D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D616E696D6174696F6E2E6E782D7A6F6F6D2E72656D6F76657B2D7765626B69742D7472616E73666F';
wwv_flow_api.g_varchar2_table(72) := '726D3A7363616C652830293B7472616E73666F726D3A7363616C652830293B2D7765626B69742D616E696D6174696F6E3A6E6F746966792D72656D6F76652D7A6F6F6D202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174';
wwv_flow_api.g_varchar2_table(73) := '696F6E3A6E6F746966792D72656D6F76652D7A6F6F6D202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573206E6F746966792D72656D6F76652D7A6F6F6D7B30257B2D7765626B69742D7472';
wwv_flow_api.g_varchar2_table(74) := '616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D3530257B2D7765626B69742D7472616E73666F726D3A7363616C6528312E3035293B7472616E73666F726D3A7363616C6528312E3035297D313030257B2D7765';
wwv_flow_api.g_varchar2_table(75) := '626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D7D406B65796672616D6573206E6F746966792D72656D6F76652D7A6F6F6D7B30257B2D7765626B69742D7472616E73666F726D3A7363616C65';
wwv_flow_api.g_varchar2_table(76) := '2831293B7472616E73666F726D3A7363616C652831297D3530257B2D7765626B69742D7472616E73666F726D3A7363616C6528312E3035293B7472616E73666F726D3A7363616C6528312E3035297D313030257B2D7765626B69742D7472616E73666F72';
wwv_flow_api.g_varchar2_table(77) := '6D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D7D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D616E696D6174696F6E2E6E782D66726F6D2D746F702E72656D6F76657B6F7061636974';
wwv_flow_api.g_varchar2_table(78) := '793A303B2D7765626B69742D616E696D6174696F6E3A6E6F746966792D72656D6F76652D746F2D746F70202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A6E6F746966792D72656D6F76652D746F2D746F7020';
wwv_flow_api.g_varchar2_table(79) := '2E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573206E6F746966792D72656D6F76652D746F2D746F707B30257B746F703A303B6F7061636974793A317D3530257B746F703A3870783B6F7061';
wwv_flow_api.g_varchar2_table(80) := '636974793A317D313030257B746F703A2D353070783B6F7061636974793A307D7D406B65796672616D6573206E6F746966792D72656D6F76652D746F2D746F707B30257B746F703A303B6F7061636974793A317D3530257B746F703A3870783B6F706163';
wwv_flow_api.g_varchar2_table(81) := '6974793A317D313030257B746F703A2D353070783B6F7061636974793A307D7D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D616E696D6174696F6E2E6E782D66726F6D2D72696768742E72656D6F76657B6F7061';
wwv_flow_api.g_varchar2_table(82) := '636974793A303B2D7765626B69742D616E696D6174696F6E3A6E6F746966792D72656D6F76652D746F2D7269676874202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A6E6F746966792D72656D6F76652D746F';
wwv_flow_api.g_varchar2_table(83) := '2D7269676874202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573206E6F746966792D72656D6F76652D746F2D72696768747B30257B72696768743A303B6F7061636974793A317D3530257B';
wwv_flow_api.g_varchar2_table(84) := '72696768743A3870783B6F7061636974793A317D313030257B72696768743A2D33303070783B6F7061636974793A307D7D406B65796672616D6573206E6F746966792D72656D6F76652D746F2D72696768747B30257B72696768743A303B6F7061636974';
wwv_flow_api.g_varchar2_table(85) := '793A317D3530257B72696768743A3870783B6F7061636974793A317D313030257B72696768743A2D33303070783B6F7061636974793A307D7D5B69645E3D4E6F7469666C69784E6F74696679577261705D3E6469762E776974682D616E696D6174696F6E';
wwv_flow_api.g_varchar2_table(86) := '2E6E782D66726F6D2D626F74746F6D2E72656D6F76657B6F7061636974793A303B2D7765626B69742D616E696D6174696F6E3A6E6F746966792D72656D6F76652D746F2D626F74746F6D202E337320656173652D696E2D6F7574203073206E6F726D616C';
wwv_flow_api.g_varchar2_table(87) := '3B616E696D6174696F6E3A6E6F746966792D72656D6F76652D746F2D626F74746F6D202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573206E6F746966792D72656D6F76652D746F2D626F74';
wwv_flow_api.g_varchar2_table(88) := '746F6D7B30257B626F74746F6D3A303B6F7061636974793A317D3530257B626F74746F6D3A3870783B6F7061636974793A317D313030257B626F74746F6D3A2D353070783B6F7061636974793A307D7D406B65796672616D6573206E6F746966792D7265';
wwv_flow_api.g_varchar2_table(89) := '6D6F76652D746F2D626F74746F6D7B30257B626F74746F6D3A303B6F7061636974793A317D3530257B626F74746F6D3A3870783B6F7061636974793A317D313030257B626F74746F6D3A2D353070783B6F7061636974793A307D7D5B69645E3D4E6F7469';
wwv_flow_api.g_varchar2_table(90) := '666C69784E6F74696679577261705D3E6469762E776974682D616E696D6174696F6E2E6E782D66726F6D2D6C6566742E72656D6F76657B6F7061636974793A303B2D7765626B69742D616E696D6174696F6E3A6E6F746966792D72656D6F76652D746F2D';
wwv_flow_api.g_varchar2_table(91) := '6C656674202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A6E6F746966792D72656D6F76652D746F2D6C656674202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65';
wwv_flow_api.g_varchar2_table(92) := '796672616D6573206E6F746966792D72656D6F76652D746F2D6C6566747B30257B6C6566743A303B6F7061636974793A317D3530257B6C6566743A3870783B6F7061636974793A317D313030257B6C6566743A2D33303070783B6F7061636974793A307D';
wwv_flow_api.g_varchar2_table(93) := '7D406B65796672616D6573206E6F746966792D72656D6F76652D746F2D6C6566747B30257B6C6566743A303B6F7061636974793A317D3530257B6C6566743A3870783B6F7061636974793A317D313030257B6C6566743A2D33303070783B6F7061636974';
wwv_flow_api.g_varchar2_table(94) := '793A307D7D5B69645E3D4E6F7469666C69785265706F7274577261705D7B706F736974696F6E3A66697865643B7A2D696E6465783A343030323B77696474683A313030253B6865696768743A313030253B2D7765626B69742D626F782D73697A696E673A';
wwv_flow_api.g_varchar2_table(95) := '626F726465722D626F783B626F782D73697A696E673A626F726465722D626F783B666F6E742D66616D696C793A22517569636B73616E64222C2D6170706C652D73797374656D2C426C696E6B4D616353797374656D466F6E742C225365676F6520554922';
wwv_flow_api.g_varchar2_table(96) := '2C526F626F746F2C2248656C766574696361204E657565222C417269616C2C73616E732D73657269663B6C6566743A303B746F703A303B70616464696E673A313070783B636F6C6F723A233165316531653B626F726465722D7261646975733A32357078';
wwv_flow_api.g_varchar2_table(97) := '3B6261636B67726F756E643A7472616E73706172656E743B646973706C61793A2D7765626B69742D626F783B646973706C61793A2D7765626B69742D666C65783B646973706C61793A2D6D732D666C6578626F783B646973706C61793A666C65783B2D77';
wwv_flow_api.g_varchar2_table(98) := '65626B69742D666C65782D777261703A777261703B2D6D732D666C65782D777261703A777261703B666C65782D777261703A777261703B2D7765626B69742D626F782D6F7269656E743A766572746963616C3B2D7765626B69742D626F782D6469726563';
wwv_flow_api.g_varchar2_table(99) := '74696F6E3A6E6F726D616C3B2D7765626B69742D666C65782D646972656374696F6E3A636F6C756D6E3B2D6D732D666C65782D646972656374696F6E3A636F6C756D6E3B666C65782D646972656374696F6E3A636F6C756D6E3B2D7765626B69742D626F';
wwv_flow_api.g_varchar2_table(100) := '782D616C69676E3A63656E7465723B2D7765626B69742D616C69676E2D6974656D733A63656E7465723B2D6D732D666C65782D616C69676E3A63656E7465723B616C69676E2D6974656D733A63656E7465723B2D7765626B69742D626F782D7061636B3A';
wwv_flow_api.g_varchar2_table(101) := '63656E7465723B2D7765626B69742D6A7573746966792D636F6E74656E743A63656E7465723B2D6D732D666C65782D7061636B3A63656E7465723B6A7573746966792D636F6E74656E743A63656E7465727D5B69645E3D4E6F7469666C69785265706F72';
wwv_flow_api.g_varchar2_table(102) := '74577261705D202A7B2D7765626B69742D626F782D73697A696E673A626F726465722D626F783B626F782D73697A696E673A626F726465722D626F787D5B69645E3D4E6F7469666C69785265706F7274577261705D3E6469765B636C6173732A3D222D6F';
wwv_flow_api.g_varchar2_table(103) := '7665726C6179225D7B77696474683A313030253B6865696768743A313030253B6C6566743A303B746F703A303B6261636B67726F756E643A72676261283235352C3235352C3235352C2E35293B706F736974696F6E3A66697865643B7A2D696E6465783A';
wwv_flow_api.g_varchar2_table(104) := '307D5B69645E3D4E6F7469666C69785265706F7274577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D7B77696474683A33323070783B6D61782D77696474683A313030253B6D61782D6865696768743A393676683B6F766572666C6F';
wwv_flow_api.g_varchar2_table(105) := '772D783A68696464656E3B6F766572666C6F772D793A6175746F3B626F726465722D7261646975733A696E68657269743B70616464696E673A313070783B2D7765626B69742D66696C7465723A64726F702D736861646F77283020302035707820726762';
wwv_flow_api.g_varchar2_table(106) := '6128302C20302C20302C202E303529293B66696C7465723A64726F702D736861646F772830203020357078207267626128302C20302C20302C202E303529293B626F726465723A31707820736F6C6964207267626128302C302C302C2E3033293B626163';
wwv_flow_api.g_varchar2_table(107) := '6B67726F756E643A236638663866383B706F736974696F6E3A72656C61746976653B7A2D696E6465783A317D5B69645E3D4E6F7469666C69785265706F7274577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3A3A2D7765626B6974';
wwv_flow_api.g_varchar2_table(108) := '2D7363726F6C6C6261727B77696474683A303B6865696768743A307D5B69645E3D4E6F7469666C69785265706F7274577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3A3A2D7765626B69742D7363726F6C6C6261722D7468756D62';
wwv_flow_api.g_varchar2_table(109) := '7B6261636B67726F756E643A7472616E73706172656E747D5B69645E3D4E6F7469666C69785265706F7274577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3A3A2D7765626B69742D7363726F6C6C6261722D747261636B7B626163';
wwv_flow_api.g_varchar2_table(110) := '6B67726F756E643A7472616E73706172656E747D5B69645E3D4E6F7469666C69785265706F7274577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C617373243D222D69636F6E225D7B2D7765626B69742D75736572';
wwv_flow_api.g_varchar2_table(111) := '2D73656C6563743A6E6F6E653B2D6D6F7A2D757365722D73656C6563743A6E6F6E653B2D6D732D757365722D73656C6563743A6E6F6E653B757365722D73656C6563743A6E6F6E653B77696474683A31313070783B6865696768743A31313070783B6469';
wwv_flow_api.g_varchar2_table(112) := '73706C61793A626C6F636B3B6D617267696E3A367078206175746F20313270787D5B69645E3D4E6F7469666C69785265706F7274577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C617373243D222D69636F6E225D';
wwv_flow_api.g_varchar2_table(113) := '207376677B6D696E2D77696474683A313030253B6D61782D77696474683A313030253B6865696768743A6175746F7D5B69645E3D4E6F7469666C69785265706F7274577261705D3E2A3E68357B776F72642D627265616B3A627265616B2D616C6C3B776F';
wwv_flow_api.g_varchar2_table(114) := '72642D627265616B3A627265616B2D776F72643B666F6E742D66616D696C793A696E686572697421696D706F7274616E743B666F6E742D73697A653A313670783B666F6E742D7765696768743A3530303B6C696E652D6865696768743A312E343B6D6172';
wwv_flow_api.g_varchar2_table(115) := '67696E3A30203020313070783B70616464696E673A30203020313070783B626F726465722D626F74746F6D3A31707820736F6C6964207267626128302C302C302C2E31293B666C6F61743A6C6566743B77696474683A313030253B746578742D616C6967';
wwv_flow_api.g_varchar2_table(116) := '6E3A63656E7465727D5B69645E3D4E6F7469666C69785265706F7274577261705D3E2A3E707B776F72642D627265616B3A627265616B2D616C6C3B776F72642D627265616B3A627265616B2D776F72643B666F6E742D66616D696C793A696E6865726974';
wwv_flow_api.g_varchar2_table(117) := '21696D706F7274616E743B666F6E742D73697A653A313370783B6C696E652D6865696768743A312E343B666F6E742D7765696768743A6E6F726D616C3B666C6F61743A6C6566743B77696474683A313030253B70616464696E673A3020313070783B6D61';
wwv_flow_api.g_varchar2_table(118) := '7267696E3A30203020313070787D5B69645E3D4E6F7469666C69785265706F7274577261705D2061234E585265706F7274427574746F6E7B776F72642D627265616B3A627265616B2D616C6C3B776F72642D627265616B3A627265616B2D776F72643B2D';
wwv_flow_api.g_varchar2_table(119) := '7765626B69742D757365722D73656C6563743A6E6F6E653B2D6D6F7A2D757365722D73656C6563743A6E6F6E653B2D6D732D757365722D73656C6563743A6E6F6E653B757365722D73656C6563743A6E6F6E653B666F6E742D66616D696C793A696E6865';
wwv_flow_api.g_varchar2_table(120) := '72697421696D706F7274616E743B2D7765626B69742D7472616E736974696F6E3A616C6C202E32357320656173652D696E2D6F75743B2D6F2D7472616E736974696F6E3A616C6C202E32357320656173652D696E2D6F75743B7472616E736974696F6E3A';
wwv_flow_api.g_varchar2_table(121) := '616C6C202E32357320656173652D696E2D6F75743B637572736F723A706F696E7465723B666C6F61743A72696768743B70616464696E673A37707820313770783B6261636B67726F756E643A233332633638323B666F6E742D73697A653A313470783B6C';
wwv_flow_api.g_varchar2_table(122) := '696E652D6865696768743A312E343B666F6E742D7765696768743A3530303B626F726465722D7261646975733A696E686572697421696D706F7274616E743B636F6C6F723A236666667D5B69645E3D4E6F7469666C69785265706F7274577261705D2061';
wwv_flow_api.g_varchar2_table(123) := '234E585265706F7274427574746F6E3A686F7665727B626F782D736861646F773A696E7365742030202D3630707820357078202D357078207267626128302C302C302C2E3235297D5B69645E3D4E6F7469666C69785265706F7274577261705D2E72746C';
wwv_flow_api.g_varchar2_table(124) := '2D6F6E2061234E585265706F7274427574746F6E7B666C6F61743A6C6566747D5B69645E3D4E6F7469666C69785265706F7274577261705D3E6469765B636C6173732A3D222D6F7665726C6179225D2E776974682D616E696D6174696F6E7B2D7765626B';
wwv_flow_api.g_varchar2_table(125) := '69742D616E696D6174696F6E3A7265706F72742D6F7665726C61792D616E696D6174696F6E202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A7265706F72742D6F7665726C61792D616E696D6174696F6E202E';
wwv_flow_api.g_varchar2_table(126) := '337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573207265706F72742D6F7665726C61792D616E696D6174696F6E7B30257B6F7061636974793A307D313030257B6F7061636974793A317D7D406B';
wwv_flow_api.g_varchar2_table(127) := '65796672616D6573207265706F72742D6F7665726C61792D616E696D6174696F6E7B30257B6F7061636974793A307D313030257B6F7061636974793A317D7D5B69645E3D4E6F7469666C69785265706F7274577261705D3E6469765B636C6173732A3D22';
wwv_flow_api.g_varchar2_table(128) := '2D636F6E74656E74225D2E776974682D616E696D6174696F6E2E6E782D666164657B2D7765626B69742D616E696D6174696F6E3A7265706F72742D616E696D6174696F6E2D66616465202E337320656173652D696E2D6F7574203073206E6F726D616C3B';
wwv_flow_api.g_varchar2_table(129) := '616E696D6174696F6E3A7265706F72742D616E696D6174696F6E2D66616465202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573207265706F72742D616E696D6174696F6E2D666164657B30';
wwv_flow_api.g_varchar2_table(130) := '257B6F7061636974793A307D313030257B6F7061636974793A317D7D406B65796672616D6573207265706F72742D616E696D6174696F6E2D666164657B30257B6F7061636974793A307D313030257B6F7061636974793A317D7D5B69645E3D4E6F746966';
wwv_flow_api.g_varchar2_table(131) := '6C69785265706F7274577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D2E776974682D616E696D6174696F6E2E6E782D7A6F6F6D7B2D7765626B69742D616E696D6174696F6E3A7265706F72742D616E696D6174696F6E2D7A6F6F6D';
wwv_flow_api.g_varchar2_table(132) := '202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A7265706F72742D616E696D6174696F6E2D7A6F6F6D202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B6579667261';
wwv_flow_api.g_varchar2_table(133) := '6D6573207265706F72742D616E696D6174696F6E2D7A6F6F6D7B30257B6F7061636974793A303B2D7765626B69742D7472616E73666F726D3A7363616C65282E35293B7472616E73666F726D3A7363616C65282E35297D3530257B6F7061636974793A31';
wwv_flow_api.g_varchar2_table(134) := '3B2D7765626B69742D7472616E73666F726D3A7363616C6528312E3035293B7472616E73666F726D3A7363616C6528312E3035297D313030257B6F7061636974793A313B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73';
wwv_flow_api.g_varchar2_table(135) := '666F726D3A7363616C652831297D7D406B65796672616D6573207265706F72742D616E696D6174696F6E2D7A6F6F6D7B30257B6F7061636974793A303B2D7765626B69742D7472616E73666F726D3A7363616C65282E35293B7472616E73666F726D3A73';
wwv_flow_api.g_varchar2_table(136) := '63616C65282E35297D3530257B6F7061636974793A313B2D7765626B69742D7472616E73666F726D3A7363616C6528312E3035293B7472616E73666F726D3A7363616C6528312E3035297D313030257B6F7061636974793A313B2D7765626B69742D7472';
wwv_flow_api.g_varchar2_table(137) := '616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D5B69645E3D4E6F7469666C69785265706F7274577261705D2E72656D6F76653E6469765B636C6173732A3D222D6F7665726C6179225D2E776974682D616E69';
wwv_flow_api.g_varchar2_table(138) := '6D6174696F6E7B6F7061636974793A303B2D7765626B69742D616E696D6174696F6E3A7265706F72742D6F7665726C61792D616E696D6174696F6E2D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D617469';
wwv_flow_api.g_varchar2_table(139) := '6F6E3A7265706F72742D6F7665726C61792D616E696D6174696F6E2D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573207265706F72742D6F7665726C61792D616E696D61';
wwv_flow_api.g_varchar2_table(140) := '74696F6E2D72656D6F76657B30257B6F7061636974793A317D313030257B6F7061636974793A307D7D406B65796672616D6573207265706F72742D6F7665726C61792D616E696D6174696F6E2D72656D6F76657B30257B6F7061636974793A317D313030';
wwv_flow_api.g_varchar2_table(141) := '257B6F7061636974793A307D7D5B69645E3D4E6F7469666C69785265706F7274577261705D2E72656D6F76653E6469765B636C6173732A3D222D636F6E74656E74225D2E776974682D616E696D6174696F6E2E6E782D666164657B6F7061636974793A30';
wwv_flow_api.g_varchar2_table(142) := '3B2D7765626B69742D616E696D6174696F6E3A7265706F72742D616E696D6174696F6E2D666164652D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A7265706F72742D616E696D6174696F6E';
wwv_flow_api.g_varchar2_table(143) := '2D666164652D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573207265706F72742D616E696D6174696F6E2D666164652D72656D6F76657B30257B6F7061636974793A317D';
wwv_flow_api.g_varchar2_table(144) := '313030257B6F7061636974793A307D7D406B65796672616D6573207265706F72742D616E696D6174696F6E2D666164652D72656D6F76657B30257B6F7061636974793A317D313030257B6F7061636974793A307D7D5B69645E3D4E6F7469666C69785265';
wwv_flow_api.g_varchar2_table(145) := '706F7274577261705D2E72656D6F76653E6469765B636C6173732A3D222D636F6E74656E74225D2E776974682D616E696D6174696F6E2E6E782D7A6F6F6D7B6F7061636974793A303B2D7765626B69742D616E696D6174696F6E3A7265706F72742D616E';
wwv_flow_api.g_varchar2_table(146) := '696D6174696F6E2D7A6F6F6D2D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A7265706F72742D616E696D6174696F6E2D7A6F6F6D2D72656D6F7665202E337320656173652D696E2D6F7574';
wwv_flow_api.g_varchar2_table(147) := '203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573207265706F72742D616E696D6174696F6E2D7A6F6F6D2D72656D6F76657B30257B6F7061636974793A313B2D7765626B69742D7472616E73666F726D3A7363616C652831293B74';
wwv_flow_api.g_varchar2_table(148) := '72616E73666F726D3A7363616C652831297D3530257B6F7061636974793A2E353B2D7765626B69742D7472616E73666F726D3A7363616C6528312E3035293B7472616E73666F726D3A7363616C6528312E3035297D313030257B6F7061636974793A303B';
wwv_flow_api.g_varchar2_table(149) := '2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D7D406B65796672616D6573207265706F72742D616E696D6174696F6E2D7A6F6F6D2D72656D6F76657B30257B6F7061636974793A313B';
wwv_flow_api.g_varchar2_table(150) := '2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D3530257B6F7061636974793A2E353B2D7765626B69742D7472616E73666F726D3A7363616C6528312E3035293B7472616E73666F726D';
wwv_flow_api.g_varchar2_table(151) := '3A7363616C6528312E3035297D313030257B6F7061636974793A303B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D7D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D';
wwv_flow_api.g_varchar2_table(152) := '7B706F736974696F6E3A66697865643B7A2D696E6465783A343030333B77696474683A313030253B6865696768743A313030253B6C6566743A303B746F703A303B70616464696E673A313070783B2D7765626B69742D626F782D73697A696E673A626F72';
wwv_flow_api.g_varchar2_table(153) := '6465722D626F783B626F782D73697A696E673A626F726465722D626F783B6261636B67726F756E643A7472616E73706172656E743B666F6E742D66616D696C793A22517569636B73616E64222C2D6170706C652D73797374656D2C426C696E6B4D616353';
wwv_flow_api.g_varchar2_table(154) := '797374656D466F6E742C225365676F65205549222C526F626F746F2C2248656C766574696361204E657565222C417269616C2C73616E732D73657269663B646973706C61793A2D7765626B69742D626F783B646973706C61793A2D7765626B69742D666C';
wwv_flow_api.g_varchar2_table(155) := '65783B646973706C61793A2D6D732D666C6578626F783B646973706C61793A666C65783B2D7765626B69742D666C65782D777261703A777261703B2D6D732D666C65782D777261703A777261703B666C65782D777261703A777261703B2D7765626B6974';
wwv_flow_api.g_varchar2_table(156) := '2D626F782D6F7269656E743A766572746963616C3B2D7765626B69742D626F782D646972656374696F6E3A6E6F726D616C3B2D7765626B69742D666C65782D646972656374696F6E3A636F6C756D6E3B2D6D732D666C65782D646972656374696F6E3A63';
wwv_flow_api.g_varchar2_table(157) := '6F6C756D6E3B666C65782D646972656374696F6E3A636F6C756D6E3B2D7765626B69742D626F782D616C69676E3A63656E7465723B2D7765626B69742D616C69676E2D6974656D733A63656E7465723B2D6D732D666C65782D616C69676E3A63656E7465';
wwv_flow_api.g_varchar2_table(158) := '723B616C69676E2D6974656D733A63656E7465723B2D7765626B69742D626F782D7061636B3A63656E7465723B2D7765626B69742D6A7573746966792D636F6E74656E743A63656E7465723B2D6D732D666C65782D7061636B3A63656E7465723B6A7573';
wwv_flow_api.g_varchar2_table(159) := '746966792D636F6E74656E743A63656E7465727D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E6E782D706F736974696F6E2D63656E7465722D746F707B2D7765626B69742D626F782D7061636B3A73746172743B2D7765626B69742D';
wwv_flow_api.g_varchar2_table(160) := '6A7573746966792D636F6E74656E743A666C65782D73746172743B2D6D732D666C65782D7061636B3A73746172743B6A7573746966792D636F6E74656E743A666C65782D73746172747D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E';
wwv_flow_api.g_varchar2_table(161) := '6E782D706F736974696F6E2D63656E7465722D626F74746F6D7B2D7765626B69742D626F782D7061636B3A656E643B2D7765626B69742D6A7573746966792D636F6E74656E743A666C65782D656E643B2D6D732D666C65782D7061636B3A656E643B6A75';
wwv_flow_api.g_varchar2_table(162) := '73746966792D636F6E74656E743A666C65782D656E647D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E6E782D706F736974696F6E2D6C6566742D746F707B2D7765626B69742D626F782D616C69676E3A73746172743B2D7765626B69';
wwv_flow_api.g_varchar2_table(163) := '742D616C69676E2D6974656D733A666C65782D73746172743B2D6D732D666C65782D616C69676E3A73746172743B616C69676E2D6974656D733A666C65782D73746172743B2D7765626B69742D626F782D7061636B3A73746172743B2D7765626B69742D';
wwv_flow_api.g_varchar2_table(164) := '6A7573746966792D636F6E74656E743A666C65782D73746172743B2D6D732D666C65782D7061636B3A73746172743B6A7573746966792D636F6E74656E743A666C65782D73746172747D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E';
wwv_flow_api.g_varchar2_table(165) := '6E782D706F736974696F6E2D6C6566742D63656E7465727B2D7765626B69742D626F782D616C69676E3A73746172743B2D7765626B69742D616C69676E2D6974656D733A666C65782D73746172743B2D6D732D666C65782D616C69676E3A73746172743B';
wwv_flow_api.g_varchar2_table(166) := '616C69676E2D6974656D733A666C65782D73746172747D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E6E782D706F736974696F6E2D6C6566742D626F74746F6D7B2D7765626B69742D626F782D616C69676E3A73746172743B2D7765';
wwv_flow_api.g_varchar2_table(167) := '626B69742D616C69676E2D6974656D733A666C65782D73746172743B2D6D732D666C65782D616C69676E3A73746172743B616C69676E2D6974656D733A666C65782D73746172743B2D7765626B69742D626F782D7061636B3A656E643B2D7765626B6974';
wwv_flow_api.g_varchar2_table(168) := '2D6A7573746966792D636F6E74656E743A666C65782D656E643B2D6D732D666C65782D7061636B3A656E643B6A7573746966792D636F6E74656E743A666C65782D656E647D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E6E782D706F';
wwv_flow_api.g_varchar2_table(169) := '736974696F6E2D72696768742D746F707B2D7765626B69742D626F782D616C69676E3A656E643B2D7765626B69742D616C69676E2D6974656D733A666C65782D656E643B2D6D732D666C65782D616C69676E3A656E643B616C69676E2D6974656D733A66';
wwv_flow_api.g_varchar2_table(170) := '6C65782D656E643B2D7765626B69742D626F782D7061636B3A73746172743B2D7765626B69742D6A7573746966792D636F6E74656E743A666C65782D73746172743B2D6D732D666C65782D7061636B3A73746172743B6A7573746966792D636F6E74656E';
wwv_flow_api.g_varchar2_table(171) := '743A666C65782D73746172747D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E6E782D706F736974696F6E2D72696768742D63656E7465727B2D7765626B69742D626F782D616C69676E3A656E643B2D7765626B69742D616C69676E2D';
wwv_flow_api.g_varchar2_table(172) := '6974656D733A666C65782D656E643B2D6D732D666C65782D616C69676E3A656E643B616C69676E2D6974656D733A666C65782D656E647D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E6E782D706F736974696F6E2D72696768742D62';
wwv_flow_api.g_varchar2_table(173) := '6F74746F6D7B2D7765626B69742D626F782D616C69676E3A656E643B2D7765626B69742D616C69676E2D6974656D733A666C65782D656E643B2D6D732D666C65782D616C69676E3A656E643B616C69676E2D6974656D733A666C65782D656E643B2D7765';
wwv_flow_api.g_varchar2_table(174) := '626B69742D626F782D7061636B3A656E643B2D7765626B69742D6A7573746966792D636F6E74656E743A666C65782D656E643B2D6D732D666C65782D7061636B3A656E643B6A7573746966792D636F6E74656E743A666C65782D656E647D5B69645E3D4E';
wwv_flow_api.g_varchar2_table(175) := '6F7469666C6978436F6E6669726D577261705D202A7B2D7765626B69742D626F782D73697A696E673A626F726465722D626F783B626F782D73697A696E673A626F726465722D626F787D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E';
wwv_flow_api.g_varchar2_table(176) := '6469765B636C6173732A3D222D6F7665726C6179225D7B77696474683A313030253B6865696768743A313030253B6C6566743A303B746F703A303B6261636B67726F756E643A72676261283235352C3235352C3235352C2E35293B706F736974696F6E3A';
wwv_flow_api.g_varchar2_table(177) := '66697865643B7A2D696E6465783A307D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D222D6F7665726C6179225D2E776974682D616E696D6174696F6E7B2D7765626B69742D616E696D6174696F6E3A636F';
wwv_flow_api.g_varchar2_table(178) := '6E6669726D2D6F7665726C61792D616E696D6174696F6E202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A636F6E6669726D2D6F7665726C61792D616E696D6174696F6E202E337320656173652D696E2D6F75';
wwv_flow_api.g_varchar2_table(179) := '74203073206E6F726D616C7D402D7765626B69742D6B65796672616D657320636F6E6669726D2D6F7665726C61792D616E696D6174696F6E7B30257B6F7061636974793A307D313030257B6F7061636974793A317D7D406B65796672616D657320636F6E';
wwv_flow_api.g_varchar2_table(180) := '6669726D2D6F7665726C61792D616E696D6174696F6E7B30257B6F7061636974793A307D313030257B6F7061636974793A317D7D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E72656D6F76653E6469765B636C6173732A3D222D6F76';
wwv_flow_api.g_varchar2_table(181) := '65726C6179225D2E776974682D616E696D6174696F6E7B6F7061636974793A303B2D7765626B69742D616E696D6174696F6E3A636F6E6669726D2D6F7665726C61792D616E696D6174696F6E2D72656D6F7665202E337320656173652D696E2D6F757420';
wwv_flow_api.g_varchar2_table(182) := '3073206E6F726D616C3B616E696D6174696F6E3A636F6E6669726D2D6F7665726C61792D616E696D6174696F6E2D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D657320636F';
wwv_flow_api.g_varchar2_table(183) := '6E6669726D2D6F7665726C61792D616E696D6174696F6E2D72656D6F76657B30257B6F7061636974793A317D313030257B6F7061636974793A307D7D406B65796672616D657320636F6E6669726D2D6F7665726C61792D616E696D6174696F6E2D72656D';
wwv_flow_api.g_varchar2_table(184) := '6F76657B30257B6F7061636974793A317D313030257B6F7061636974793A307D7D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D7B77696474683A33303070783B6D61782D7769';
wwv_flow_api.g_varchar2_table(185) := '6474683A313030253B6D61782D6865696768743A393676683B6F766572666C6F772D783A68696464656E3B6F766572666C6F772D793A6175746F3B626F726465722D7261646975733A323570783B70616464696E673A313070783B6D617267696E3A303B';
wwv_flow_api.g_varchar2_table(186) := '2D7765626B69742D66696C7465723A64726F702D736861646F772830203020357078207267626128302C20302C20302C202E303529293B66696C7465723A64726F702D736861646F772830203020357078207267626128302C20302C20302C202E303529';
wwv_flow_api.g_varchar2_table(187) := '293B6261636B67726F756E643A236638663866383B636F6C6F723A233165316531653B706F736974696F6E3A72656C61746976653B7A2D696E6465783A313B746578742D616C69676E3A63656E7465727D5B69645E3D4E6F7469666C6978436F6E666972';
wwv_flow_api.g_varchar2_table(188) := '6D577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3A3A2D7765626B69742D7363726F6C6C6261727B77696474683A303B6865696768743A307D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173';
wwv_flow_api.g_varchar2_table(189) := '732A3D222D636F6E74656E74225D3A3A2D7765626B69742D7363726F6C6C6261722D7468756D627B6261636B67726F756E643A7472616E73706172656E747D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D';
wwv_flow_api.g_varchar2_table(190) := '222D636F6E74656E74225D3A3A2D7765626B69742D7363726F6C6C6261722D747261636B7B6261636B67726F756E643A7472616E73706172656E747D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D222D63';
wwv_flow_api.g_varchar2_table(191) := '6F6E74656E74225D3E6469765B636C6173732A3D222D68656164225D7B666C6F61743A6C6566743B77696474683A313030253B746578742D616C69676E3A696E68657269747D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B';
wwv_flow_api.g_varchar2_table(192) := '636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D68656164225D3E68357B666C6F61743A6C6566743B77696474683A313030253B6D617267696E3A303B70616464696E673A30203020313070783B626F726465722D626F74';
wwv_flow_api.g_varchar2_table(193) := '746F6D3A31707820736F6C6964207267626128302C302C302C2E31293B636F6C6F723A233332633638323B666F6E742D66616D696C793A696E686572697421696D706F7274616E743B666F6E742D73697A653A313670783B6C696E652D6865696768743A';
wwv_flow_api.g_varchar2_table(194) := '312E343B666F6E742D7765696768743A3530303B746578742D616C69676E3A696E68657269747D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D22';
wwv_flow_api.g_varchar2_table(195) := '2D68656164225D3E6469767B666F6E742D66616D696C793A696E686572697421696D706F7274616E743B6D617267696E3A31357078203020323070783B70616464696E673A3020313070783B666C6F61743A6C6566743B77696474683A313030253B666F';
wwv_flow_api.g_varchar2_table(196) := '6E742D73697A653A313470783B6C696E652D6865696768743A312E343B666F6E742D7765696768743A6E6F726D616C3B636F6C6F723A696E68657269743B746578742D616C69676E3A696E68657269747D5B69645E3D4E6F7469666C6978436F6E666972';
wwv_flow_api.g_varchar2_table(197) := '6D577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D68656164225D3E6469763E6469767B666F6E742D66616D696C793A696E686572697421696D706F7274616E743B666C6F61743A6C6566743B77';
wwv_flow_api.g_varchar2_table(198) := '696474683A313030253B6D617267696E3A31357078203020303B70616464696E673A307D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D6865';
wwv_flow_api.g_varchar2_table(199) := '6164225D3E6469763E6469763E696E7075747B666F6E742D66616D696C793A696E686572697421696D706F7274616E743B666C6F61743A6C6566743B77696474683A313030253B6865696768743A343070783B6D617267696E3A303B70616464696E673A';
wwv_flow_api.g_varchar2_table(200) := '3020313570783B626F726465723A31707820736F6C6964207267626128302C302C302C2E31293B626F726465722D7261646975733A323570783B666F6E742D73697A653A313470783B666F6E742D7765696768743A6E6F726D616C3B6C696E652D686569';
wwv_flow_api.g_varchar2_table(201) := '6768743A313B2D7765626B69742D7472616E736974696F6E3A616C6C202E32357320656173652D696E2D6F75743B2D6F2D7472616E736974696F6E3A616C6C202E32357320656173652D696E2D6F75743B7472616E736974696F6E3A616C6C202E323573';
wwv_flow_api.g_varchar2_table(202) := '20656173652D696E2D6F75743B746578742D616C69676E3A6C6566747D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E72746C2D6F6E3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D6865';
wwv_flow_api.g_varchar2_table(203) := '6164225D3E6469763E6469763E696E7075747B746578742D616C69676E3A72696768747D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D6865';
wwv_flow_api.g_varchar2_table(204) := '6164225D3E6469763E6469763E696E7075743A686F7665727B626F726465722D636F6C6F723A7267626128302C302C302C2E31297D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D222D636F6E74656E7422';
wwv_flow_api.g_varchar2_table(205) := '5D3E6469765B636C6173732A3D222D68656164225D3E6469763E6469763E696E7075743A666F6375737B626F726465722D636F6C6F723A7267626128302C302C302C2E33297D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B';
wwv_flow_api.g_varchar2_table(206) := '636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D68656164225D3E6469763E6469763E696E7075742E6E782D76616C69646174696F6E2D6661696C7572657B626F726465722D636F6C6F723A236666353534397D5B69645E';
wwv_flow_api.g_varchar2_table(207) := '3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D68656164225D3E6469763E6469763E696E7075742E6E782D76616C69646174696F6E2D73756363657373';
wwv_flow_api.g_varchar2_table(208) := '7B626F726465722D636F6C6F723A233332633638327D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D627574746F6E73225D7B2D7765626B69';
wwv_flow_api.g_varchar2_table(209) := '742D757365722D73656C6563743A6E6F6E653B2D6D6F7A2D757365722D73656C6563743A6E6F6E653B2D6D732D757365722D73656C6563743A6E6F6E653B757365722D73656C6563743A6E6F6E653B626F726465722D7261646975733A696E6865726974';
wwv_flow_api.g_varchar2_table(210) := '3B666C6F61743A6C6566743B77696474683A313030253B746578742D616C69676E3A696E68657269747D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C617373';
wwv_flow_api.g_varchar2_table(211) := '2A3D222D627574746F6E73225D3E617B637572736F723A706F696E7465723B666F6E742D66616D696C793A696E686572697421696D706F7274616E743B2D7765626B69742D7472616E736974696F6E3A616C6C202E32357320656173652D696E2D6F7574';
wwv_flow_api.g_varchar2_table(212) := '3B2D6F2D7472616E736974696F6E3A616C6C202E32357320656173652D696E2D6F75743B7472616E736974696F6E3A616C6C202E32357320656173652D696E2D6F75743B666C6F61743A6C6566743B77696474683A3438253B70616464696E673A397078';
wwv_flow_api.g_varchar2_table(213) := '203570783B626F726465722D7261646975733A696E686572697421696D706F7274616E743B666F6E742D7765696768743A3530303B666F6E742D73697A653A313570783B6C696E652D6865696768743A312E343B636F6C6F723A236638663866383B7465';
wwv_flow_api.g_varchar2_table(214) := '78742D616C69676E3A696E68657269747D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D627574746F6E73225D3E612E636F6E6669726D2D62';
wwv_flow_api.g_varchar2_table(215) := '7574746F6E2D6F6B7B6D617267696E3A30203225203020303B6261636B67726F756E643A233332633638327D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C61';
wwv_flow_api.g_varchar2_table(216) := '73732A3D222D627574746F6E73225D3E612E636F6E6669726D2D627574746F6E2D63616E63656C7B6D617267696E3A30203020302032253B6261636B67726F756E643A236139613961397D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D';
wwv_flow_api.g_varchar2_table(217) := '3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D627574746F6E73225D3E612E66756C6C7B6D617267696E3A303B77696474683A313030257D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D3E';
wwv_flow_api.g_varchar2_table(218) := '6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D627574746F6E73225D3E613A686F7665727B626F782D736861646F773A696E7365742030202D3630707820357078202D357078207267626128302C302C302C2E';
wwv_flow_api.g_varchar2_table(219) := '3235297D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E72746C2D6F6E3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D627574746F6E73225D2C5B69645E3D4E6F7469666C6978436F6E66';
wwv_flow_api.g_varchar2_table(220) := '69726D577261705D2E72746C2D6F6E3E6469765B636C6173732A3D222D636F6E74656E74225D3E6469765B636C6173732A3D222D627574746F6E73225D3E617B2D7765626B69742D7472616E73666F726D3A726F746174655928313830646567293B7472';
wwv_flow_api.g_varchar2_table(221) := '616E73666F726D3A726F746174655928313830646567297D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E776974682D616E696D6174696F6E2E6E782D666164653E6469765B636C6173732A3D222D636F6E74656E74225D7B2D776562';
wwv_flow_api.g_varchar2_table(222) := '6B69742D616E696D6174696F6E3A636F6E6669726D2D616E696D6174696F6E2D66616465202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A636F6E6669726D2D616E696D6174696F6E2D66616465202E337320';
wwv_flow_api.g_varchar2_table(223) := '656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D657320636F6E6669726D2D616E696D6174696F6E2D666164657B30257B6F7061636974793A307D313030257B6F7061636974793A317D7D406B6579667261';
wwv_flow_api.g_varchar2_table(224) := '6D657320636F6E6669726D2D616E696D6174696F6E2D666164657B30257B6F7061636974793A307D313030257B6F7061636974793A317D7D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E776974682D616E696D6174696F6E2E6E782D';
wwv_flow_api.g_varchar2_table(225) := '7A6F6F6D3E6469765B636C6173732A3D222D636F6E74656E74225D7B2D7765626B69742D616E696D6174696F6E3A636F6E6669726D2D616E696D6174696F6E2D7A6F6F6D202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D61';
wwv_flow_api.g_varchar2_table(226) := '74696F6E3A636F6E6669726D2D616E696D6174696F6E2D7A6F6F6D202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D657320636F6E6669726D2D616E696D6174696F6E2D7A6F6F6D7B30257B6F';
wwv_flow_api.g_varchar2_table(227) := '7061636974793A303B2D7765626B69742D7472616E73666F726D3A7363616C65282E35293B7472616E73666F726D3A7363616C65282E35297D3530257B6F7061636974793A313B2D7765626B69742D7472616E73666F726D3A7363616C6528312E303529';
wwv_flow_api.g_varchar2_table(228) := '3B7472616E73666F726D3A7363616C6528312E3035297D313030257B6F7061636974793A313B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D7D406B65796672616D657320636F6E66';
wwv_flow_api.g_varchar2_table(229) := '69726D2D616E696D6174696F6E2D7A6F6F6D7B30257B6F7061636974793A303B2D7765626B69742D7472616E73666F726D3A7363616C65282E35293B7472616E73666F726D3A7363616C65282E35297D3530257B6F7061636974793A313B2D7765626B69';
wwv_flow_api.g_varchar2_table(230) := '742D7472616E73666F726D3A7363616C6528312E3035293B7472616E73666F726D3A7363616C6528312E3035297D313030257B6F7061636974793A313B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363';
wwv_flow_api.g_varchar2_table(231) := '616C652831297D7D5B69645E3D4E6F7469666C6978436F6E6669726D577261705D2E776974682D616E696D6174696F6E2E6E782D666164652E72656D6F76653E6469765B636C6173732A3D222D636F6E74656E74225D7B6F7061636974793A303B2D7765';
wwv_flow_api.g_varchar2_table(232) := '626B69742D616E696D6174696F6E3A636F6E6669726D2D616E696D6174696F6E2D666164652D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A636F6E6669726D2D616E696D6174696F6E2D66';
wwv_flow_api.g_varchar2_table(233) := '6164652D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D657320636F6E6669726D2D616E696D6174696F6E2D666164652D72656D6F76657B30257B6F7061636974793A317D31';
wwv_flow_api.g_varchar2_table(234) := '3030257B6F7061636974793A307D7D406B65796672616D657320636F6E6669726D2D616E696D6174696F6E2D666164652D72656D6F76657B30257B6F7061636974793A317D313030257B6F7061636974793A307D7D5B69645E3D4E6F7469666C6978436F';
wwv_flow_api.g_varchar2_table(235) := '6E6669726D577261705D2E776974682D616E696D6174696F6E2E6E782D7A6F6F6D2E72656D6F76653E6469765B636C6173732A3D222D636F6E74656E74225D7B6F7061636974793A303B2D7765626B69742D616E696D6174696F6E3A636F6E6669726D2D';
wwv_flow_api.g_varchar2_table(236) := '616E696D6174696F6E2D7A6F6F6D2D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A636F6E6669726D2D616E696D6174696F6E2D7A6F6F6D2D72656D6F7665202E337320656173652D696E2D';
wwv_flow_api.g_varchar2_table(237) := '6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D657320636F6E6669726D2D616E696D6174696F6E2D7A6F6F6D2D72656D6F76657B30257B6F7061636974793A313B2D7765626B69742D7472616E73666F726D3A7363616C6528';
wwv_flow_api.g_varchar2_table(238) := '31293B7472616E73666F726D3A7363616C652831297D3530257B6F7061636974793A2E353B2D7765626B69742D7472616E73666F726D3A7363616C6528312E3035293B7472616E73666F726D3A7363616C6528312E3035297D313030257B6F7061636974';
wwv_flow_api.g_varchar2_table(239) := '793A303B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D7D406B65796672616D657320636F6E6669726D2D616E696D6174696F6E2D7A6F6F6D2D72656D6F76657B30257B6F70616369';
wwv_flow_api.g_varchar2_table(240) := '74793A313B2D7765626B69742D7472616E73666F726D3A7363616C652831293B7472616E73666F726D3A7363616C652831297D3530257B6F7061636974793A2E353B2D7765626B69742D7472616E73666F726D3A7363616C6528312E3035293B7472616E';
wwv_flow_api.g_varchar2_table(241) := '73666F726D3A7363616C6528312E3035297D313030257B6F7061636974793A303B2D7765626B69742D7472616E73666F726D3A7363616C652830293B7472616E73666F726D3A7363616C652830297D7D5B69645E3D4E6F7469666C69784C6F6164696E67';
wwv_flow_api.g_varchar2_table(242) := '577261705D7B2D7765626B69742D757365722D73656C6563743A6E6F6E653B2D6D6F7A2D757365722D73656C6563743A6E6F6E653B2D6D732D757365722D73656C6563743A6E6F6E653B757365722D73656C6563743A6E6F6E653B706F736974696F6E3A';
wwv_flow_api.g_varchar2_table(243) := '66697865643B7A2D696E6465783A343030303B77696474683A313030253B6865696768743A313030253B6C6566743A303B746F703A303B72696768743A303B626F74746F6D3A303B6D617267696E3A6175746F3B646973706C61793A2D7765626B69742D';
wwv_flow_api.g_varchar2_table(244) := '626F783B646973706C61793A2D7765626B69742D666C65783B646973706C61793A2D6D732D666C6578626F783B646973706C61793A666C65783B2D7765626B69742D666C65782D777261703A777261703B2D6D732D666C65782D777261703A777261703B';
wwv_flow_api.g_varchar2_table(245) := '666C65782D777261703A777261703B2D7765626B69742D626F782D6F7269656E743A766572746963616C3B2D7765626B69742D626F782D646972656374696F6E3A6E6F726D616C3B2D7765626B69742D666C65782D646972656374696F6E3A636F6C756D';
wwv_flow_api.g_varchar2_table(246) := '6E3B2D6D732D666C65782D646972656374696F6E3A636F6C756D6E3B666C65782D646972656374696F6E3A636F6C756D6E3B2D7765626B69742D626F782D616C69676E3A63656E7465723B2D7765626B69742D616C69676E2D6974656D733A63656E7465';
wwv_flow_api.g_varchar2_table(247) := '723B2D6D732D666C65782D616C69676E3A63656E7465723B616C69676E2D6974656D733A63656E7465723B2D7765626B69742D626F782D7061636B3A63656E7465723B2D7765626B69742D6A7573746966792D636F6E74656E743A63656E7465723B2D6D';
wwv_flow_api.g_varchar2_table(248) := '732D666C65782D7061636B3A63656E7465723B6A7573746966792D636F6E74656E743A63656E7465723B746578742D616C69676E3A63656E7465723B2D7765626B69742D626F782D73697A696E673A626F726465722D626F783B626F782D73697A696E67';
wwv_flow_api.g_varchar2_table(249) := '3A626F726465722D626F783B6261636B67726F756E643A7267626128302C302C302C2E38293B666F6E742D66616D696C793A22517569636B73616E64222C2D6170706C652D73797374656D2C426C696E6B4D616353797374656D466F6E742C225365676F';
wwv_flow_api.g_varchar2_table(250) := '65205549222C526F626F746F2C2248656C766574696361204E657565222C417269616C2C73616E732D73657269667D5B69645E3D4E6F7469666C69784C6F6164696E67577261705D202A7B2D7765626B69742D626F782D73697A696E673A626F72646572';
wwv_flow_api.g_varchar2_table(251) := '2D626F783B626F782D73697A696E673A626F726465722D626F787D5B69645E3D4E6F7469666C69784C6F6164696E67577261705D2E636C69636B2D746F2D636C6F73657B637572736F723A706F696E7465727D5B69645E3D4E6F7469666C69784C6F6164';
wwv_flow_api.g_varchar2_table(252) := '696E67577261705D3E6469765B636C6173732A3D222D69636F6E225D7B77696474683A363070783B6865696768743A363070783B706F736974696F6E3A72656C61746976653B2D7765626B69742D7472616E736974696F6E3A746F70202E327320656173';
wwv_flow_api.g_varchar2_table(253) := '652D696E2D6F75743B2D6F2D7472616E736974696F6E3A746F70202E327320656173652D696E2D6F75743B7472616E736974696F6E3A746F70202E327320656173652D696E2D6F75743B6D617267696E3A30206175746F7D5B69645E3D4E6F7469666C69';
wwv_flow_api.g_varchar2_table(254) := '784C6F6164696E67577261705D3E6469765B636C6173732A3D222D69636F6E225D20696D672C5B69645E3D4E6F7469666C69784C6F6164696E67577261705D3E6469765B636C6173732A3D222D69636F6E225D207376677B6D61782D77696474683A756E';
wwv_flow_api.g_varchar2_table(255) := '7365743B6D61782D6865696768743A756E7365743B77696474683A313030253B6865696768743A313030253B706F736974696F6E3A6162736F6C7574653B6C6566743A303B746F703A307D5B69645E3D4E6F7469666C69784C6F6164696E67577261705D';
wwv_flow_api.g_varchar2_table(256) := '3E707B706F736974696F6E3A72656C61746976653B6D617267696E3A31307078206175746F20303B666F6E742D66616D696C793A696E686572697421696D706F7274616E743B666F6E742D7765696768743A6E6F726D616C3B666F6E742D73697A653A31';
wwv_flow_api.g_varchar2_table(257) := '3570783B6C696E652D6865696768743A312E343B70616464696E673A3020313070783B77696474683A313030253B746578742D616C69676E3A63656E7465727D5B69645E3D4E6F7469666C69784C6F6164696E67577261705D2E776974682D616E696D61';
wwv_flow_api.g_varchar2_table(258) := '74696F6E7B2D7765626B69742D616E696D6174696F6E3A6C6F6164696E672D616E696D6174696F6E2D66616465202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A6C6F6164696E672D616E696D6174696F6E2D';
wwv_flow_api.g_varchar2_table(259) := '66616465202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573206C6F6164696E672D616E696D6174696F6E2D666164657B30257B6F7061636974793A307D313030257B6F7061636974793A31';
wwv_flow_api.g_varchar2_table(260) := '7D7D406B65796672616D6573206C6F6164696E672D616E696D6174696F6E2D666164657B30257B6F7061636974793A307D313030257B6F7061636974793A317D7D5B69645E3D4E6F7469666C69784C6F6164696E67577261705D2E776974682D616E696D';
wwv_flow_api.g_varchar2_table(261) := '6174696F6E2E72656D6F76657B6F7061636974793A303B2D7765626B69742D616E696D6174696F6E3A6C6F6164696E672D616E696D6174696F6E2D666164652D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E69';
wwv_flow_api.g_varchar2_table(262) := '6D6174696F6E3A6C6F6164696E672D616E696D6174696F6E2D666164652D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573206C6F6164696E672D616E696D6174696F6E2D';
wwv_flow_api.g_varchar2_table(263) := '666164652D72656D6F76657B30257B6F7061636974793A317D313030257B6F7061636974793A307D7D406B65796672616D6573206C6F6164696E672D616E696D6174696F6E2D666164652D72656D6F76657B30257B6F7061636974793A317D313030257B';
wwv_flow_api.g_varchar2_table(264) := '6F7061636974793A307D7D5B69645E3D4E6F7469666C69784C6F6164696E67577261705D3E702E6E65777B2D7765626B69742D616E696D6174696F6E3A6C6F6164696E672D6E65772D6D6573736167652D66616465202E337320656173652D696E2D6F75';
wwv_flow_api.g_varchar2_table(265) := '74203073206E6F726D616C3B616E696D6174696F6E3A6C6F6164696E672D6E65772D6D6573736167652D66616465202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D6573206C6F6164696E672D';
wwv_flow_api.g_varchar2_table(266) := '6E65772D6D6573736167652D666164657B30257B6F7061636974793A307D313030257B6F7061636974793A317D7D406B65796672616D6573206C6F6164696E672D6E65772D6D6573736167652D666164657B30257B6F7061636974793A307D313030257B';
wwv_flow_api.g_varchar2_table(267) := '6F7061636974793A317D7D5B69645E3D4E6F7469666C6978426C6F636B577261705D7B2D7765626B69742D757365722D73656C6563743A6E6F6E653B2D6D6F7A2D757365722D73656C6563743A6E6F6E653B2D6D732D757365722D73656C6563743A6E6F';
wwv_flow_api.g_varchar2_table(268) := '6E653B757365722D73656C6563743A6E6F6E653B2D7765626B69742D626F782D73697A696E673A626F726465722D626F783B626F782D73697A696E673A626F726465722D626F783B706F736974696F6E3A6162736F6C7574653B7A2D696E6465783A3130';
wwv_flow_api.g_varchar2_table(269) := '30303B666F6E742D66616D696C793A22517569636B73616E64222C2D6170706C652D73797374656D2C426C696E6B4D616353797374656D466F6E742C225365676F65205549222C526F626F746F2C2248656C766574696361204E657565222C417269616C';
wwv_flow_api.g_varchar2_table(270) := '2C73616E732D73657269663B6261636B67726F756E643A72676261283235352C3235352C3235352C2E39293B746578742D616C69676E3A63656E7465723B616E696D6174696F6E2D6475726174696F6E3A2E34733B77696474683A313030253B68656967';
wwv_flow_api.g_varchar2_table(271) := '68743A313030253B6C6566743A303B746F703A303B626F726465722D7261646975733A696E68657269743B646973706C61793A2D7765626B69742D626F783B646973706C61793A2D7765626B69742D666C65783B646973706C61793A2D6D732D666C6578';
wwv_flow_api.g_varchar2_table(272) := '626F783B646973706C61793A666C65783B2D7765626B69742D666C65782D777261703A777261703B2D6D732D666C65782D777261703A777261703B666C65782D777261703A777261703B2D7765626B69742D626F782D6F7269656E743A76657274696361';
wwv_flow_api.g_varchar2_table(273) := '6C3B2D7765626B69742D626F782D646972656374696F6E3A6E6F726D616C3B2D7765626B69742D666C65782D646972656374696F6E3A636F6C756D6E3B2D6D732D666C65782D646972656374696F6E3A636F6C756D6E3B666C65782D646972656374696F';
wwv_flow_api.g_varchar2_table(274) := '6E3A636F6C756D6E3B2D7765626B69742D626F782D616C69676E3A63656E7465723B2D7765626B69742D616C69676E2D6974656D733A63656E7465723B2D6D732D666C65782D616C69676E3A63656E7465723B616C69676E2D6974656D733A63656E7465';
wwv_flow_api.g_varchar2_table(275) := '723B2D7765626B69742D626F782D7061636B3A63656E7465723B2D7765626B69742D6A7573746966792D636F6E74656E743A63656E7465723B2D6D732D666C65782D7061636B3A63656E7465723B6A7573746966792D636F6E74656E743A63656E746572';
wwv_flow_api.g_varchar2_table(276) := '7D5B69645E3D4E6F7469666C6978426C6F636B577261705D202A7B2D7765626B69742D626F782D73697A696E673A626F726465722D626F783B626F782D73697A696E673A626F726465722D626F787D5B69645E3D4E6F7469666C6978426C6F636B577261';
wwv_flow_api.g_varchar2_table(277) := '705D3E7370616E5B636C6173732A3D222D69636F6E225D7B646973706C61793A626C6F636B3B77696474683A343570783B6865696768743A343570783B706F736974696F6E3A72656C61746976653B6D617267696E3A30206175746F7D5B69645E3D4E6F';
wwv_flow_api.g_varchar2_table(278) := '7469666C6978426C6F636B577261705D3E7370616E5B636C6173732A3D222D69636F6E225D207376677B77696474683A696E68657269743B6865696768743A696E68657269747D5B69645E3D4E6F7469666C6978426C6F636B577261705D3E7370616E5B';
wwv_flow_api.g_varchar2_table(279) := '636C6173732A3D222D6D657373616765225D7B706F736974696F6E3A72656C61746976653B646973706C61793A626C6F636B3B77696474683A313030253B6D617267696E3A31307078206175746F20303B70616464696E673A3020313070783B666F6E74';
wwv_flow_api.g_varchar2_table(280) := '2D66616D696C793A696E686572697421696D706F7274616E743B666F6E742D7765696768743A6E6F726D616C3B666F6E742D73697A653A313470783B6C696E652D6865696768743A312E347D5B69645E3D4E6F7469666C6978426C6F636B577261705D2E';
wwv_flow_api.g_varchar2_table(281) := '776974682D616E696D6174696F6E7B2D7765626B69742D616E696D6174696F6E3A626C6F636B2D616E696D6174696F6E2D66616465202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D6174696F6E3A626C6F636B2D616E696D';
wwv_flow_api.g_varchar2_table(282) := '6174696F6E2D66616465202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D657320626C6F636B2D616E696D6174696F6E2D666164657B30257B6F7061636974793A307D313030257B6F70616369';
wwv_flow_api.g_varchar2_table(283) := '74793A317D7D406B65796672616D657320626C6F636B2D616E696D6174696F6E2D666164657B30257B6F7061636974793A307D313030257B6F7061636974793A317D7D5B69645E3D4E6F7469666C6978426C6F636B577261705D2E776974682D616E696D';
wwv_flow_api.g_varchar2_table(284) := '6174696F6E2E72656D6F76657B6F7061636974793A303B2D7765626B69742D616E696D6174696F6E3A626C6F636B2D616E696D6174696F6E2D666164652D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C3B616E696D61';
wwv_flow_api.g_varchar2_table(285) := '74696F6E3A626C6F636B2D616E696D6174696F6E2D666164652D72656D6F7665202E337320656173652D696E2D6F7574203073206E6F726D616C7D402D7765626B69742D6B65796672616D657320626C6F636B2D616E696D6174696F6E2D666164652D72';
wwv_flow_api.g_varchar2_table(286) := '656D6F76657B30257B6F7061636974793A317D313030257B6F7061636974793A307D7D406B65796672616D657320626C6F636B2D616E696D6174696F6E2D666164652D72656D6F76657B30257B6F7061636974793A317D313030257B6F7061636974793A';
wwv_flow_api.g_varchar2_table(287) := '307D7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(30108108250445363871)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_file_name=>'notiflix-2.7.0.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2A204E6F7469666C6978202868747470733A2F2F7777772E6E6F7469666C69782E636F6D29202D2056657273696F6E3A20322E372E30202D20417574686F723A204675726B616E204D54202868747470733A2F2F6769746875622E636F6D2F66757263';
wwv_flow_api.g_varchar2_table(2) := '616E29202D20436F707972696768742032303230204E6F7469666C69782C204D4954204C6963656E6365202868747470733A2F2F6F70656E736F757263652E6F72672F6C6963656E7365732F4D495429202A2F0A0A2866756E6374696F6E28742C65297B';
wwv_flow_api.g_varchar2_table(3) := '2266756E6374696F6E223D3D747970656F6620646566696E652626646566696E652E616D643F646566696E65285B5D2C66756E6374696F6E28297B72657475726E20652874297D293A226F626A656374223D3D747970656F66206D6F64756C652626226F';
wwv_flow_api.g_varchar2_table(4) := '626A656374223D3D747970656F66206D6F64756C652E6578706F7274733F6D6F64756C652E6578706F7274733D652874293A742E4E6F7469666C69783D652874297D292822756E646566696E6564223D3D747970656F6620676C6F62616C3F22756E6465';
wwv_flow_api.g_varchar2_table(5) := '66696E6564223D3D747970656F662077696E646F773F746869733A77696E646F773A676C6F62616C2C66756E6374696F6E2874297B2775736520737472696374273B69662822756E646566696E6564223D3D747970656F662074262622756E646566696E';
wwv_flow_api.g_varchar2_table(6) := '6564223D3D747970656F6620742E646F63756D656E742972657475726E21313B76617220652C612C6E2C692C6F2C733D225C6E5C6E566973697420646F63756D656E746174696F6E207061676520746F206C6561726E206D6F72653A2068747470733A2F';
wwv_flow_api.g_varchar2_table(7) := '2F7777772E6E6F7469666C69782E636F6D2F646F63756D656E746174696F6E222C723D222D6170706C652D73797374656D2C20426C696E6B4D616353797374656D466F6E742C205C225365676F652055495C222C20526F626F746F2C205C2248656C7665';
wwv_flow_api.g_varchar2_table(8) := '74696361204E6575655C222C20417269616C2C205C224E6F746F2053616E735C222C2073616E732D73657269662C205C224170706C6520436F6C6F7220456D6F6A695C222C205C225365676F6520554920456D6F6A695C222C205C225365676F65205549';
wwv_flow_api.g_varchar2_table(9) := '2053796D626F6C5C222C205C224E6F746F20436F6C6F7220456D6F6A695C22222C6C3D7B7772617049443A224E6F7469666C69784E6F7469667957726170222C77696474683A223238307078222C706F736974696F6E3A2272696768742D746F70222C64';
wwv_flow_api.g_varchar2_table(10) := '697374616E63653A2231307078222C6F7061636974793A312C626F726465725261646975733A22357078222C72746C3A21312C74696D656F75743A3365332C6D6573736167654D61784C656E6774683A3131302C6261636B4F7665726C61793A21312C62';
wwv_flow_api.g_varchar2_table(11) := '61636B4F7665726C6179436F6C6F723A227267626128302C302C302C302E3529222C706C61696E546578743A21302C73686F774F6E6C795468654C6173744F6E653A21312C636C69636B546F436C6F73653A21312C70617573654F6E486F7665723A2130';
wwv_flow_api.g_varchar2_table(12) := '2C49443A224E6F7469666C69784E6F74696679222C636C6173734E616D653A226E6F7469666C69782D6E6F74696679222C7A696E6465783A343030312C757365476F6F676C65466F6E743A21312C666F6E7446616D696C793A22517569636B73616E6422';
wwv_flow_api.g_varchar2_table(13) := '2C666F6E7453697A653A2231337078222C637373416E696D6174696F6E3A21302C637373416E696D6174696F6E4475726174696F6E3A3430302C637373416E696D6174696F6E5374796C653A2266616465222C636C6F7365427574746F6E3A21312C7573';
wwv_flow_api.g_varchar2_table(14) := '6549636F6E3A21302C757365466F6E74417765736F6D653A21312C666F6E74417765736F6D6549636F6E5374796C653A226261736963222C666F6E74417765736F6D6549636F6E53697A653A2233347078222C737563636573733A7B6261636B67726F75';
wwv_flow_api.g_varchar2_table(15) := '6E643A2223333263363832222C74657874436F6C6F723A2223666666222C6368696C64436C6173734E616D653A2273756363657373222C6E6F7469666C697849636F6E436F6C6F723A227267626128302C302C302C302E3229222C666F6E74417765736F';
wwv_flow_api.g_varchar2_table(16) := '6D65436C6173734E616D653A226661732066612D636865636B2D636972636C65222C666F6E74417765736F6D6549636F6E436F6C6F723A227267626128302C302C302C302E3229222C6261636B4F7665726C6179436F6C6F723A22726762612835302C31';
wwv_flow_api.g_varchar2_table(17) := '39382C3133302C302E3229227D2C6661696C7572653A7B6261636B67726F756E643A2223666635353439222C74657874436F6C6F723A2223666666222C6368696C64436C6173734E616D653A226661696C757265222C6E6F7469666C697849636F6E436F';
wwv_flow_api.g_varchar2_table(18) := '6C6F723A227267626128302C302C302C302E3229222C666F6E74417765736F6D65436C6173734E616D653A226661732066612D74696D65732D636972636C65222C666F6E74417765736F6D6549636F6E436F6C6F723A227267626128302C302C302C302E';
wwv_flow_api.g_varchar2_table(19) := '3229222C6261636B4F7665726C6179436F6C6F723A2272676261283235352C38352C37332C302E3229227D2C7761726E696E673A7B6261636B67726F756E643A2223656562663331222C74657874436F6C6F723A2223666666222C6368696C64436C6173';
wwv_flow_api.g_varchar2_table(20) := '734E616D653A227761726E696E67222C6E6F7469666C697849636F6E436F6C6F723A227267626128302C302C302C302E3229222C666F6E74417765736F6D65436C6173734E616D653A226661732066612D6578636C616D6174696F6E2D636972636C6522';
wwv_flow_api.g_varchar2_table(21) := '2C666F6E74417765736F6D6549636F6E436F6C6F723A227267626128302C302C302C302E3229222C6261636B4F7665726C6179436F6C6F723A2272676261283233382C3139312C34392C302E3229227D2C696E666F3A7B6261636B67726F756E643A2223';
wwv_flow_api.g_varchar2_table(22) := '323663306433222C74657874436F6C6F723A2223666666222C6368696C64436C6173734E616D653A22696E666F222C6E6F7469666C697849636F6E436F6C6F723A227267626128302C302C302C302E3229222C666F6E74417765736F6D65436C6173734E';
wwv_flow_api.g_varchar2_table(23) := '616D653A226661732066612D696E666F2D636972636C65222C666F6E74417765736F6D6549636F6E436F6C6F723A227267626128302C302C302C302E3229222C6261636B4F7665726C6179436F6C6F723A22726762612833382C3139322C3231312C302E';
wwv_flow_api.g_varchar2_table(24) := '3229227D7D2C633D7B49443A224E6F7469666C69785265706F727457726170222C636C6173734E616D653A226E6F7469666C69782D7265706F7274222C77696474683A223332307078222C6261636B67726F756E64436F6C6F723A222366386638663822';
wwv_flow_api.g_varchar2_table(25) := '2C626F726465725261646975733A2232357078222C72746C3A21312C7A696E6465783A343030322C6261636B4F7665726C61793A21302C6261636B4F7665726C6179436F6C6F723A227267626128302C302C302C302E3529222C757365476F6F676C6546';
wwv_flow_api.g_varchar2_table(26) := '6F6E743A21312C666F6E7446616D696C793A22517569636B73616E64222C73766753697A653A223131307078222C706C61696E546578743A21302C7469746C65466F6E7453697A653A2231367078222C7469746C654D61784C656E6774683A33342C6D65';
wwv_flow_api.g_varchar2_table(27) := '7373616765466F6E7453697A653A2231337078222C6D6573736167654D61784C656E6774683A3430302C627574746F6E466F6E7453697A653A2231347078222C627574746F6E4D61784C656E6774683A33342C637373416E696D6174696F6E3A21302C63';
wwv_flow_api.g_varchar2_table(28) := '7373416E696D6174696F6E4475726174696F6E3A3336302C637373416E696D6174696F6E5374796C653A2266616465222C737563636573733A7B737667436F6C6F723A2223333263363832222C7469746C65436F6C6F723A2223316531653165222C6D65';
wwv_flow_api.g_varchar2_table(29) := '7373616765436F6C6F723A2223323432343234222C627574746F6E4261636B67726F756E643A2223333263363832222C627574746F6E436F6C6F723A2223666666222C6261636B4F7665726C6179436F6C6F723A22726762612835302C3139382C313330';
wwv_flow_api.g_varchar2_table(30) := '2C302E3229227D2C6661696C7572653A7B737667436F6C6F723A2223666635353439222C7469746C65436F6C6F723A2223316531653165222C6D657373616765436F6C6F723A2223323432343234222C627574746F6E4261636B67726F756E643A222366';
wwv_flow_api.g_varchar2_table(31) := '6635353439222C627574746F6E436F6C6F723A2223666666222C6261636B4F7665726C6179436F6C6F723A2272676261283235352C38352C37332C302E3229227D2C7761726E696E673A7B737667436F6C6F723A2223656562663331222C7469746C6543';
wwv_flow_api.g_varchar2_table(32) := '6F6C6F723A2223316531653165222C6D657373616765436F6C6F723A2223323432343234222C627574746F6E4261636B67726F756E643A2223656562663331222C627574746F6E436F6C6F723A2223666666222C6261636B4F7665726C6179436F6C6F72';
wwv_flow_api.g_varchar2_table(33) := '3A2272676261283233382C3139312C34392C302E3229227D2C696E666F3A7B737667436F6C6F723A2223323663306433222C7469746C65436F6C6F723A2223316531653165222C6D657373616765436F6C6F723A2223323432343234222C627574746F6E';
wwv_flow_api.g_varchar2_table(34) := '4261636B67726F756E643A2223323663306433222C627574746F6E436F6C6F723A2223666666222C6261636B4F7665726C6179436F6C6F723A22726762612833382C3139322C3231312C302E3229227D7D2C6D3D7B49443A224E6F7469666C6978436F6E';
wwv_flow_api.g_varchar2_table(35) := '6669726D57726170222C636C6173734E616D653A226E6F7469666C69782D636F6E6669726D222C77696474683A223330307078222C7A696E6465783A343030332C706F736974696F6E3A2263656E746572222C64697374616E63653A2231307078222C62';
wwv_flow_api.g_varchar2_table(36) := '61636B67726F756E64436F6C6F723A2223663866386638222C626F726465725261646975733A2232357078222C6261636B4F7665726C61793A21302C6261636B4F7665726C6179436F6C6F723A227267626128302C302C302C302E3529222C72746C3A21';
wwv_flow_api.g_varchar2_table(37) := '312C757365476F6F676C65466F6E743A21312C666F6E7446616D696C793A22517569636B73616E64222C637373416E696D6174696F6E3A21302C637373416E696D6174696F6E5374796C653A2266616465222C637373416E696D6174696F6E4475726174';
wwv_flow_api.g_varchar2_table(38) := '696F6E3A3330302C706C61696E546578743A21302C7469746C65436F6C6F723A2223333263363832222C7469746C65466F6E7453697A653A2231367078222C7469746C654D61784C656E6774683A33342C6D657373616765436F6C6F723A222331653165';
wwv_flow_api.g_varchar2_table(39) := '3165222C6D657373616765466F6E7453697A653A2231347078222C6D6573736167654D61784C656E6774683A3131302C627574746F6E73466F6E7453697A653A2231357078222C627574746F6E734D61784C656E6774683A33342C6F6B427574746F6E43';
wwv_flow_api.g_varchar2_table(40) := '6F6C6F723A2223663866386638222C6F6B427574746F6E4261636B67726F756E643A2223333263363832222C63616E63656C427574746F6E436F6C6F723A2223663866386638222C63616E63656C427574746F6E4261636B67726F756E643A2223613961';
wwv_flow_api.g_varchar2_table(41) := '396139227D2C703D7B49443A224E6F7469666C69784C6F6164696E6757726170222C636C6173734E616D653A226E6F7469666C69782D6C6F6164696E67222C7A696E6465783A3465332C6261636B67726F756E64436F6C6F723A227267626128302C302C';
wwv_flow_api.g_varchar2_table(42) := '302C302E3829222C72746C3A21312C757365476F6F676C65466F6E743A21312C666F6E7446616D696C793A22517569636B73616E64222C637373416E696D6174696F6E3A21302C637373416E696D6174696F6E4475726174696F6E3A3430302C636C6963';
wwv_flow_api.g_varchar2_table(43) := '6B546F436C6F73653A21312C637573746F6D53766755726C3A6E756C6C2C73766753697A653A2238307078222C737667436F6C6F723A2223333263363832222C6D65737361676549443A224E6F7469666C69784C6F6164696E674D657373616765222C6D';
wwv_flow_api.g_varchar2_table(44) := '657373616765466F6E7453697A653A2231357078222C6D6573736167654D61784C656E6774683A33342C6D657373616765436F6C6F723A2223646364636463227D2C643D7B49443A224E6F7469666C6978426C6F636B57726170222C717565727953656C';
wwv_flow_api.g_varchar2_table(45) := '6563746F724C696D69743A3230302C636C6173734E616D653A226E6F7469666C69782D626C6F636B222C706F736974696F6E3A226162736F6C757465222C7A696E6465783A3165332C6261636B67726F756E64436F6C6F723A2272676261283235352C32';
wwv_flow_api.g_varchar2_table(46) := '35352C3235352C302E3929222C72746C3A21312C757365476F6F676C65466F6E743A21312C666F6E7446616D696C793A22517569636B73616E64222C637373416E696D6174696F6E3A21302C637373416E696D6174696F6E4475726174696F6E3A333030';
wwv_flow_api.g_varchar2_table(47) := '2C73766753697A653A2234357078222C737667436F6C6F723A2223333833383338222C6D657373616765466F6E7453697A653A2231347078222C6D6573736167654D61784C656E6774683A33342C6D657373616765436F6C6F723A222333383338333822';
wwv_flow_api.g_varchar2_table(48) := '7D2C673D66756E6374696F6E28742C65297B72657475726E20636F6E736F6C652E6572726F722822256320222B742B2220222C2270616464696E673A3270783B626F726465722D7261646975733A323070783B636F6C6F723A236666663B6261636B6772';
wwv_flow_api.g_varchar2_table(49) := '6F756E643A23666635353439222C225C6E222B652B73297D2C663D66756E6374696F6E28742C65297B72657475726E20636F6E736F6C652E6C6F672822256320222B742B2220222C2270616464696E673A3270783B626F726465722D7261646975733A32';
wwv_flow_api.g_varchar2_table(50) := '3070783B636F6C6F723A236666663B6261636B67726F756E643A23323663306433222C225C6E222B652B73297D2C783D66756E6374696F6E2865297B72657475726E20657C7C28653D226865616422292C6E756C6C213D3D742E646F63756D656E745B65';
wwv_flow_api.g_varchar2_table(51) := '5D7C7C286728224E6F7469666C6978222C225C6E4E6F7469666C6978206E6565647320746F20626520617070656E64656420746F20746865205C223C222B652B223E5C2220656C656D656E742C2062757420796F752063616C6C6564206974206265666F';
wwv_flow_api.g_varchar2_table(52) := '726520746865205C223C222B652B223E5C2220656C656D656E7420686173206265656E20637265617465642E22292C2131297D2C753D66756E6374696F6E28297B72657475726E206E756C6C7D2C623D66756E6374696F6E28297B6966286E756C6C213D';
wwv_flow_api.g_varchar2_table(53) := '3D752829262621742E646F63756D656E742E676574456C656D656E744279496428224E6F7469666C6978496E7465726E616C4353532229297B696628217828226865616422292972657475726E21313B76617220653D742E646F63756D656E742E637265';
wwv_flow_api.g_varchar2_table(54) := '617465456C656D656E7428227374796C6522293B652E69643D224E6F7469666C6978496E7465726E616C435353222C652E696E6E657248544D4C3D7528292C742E646F63756D656E742E686561642E617070656E644368696C642865297D7D2C793D6675';
wwv_flow_api.g_varchar2_table(55) := '6E6374696F6E28297B76617220743D7B7D2C653D21312C613D303B225B6F626A65637420426F6F6C65616E5D223D3D3D4F626A6563742E70726F746F747970652E746F537472696E672E63616C6C28617267756D656E74735B305D29262628653D617267';
wwv_flow_api.g_varchar2_table(56) := '756D656E74735B305D2C612B2B293B666F7228766172206E3D66756E6374696F6E2861297B666F7228766172206E20696E2061294F626A6563742E70726F746F747970652E6861734F776E50726F70657274792E63616C6C28612C6E29262628745B6E5D';
wwv_flow_api.g_varchar2_table(57) := '3D652626225B6F626A656374204F626A6563745D223D3D3D4F626A6563742E70726F746F747970652E746F537472696E672E63616C6C28615B6E5D293F7928745B6E5D2C615B6E5D293A615B6E5D297D3B613C617267756D656E74732E6C656E6774683B';
wwv_flow_api.g_varchar2_table(58) := '612B2B296E28617267756D656E74735B615D293B72657475726E20747D2C683D66756E6374696F6E2865297B76617220613D742E646F63756D656E742E637265617465456C656D656E74282264697622293B72657475726E20612E696E6E657248544D4C';
wwv_flow_api.g_varchar2_table(59) := '3D652C612E74657874436F6E74656E747C7C612E696E6E6572546578747C7C22227D2C6B3D66756E6374696F6E28652C61297B69662821742E646F63756D656E742E676574456C656D656E744279496428224E6F7469666C6978517569636B73616E6422';
wwv_flow_api.g_varchar2_table(60) := '29262665262622737472696E67223D3D747970656F662061262622717569636B73616E64223D3D3D612E746F4C6F63616C654C6F776572436173652822656E2229297B696628217828226865616422292972657475726E21313B766172206E3D742E646F';
wwv_flow_api.g_varchar2_table(61) := '63756D656E742E63726561746552616E676528293B6E2E73656C6563744E6F646528742E646F63756D656E742E68656164293B76617220693D6E2E637265617465436F6E7465787475616C467261676D656E7428223C6C696E6B2069643D5C224E6F7469';
wwv_flow_api.g_varchar2_table(62) := '666C6978476F6F676C65444E535C222072656C3D5C22646E732D70726566657463685C2220687265663D5C222F2F666F6E74732E676F6F676C65617069732E636F6D5C22202F3E22293B742E646F63756D656E742E686561642E617070656E644368696C';
wwv_flow_api.g_varchar2_table(63) := '642869293B766172206F3D742E646F63756D656E742E63726561746552616E676528293B6F2E73656C6563744E6F646528742E646F63756D656E742E68656164293B76617220733D6F2E637265617465436F6E7465787475616C467261676D656E742822';
wwv_flow_api.g_varchar2_table(64) := '3C6C696E6B2069643D5C224E6F7469666C6978517569636B73616E645C2220687265663D5C2268747470733A2F2F666F6E74732E676F6F676C65617069732E636F6D2F6373733F66616D696C793D517569636B73616E643A3330302C3430302C3530302C';
wwv_flow_api.g_varchar2_table(65) := '37303026616D703B7375627365743D6C6174696E2D6578745C222072656C3D5C227374796C6573686565745C22202F3E22293B742E646F63756D656E742E686561642E617070656E644368696C642873297D7D2C773D66756E6374696F6E28742C65297B';
wwv_flow_api.g_varchar2_table(66) := '747C7C28743D22313130707822292C657C7C28653D222333326336383222293B76617220613D223C73766720786D6C6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C222069643D5C224E585265706F7274537563636573';
wwv_flow_api.g_varchar2_table(67) := '735C222077696474683D5C22222B742B225C22206865696768743D5C22222B742B225C222066696C6C3D5C22222B652B225C222066696C6C2D72756C653D5C226576656E6F64645C2220636C69702D72756C653D5C226576656E6F64645C2220696D6167';
wwv_flow_api.g_varchar2_table(68) := '652D72656E646572696E673D5C226F7074696D697A655175616C6974795C222073686170652D72656E646572696E673D5C2267656F6D6574726963507265636973696F6E5C2220746578742D72656E646572696E673D5C2267656F6D6574726963507265';
wwv_flow_api.g_varchar2_table(69) := '636973696F6E5C222076657273696F6E3D5C22312E315C222076696577426F783D5C2230203020313230203132305C2220786D6C3A73706163653D5C2270726573657276655C223E3C7374796C653E402D7765626B69742D6B65796672616D6573204E58';
wwv_flow_api.g_varchar2_table(70) := '5265706F727453756363657373352D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C35372E37707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D35';
wwv_flow_api.g_varchar2_table(71) := '372E377078293B7472616E73666F726D3A7472616E736C61746528363070782C35372E37707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D35372E377078297D3530252C746F7B2D7765626B69742D7472616E73666F';
wwv_flow_api.g_varchar2_table(72) := '726D3A7472616E736C61746528363070782C35372E37707829207363616C6528312C3129207472616E736C617465282D363070782C2D35372E377078293B7472616E73666F726D3A7472616E736C61746528363070782C35372E37707829207363616C65';
wwv_flow_api.g_varchar2_table(73) := '28312C3129207472616E736C617465282D363070782C2D35372E377078297D3630257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C35372E37707829207363616C65282E39352C2E393529207472616E736C617465';
wwv_flow_api.g_varchar2_table(74) := '282D363070782C2D35372E377078293B7472616E73666F726D3A7472616E736C61746528363070782C35372E37707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D35372E377078297D7D406B65796672616D6573';
wwv_flow_api.g_varchar2_table(75) := '204E585265706F727453756363657373352D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C35372E37707829207363616C65282E352C2E3529207472616E736C617465282D36307078';
wwv_flow_api.g_varchar2_table(76) := '2C2D35372E377078293B7472616E73666F726D3A7472616E736C61746528363070782C35372E37707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D35372E377078297D3530252C746F7B2D7765626B69742D7472616E';
wwv_flow_api.g_varchar2_table(77) := '73666F726D3A7472616E736C61746528363070782C35372E37707829207363616C6528312C3129207472616E736C617465282D363070782C2D35372E377078293B7472616E73666F726D3A7472616E736C61746528363070782C35372E37707829207363';
wwv_flow_api.g_varchar2_table(78) := '616C6528312C3129207472616E736C617465282D363070782C2D35372E377078297D3630257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C35372E37707829207363616C65282E39352C2E393529207472616E736C';
wwv_flow_api.g_varchar2_table(79) := '617465282D363070782C2D35372E377078293B7472616E73666F726D3A7472616E736C61746528363070782C35372E37707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D35372E377078297D7D402D7765626B69';
wwv_flow_api.g_varchar2_table(80) := '742D6B65796672616D6573204E585265706F727453756363657373362D616E696D6174696F6E7B30257B6F7061636974793A307D3530252C746F7B6F7061636974793A317D7D406B65796672616D6573204E585265706F727453756363657373362D616E';
wwv_flow_api.g_varchar2_table(81) := '696D6174696F6E7B30257B6F7061636974793A307D3530252C746F7B6F7061636974793A317D7D402D7765626B69742D6B65796672616D6573204E585265706F727453756363657373342D616E696D6174696F6E7B30257B6F7061636974793A307D3430';
wwv_flow_api.g_varchar2_table(82) := '252C746F7B6F7061636974793A317D7D406B65796672616D6573204E585265706F727453756363657373342D616E696D6174696F6E7B30257B6F7061636974793A307D3430252C746F7B6F7061636974793A317D7D402D7765626B69742D6B6579667261';
wwv_flow_api.g_varchar2_table(83) := '6D6573204E585265706F727453756363657373332D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070';
wwv_flow_api.g_varchar2_table(84) := '782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078297D3430252C746F7B2D7765626B69742D7472616E73666F726D';
wwv_flow_api.g_varchar2_table(85) := '3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472';
wwv_flow_api.g_varchar2_table(86) := '616E736C617465282D363070782C2D36307078297D3630257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078';
wwv_flow_api.g_varchar2_table(87) := '293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078297D7D406B65796672616D6573204E585265706F727453756363657373332D';
wwv_flow_api.g_varchar2_table(88) := '616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472';
wwv_flow_api.g_varchar2_table(89) := '616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078297D3430252C746F7B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829';
wwv_flow_api.g_varchar2_table(90) := '207363616C6528312C3129207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078297D';
wwv_flow_api.g_varchar2_table(91) := '3630257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C617465';
wwv_flow_api.g_varchar2_table(92) := '28363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078297D7D234E585265706F727453756363657373202A7B2D7765626B69742D616E696D6174696F6E2D6475726174696F6E3A312E32';
wwv_flow_api.g_varchar2_table(93) := '733B616E696D6174696F6E2D6475726174696F6E3A312E32733B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A69657228302C302C312C31293B616E696D6174696F6E2D74696D696E672D66';
wwv_flow_api.g_varchar2_table(94) := '756E6374696F6E3A63756269632D62657A69657228302C302C312C31297D3C2F7374796C653E3C672069643D5C224E585265706F727453756363657373315C223E3C672069643D5C224E585265706F727453756363657373325C223E3C67207374796C65';
wwv_flow_api.g_varchar2_table(95) := '3D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F727453756363657373332D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E585265706F727453756363657373332D616E696D6174696F6E3B2D7765626B';
wwv_flow_api.g_varchar2_table(96) := '69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078293B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F';
wwv_flow_api.g_varchar2_table(97) := '6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31295C223E3C7061746820643D5C224D3630203131352E';
wwv_flow_api.g_varchar2_table(98) := '33384332392E3436203131352E333820342E36322039302E353420342E363220363020342E36322032392E34362032392E343620342E363220363020342E36326333302E353420302035352E33382032342E38342035352E33382035352E333820302033';
wwv_flow_api.g_varchar2_table(99) := '302E35342D32342E38342035352E33382D35352E33382035352E33387A4D363020304332362E3932203020302032362E393220302036307332362E39322036302036302036302036302D32362E39322036302D36305339332E3038203020363020307A5C';
wwv_flow_api.g_varchar2_table(100) := '22207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F727453756363657373342D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E585265706F727453756363657373342D616E696D6174696F';
wwv_flow_api.g_varchar2_table(101) := '6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572';
wwv_flow_api.g_varchar2_table(102) := '282E34322C302C2E35382C31295C222066696C6C3D5C22696E68657269745C2220646174612D616E696D61746F722D67726F75703D5C22747275655C2220646174612D616E696D61746F722D747970653D5C22325C222F3E3C2F673E3C67207374796C65';
wwv_flow_api.g_varchar2_table(103) := '3D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F727453756363657373352D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E585265706F727453756363657373352D616E696D6174696F6E3B2D7765626B';
wwv_flow_api.g_varchar2_table(104) := '69742D7472616E73666F726D3A7472616E736C61746528363070782C35372E37707829207363616C6528312C3129207472616E736C617465282D363070782C2D35372E377078293B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E';
wwv_flow_api.g_varchar2_table(105) := '6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31295C223E3C7061746820643D5C224D38382E';
wwv_flow_api.g_varchar2_table(106) := '32372033352E33394C35322E382037352E32392033312E34332035382E32632D2E39382D2E38312D322E34342D2E36332D332E32342E33362D2E37392E39392D2E363320322E34342E333620332E32346C32332E30382031382E3436632E34332E33342E';
wwv_flow_api.g_varchar2_table(107) := '39332E353120312E34342E35312E3634203020312E32372D2E323620312E37342D2E37386C33362E39312D34312E353361322E3320322E332030203020302D2E31392D332E3236632D2E39352D2E38362D322E34312D2E37372D332E32362E31397A5C22';
wwv_flow_api.g_varchar2_table(108) := '207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F727453756363657373362D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E585265706F727453756363657373362D616E696D6174696F6E';
wwv_flow_api.g_varchar2_table(109) := '3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A69657228';
wwv_flow_api.g_varchar2_table(110) := '2E34322C302C2E35382C31295C222066696C6C3D5C22696E68657269745C2220646174612D616E696D61746F722D67726F75703D5C22747275655C2220646174612D616E696D61746F722D747970653D5C22325C222F3E3C2F673E3C2F673E3C2F673E3C';
wwv_flow_api.g_varchar2_table(111) := '2F7376673E223B72657475726E20617D2C763D66756E6374696F6E28742C65297B747C7C28743D22313130707822292C657C7C28653D222366663535343922293B76617220613D223C73766720786D6C6E733D5C22687474703A2F2F7777772E77332E6F';
wwv_flow_api.g_varchar2_table(112) := '72672F323030302F7376675C222069643D5C224E585265706F72744661696C7572655C222077696474683D5C22222B742B225C22206865696768743D5C22222B742B225C222066696C6C3D5C22222B652B225C222066696C6C2D72756C653D5C22657665';
wwv_flow_api.g_varchar2_table(113) := '6E6F64645C2220636C69702D72756C653D5C226576656E6F64645C2220696D6167652D72656E646572696E673D5C226F7074696D697A655175616C6974795C222073686170652D72656E646572696E673D5C2267656F6D6574726963507265636973696F';
wwv_flow_api.g_varchar2_table(114) := '6E5C2220746578742D72656E646572696E673D5C2267656F6D6574726963507265636973696F6E5C222076657273696F6E3D5C22312E315C222076696577426F783D5C2230203020313230203132305C2220786D6C3A73706163653D5C22707265736572';
wwv_flow_api.g_varchar2_table(115) := '76655C223E3C7374796C653E402D7765626B69742D6B65796672616D6573204E585265706F72744661696C757265342D616E696D6174696F6E7B30257B6F7061636974793A307D3430252C746F7B6F7061636974793A317D7D406B65796672616D657320';
wwv_flow_api.g_varchar2_table(116) := '4E585265706F72744661696C757265342D616E696D6174696F6E7B30257B6F7061636974793A307D3430252C746F7B6F7061636974793A317D7D402D7765626B69742D6B65796672616D6573204E585265706F72744661696C757265332D616E696D6174';
wwv_flow_api.g_varchar2_table(117) := '696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C6174';
wwv_flow_api.g_varchar2_table(118) := '6528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078297D3430252C746F7B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65';
wwv_flow_api.g_varchar2_table(119) := '28312C3129207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078297D3630257B2D77';
wwv_flow_api.g_varchar2_table(120) := '65626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C';
wwv_flow_api.g_varchar2_table(121) := '3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078297D7D406B65796672616D6573204E585265706F72744661696C757265332D616E696D6174696F6E7B30257B2D7765626B69742D7472616E7366';
wwv_flow_api.g_varchar2_table(122) := '6F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E35';
wwv_flow_api.g_varchar2_table(123) := '2C2E3529207472616E736C617465282D363070782C2D36307078297D3430252C746F7B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D36307078';
wwv_flow_api.g_varchar2_table(124) := '2C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078297D3630257B2D7765626B69742D7472616E73666F726D3A7472616E73';
wwv_flow_api.g_varchar2_table(125) := '6C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E39352920';
wwv_flow_api.g_varchar2_table(126) := '7472616E736C617465282D363070782C2D36307078297D7D402D7765626B69742D6B65796672616D6573204E585265706F72744661696C757265352D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C617465';
wwv_flow_api.g_varchar2_table(127) := '28363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C6174';
wwv_flow_api.g_varchar2_table(128) := '65282D363070782C2D36307078297D3530252C746F7B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078293B7472616E73';
wwv_flow_api.g_varchar2_table(129) := '666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078297D3630257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C363070';
wwv_flow_api.g_varchar2_table(130) := '7829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D3630';
wwv_flow_api.g_varchar2_table(131) := '70782C2D36307078297D7D406B65796672616D6573204E585265706F72744661696C757265352D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C';
wwv_flow_api.g_varchar2_table(132) := '2E3529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078297D3530252C746F';
wwv_flow_api.g_varchar2_table(133) := '7B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C36';
wwv_flow_api.g_varchar2_table(134) := '30707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078297D3630257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E39352920747261';
wwv_flow_api.g_varchar2_table(135) := '6E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078297D7D402D7765626B69742D6B';
wwv_flow_api.g_varchar2_table(136) := '65796672616D6573204E585265706F72744661696C757265362D616E696D6174696F6E7B30257B6F7061636974793A307D3530252C746F7B6F7061636974793A317D7D406B65796672616D6573204E585265706F72744661696C757265362D616E696D61';
wwv_flow_api.g_varchar2_table(137) := '74696F6E7B30257B6F7061636974793A307D3530252C746F7B6F7061636974793A317D7D234E585265706F72744661696C757265202A7B2D7765626B69742D616E696D6174696F6E2D6475726174696F6E3A312E32733B616E696D6174696F6E2D647572';
wwv_flow_api.g_varchar2_table(138) := '6174696F6E3A312E32733B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A69657228302C302C312C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62';
wwv_flow_api.g_varchar2_table(139) := '657A69657228302C302C312C31297D3C2F7374796C653E3C672069643D5C224E585265706F72744661696C757265315C223E3C672069643D5C224E585265706F72744661696C757265325C223E3C67207374796C653D5C222D7765626B69742D616E696D';
wwv_flow_api.g_varchar2_table(140) := '6174696F6E2D6E616D653A4E585265706F72744661696C757265332D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E585265706F72744661696C757265332D616E696D6174696F6E3B2D7765626B69742D616E696D6174696F6E2D7469';
wwv_flow_api.g_varchar2_table(141) := '6D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B2D7765626B69742D';
wwv_flow_api.g_varchar2_table(142) := '7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078295C223E3C7061746820643D5C224D342E33352033342E393563302D31362E38322031332E';
wwv_flow_api.g_varchar2_table(143) := '37382D33302E362033302E362D33302E366835302E316331362E383220302033302E362031332E37382033302E362033302E367635302E3163302031362E38322D31332E37382033302E362D33302E362033302E36682D35302E31632D31362E38322030';
wwv_flow_api.g_varchar2_table(144) := '2D33302E362D31332E37382D33302E362D33302E36762D35302E317A4D33342E3935203132306835302E316331392E323220302033342E39352D31352E37332033342E39352D33342E3935762D35302E31433132302031352E3733203130342E32372030';
wwv_flow_api.g_varchar2_table(145) := '2038352E30352030682D35302E314331352E3733203020302031352E373320302033342E39357635302E314330203130342E32372031352E3733203132302033342E3935203132307A5C22207374796C653D5C222D7765626B69742D616E696D6174696F';
wwv_flow_api.g_varchar2_table(146) := '6E2D6E616D653A4E585265706F72744661696C757265342D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E585265706F72744661696C757265342D616E696D6174696F6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E67';
wwv_flow_api.g_varchar2_table(147) := '2D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31295C222066696C6C3D5C22696E68';
wwv_flow_api.g_varchar2_table(148) := '657269745C2220646174612D616E696D61746F722D67726F75703D5C22747275655C2220646174612D616E696D61746F722D747970653D5C22325C222F3E3C2F673E3C67207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A';
wwv_flow_api.g_varchar2_table(149) := '4E585265706F72744661696C757265352D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E585265706F72744661696C757265352D616E696D6174696F6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E637469';
wwv_flow_api.g_varchar2_table(150) := '6F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B2D7765626B69742D7472616E73666F726D3A74';
wwv_flow_api.g_varchar2_table(151) := '72616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078295C223E3C7061746820643D5C224D38322E342033372E36632D2E392D2E392D322E33372D2E392D332E323720304C36';
wwv_flow_api.g_varchar2_table(152) := '302035362E37332034302E38362033372E3661322E33303620322E3330362030203020302D332E323620332E32364C35362E37332036302033372E362037392E3133632D2E392E392D2E3920322E3337203020332E32372E34352E343520312E30342E36';
wwv_flow_api.g_varchar2_table(153) := '3820312E36332E36382E3539203020312E31382D2E323320312E36332D2E36384C36302036332E32362037392E31332038322E34632E34352E343520312E30352E363820312E36342E36382E3538203020312E31382D2E323320312E36332D2E36382E39';
wwv_flow_api.g_varchar2_table(154) := '2D2E392E392D322E333720302D332E32374C36332E32362036302038322E342034302E3836632E392D2E39312E392D322E333620302D332E32367A5C22207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F72';
wwv_flow_api.g_varchar2_table(155) := '744661696C757265362D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E585265706F72744661696C757265362D616E696D6174696F6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269';
wwv_flow_api.g_varchar2_table(156) := '632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31295C222066696C6C3D5C22696E68657269745C2220646174612D616E';
wwv_flow_api.g_varchar2_table(157) := '696D61746F722D67726F75703D5C22747275655C2220646174612D616E696D61746F722D747970653D5C22325C222F3E3C2F673E3C2F673E3C2F673E3C2F7376673E223B72657475726E20617D2C4E3D66756E6374696F6E28742C65297B747C7C28743D';
wwv_flow_api.g_varchar2_table(158) := '22313130707822292C657C7C28653D222365656266333122293B76617220613D223C73766720786D6C6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C222069643D5C224E585265706F72745761726E696E675C22207769';
wwv_flow_api.g_varchar2_table(159) := '6474683D5C22222B742B225C22206865696768743D5C22222B742B225C222066696C6C3D5C22222B652B225C222066696C6C2D72756C653D5C226576656E6F64645C2220636C69702D72756C653D5C226576656E6F64645C2220696D6167652D72656E64';
wwv_flow_api.g_varchar2_table(160) := '6572696E673D5C226F7074696D697A655175616C6974795C222073686170652D72656E646572696E673D5C2267656F6D6574726963507265636973696F6E5C2220746578742D72656E646572696E673D5C2267656F6D6574726963507265636973696F6E';
wwv_flow_api.g_varchar2_table(161) := '5C222076657273696F6E3D5C22312E315C222076696577426F783D5C2230203020313230203132305C2220786D6C3A73706163653D5C2270726573657276655C223E3C7374796C653E402D7765626B69742D6B65796672616D6573204E585265706F7274';
wwv_flow_api.g_varchar2_table(162) := '5761726E696E67332D616E696D6174696F6E7B30257B6F7061636974793A307D3430252C746F7B6F7061636974793A317D7D406B65796672616D6573204E585265706F72745761726E696E67332D616E696D6174696F6E7B30257B6F7061636974793A30';
wwv_flow_api.g_varchar2_table(163) := '7D3430252C746F7B6F7061636974793A317D7D402D7765626B69742D6B65796672616D6573204E585265706F72745761726E696E67322D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C6174652836307078';
wwv_flow_api.g_varchar2_table(164) := '2C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D3630';
wwv_flow_api.g_varchar2_table(165) := '70782C2D36307078297D3430252C746F7B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A';
wwv_flow_api.g_varchar2_table(166) := '7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078297D3630257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363';
wwv_flow_api.g_varchar2_table(167) := '616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36';
wwv_flow_api.g_varchar2_table(168) := '307078297D7D406B65796672616D6573204E585265706F72745761726E696E67322D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E35292074';
wwv_flow_api.g_varchar2_table(169) := '72616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078297D3430252C746F7B2D776562';
wwv_flow_api.g_varchar2_table(170) := '6B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C363070782920';
wwv_flow_api.g_varchar2_table(171) := '7363616C6528312C3129207472616E736C617465282D363070782C2D36307078297D3630257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C6174';
wwv_flow_api.g_varchar2_table(172) := '65282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078297D7D402D7765626B69742D6B6579667261';
wwv_flow_api.g_varchar2_table(173) := '6D6573204E585265706F72745761726E696E67342D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C36362E36707829207363616C65282E352C2E3529207472616E736C617465282D36';
wwv_flow_api.g_varchar2_table(174) := '3070782C2D36362E367078293B7472616E73666F726D3A7472616E736C61746528363070782C36362E36707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36362E367078297D3530252C746F7B2D7765626B69742D74';
wwv_flow_api.g_varchar2_table(175) := '72616E73666F726D3A7472616E736C61746528363070782C36362E36707829207363616C6528312C3129207472616E736C617465282D363070782C2D36362E367078293B7472616E73666F726D3A7472616E736C61746528363070782C36362E36707829';
wwv_flow_api.g_varchar2_table(176) := '207363616C6528312C3129207472616E736C617465282D363070782C2D36362E367078297D3630257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C36362E36707829207363616C65282E39352C2E39352920747261';
wwv_flow_api.g_varchar2_table(177) := '6E736C617465282D363070782C2D36362E367078293B7472616E73666F726D3A7472616E736C61746528363070782C36362E36707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36362E367078297D7D406B6579';
wwv_flow_api.g_varchar2_table(178) := '6672616D6573204E585265706F72745761726E696E67342D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C36362E36707829207363616C65282E352C2E3529207472616E736C617465';
wwv_flow_api.g_varchar2_table(179) := '282D363070782C2D36362E367078293B7472616E73666F726D3A7472616E736C61746528363070782C36362E36707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36362E367078297D3530252C746F7B2D7765626B69';
wwv_flow_api.g_varchar2_table(180) := '742D7472616E73666F726D3A7472616E736C61746528363070782C36362E36707829207363616C6528312C3129207472616E736C617465282D363070782C2D36362E367078293B7472616E73666F726D3A7472616E736C61746528363070782C36362E36';
wwv_flow_api.g_varchar2_table(181) := '707829207363616C6528312C3129207472616E736C617465282D363070782C2D36362E367078297D3630257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C36362E36707829207363616C65282E39352C2E39352920';
wwv_flow_api.g_varchar2_table(182) := '7472616E736C617465282D363070782C2D36362E367078293B7472616E73666F726D3A7472616E736C61746528363070782C36362E36707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36362E367078297D7D40';
wwv_flow_api.g_varchar2_table(183) := '2D7765626B69742D6B65796672616D6573204E585265706F72745761726E696E67352D616E696D6174696F6E7B30257B6F7061636974793A307D3530252C746F7B6F7061636974793A317D7D406B65796672616D6573204E585265706F72745761726E69';
wwv_flow_api.g_varchar2_table(184) := '6E67352D616E696D6174696F6E7B30257B6F7061636974793A307D3530252C746F7B6F7061636974793A317D7D234E585265706F72745761726E696E67202A7B2D7765626B69742D616E696D6174696F6E2D6475726174696F6E3A312E32733B616E696D';
wwv_flow_api.g_varchar2_table(185) := '6174696F6E2D6475726174696F6E3A312E32733B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A69657228302C302C312C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F';
wwv_flow_api.g_varchar2_table(186) := '6E3A63756269632D62657A69657228302C302C312C31297D3C2F7374796C653E3C672069643D5C224E585265706F72745761726E696E67315C223E3C67207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F72';
wwv_flow_api.g_varchar2_table(187) := '745761726E696E67322D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E585265706F72745761726E696E67322D616E696D6174696F6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269';
wwv_flow_api.g_varchar2_table(188) := '632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B2D7765626B69742D7472616E73666F726D3A7472616E736C6174';
wwv_flow_api.g_varchar2_table(189) := '6528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078295C223E3C7061746820643D5C224D3131352E3436203130362E31356C2D35342E30342D39332E38632D2E36312D312E30362D322E3233';
wwv_flow_api.g_varchar2_table(190) := '2D312E30362D322E383420306C2D35342E30342039332E38632D2E363220312E30372E323120322E323920312E343220322E3239683130382E303863312E3231203020322E30342D312E323220312E34322D322E32397A4D36352E31372031302E326C35';
wwv_flow_api.g_varchar2_table(191) := '342E30342039332E3863322E323820332E39362D2E363520382E37382D352E313720382E373848352E3936632D342E353220302D372E34352D342E38322D352E31372D382E37386C35342E30342D39332E3863322E32382D332E393520382E30332D3420';
wwv_flow_api.g_varchar2_table(192) := '31302E333420307A5C22207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F72745761726E696E67332D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E585265706F72745761726E696E6733';
wwv_flow_api.g_varchar2_table(193) := '2D616E696D6174696F6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A637562';
wwv_flow_api.g_varchar2_table(194) := '69632D62657A696572282E34322C302C2E35382C31295C222066696C6C3D5C22696E68657269745C2220646174612D616E696D61746F722D67726F75703D5C22747275655C2220646174612D616E696D61746F722D747970653D5C22325C222F3E3C2F67';
wwv_flow_api.g_varchar2_table(195) := '3E3C67207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F72745761726E696E67342D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E585265706F72745761726E696E67342D616E696D6174';
wwv_flow_api.g_varchar2_table(196) := '696F6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A69';
wwv_flow_api.g_varchar2_table(197) := '6572282E34322C302C2E35382C31293B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C36362E36707829207363616C6528312C3129207472616E736C617465282D363070782C2D36362E367078295C223E3C70617468';
wwv_flow_api.g_varchar2_table(198) := '20643D5C224D35372E38332039342E3031633020312E322E393720322E313720322E313720322E313773322E31372D2E393720322E31372D322E3137762D332E3263302D312E322D2E39372D322E31372D322E31372D322E3137732D322E31372E39372D';
wwv_flow_api.g_varchar2_table(199) := '322E313720322E313776332E327A6D302D31342E3135633020312E322E393720322E313720322E313720322E313773322E31372D2E393720322E31372D322E31375633392E323163302D312E322D2E39372D322E31372D322E31372D322E3137732D322E';
wwv_flow_api.g_varchar2_table(200) := '31372E39372D322E313720322E31377634302E36357A5C22207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F72745761726E696E67352D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E58';
wwv_flow_api.g_varchar2_table(201) := '5265706F72745761726E696E67352D616E696D6174696F6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E';
wwv_flow_api.g_varchar2_table(202) := '672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31295C222066696C6C3D5C22696E68657269745C2220646174612D616E696D61746F722D67726F75703D5C22747275655C2220646174612D616E696D61746F722D74';
wwv_flow_api.g_varchar2_table(203) := '7970653D5C22325C222F3E3C2F673E3C2F673E3C2F7376673E223B72657475726E20617D2C433D66756E6374696F6E28742C65297B747C7C28743D22313130707822292C657C7C28653D222332366330643322293B76617220613D223C73766720786D6C';
wwv_flow_api.g_varchar2_table(204) := '6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C222069643D5C224E585265706F7274496E666F5C222077696474683D5C22222B742B225C22206865696768743D5C22222B742B225C222066696C6C3D5C22222B652B225C';
wwv_flow_api.g_varchar2_table(205) := '222066696C6C2D72756C653D5C226576656E6F64645C2220636C69702D72756C653D5C226576656E6F64645C2220696D6167652D72656E646572696E673D5C226F7074696D697A655175616C6974795C222073686170652D72656E646572696E673D5C22';
wwv_flow_api.g_varchar2_table(206) := '67656F6D6574726963507265636973696F6E5C2220746578742D72656E646572696E673D5C2267656F6D6574726963507265636973696F6E5C222076657273696F6E3D5C22312E315C222076696577426F783D5C2230203020313230203132305C222078';
wwv_flow_api.g_varchar2_table(207) := '6D6C3A73706163653D5C2270726573657276655C223E3C7374796C653E402D7765626B69742D6B65796672616D6573204E585265706F7274496E666F352D616E696D6174696F6E7B30257B6F7061636974793A307D3530252C746F7B6F7061636974793A';
wwv_flow_api.g_varchar2_table(208) := '317D7D406B65796672616D6573204E585265706F7274496E666F352D616E696D6174696F6E7B30257B6F7061636974793A307D3530252C746F7B6F7061636974793A317D7D402D7765626B69742D6B65796672616D6573204E585265706F7274496E666F';
wwv_flow_api.g_varchar2_table(209) := '342D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A';
wwv_flow_api.g_varchar2_table(210) := '7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078297D3530252C746F7B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C363070';
wwv_flow_api.g_varchar2_table(211) := '7829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078';
wwv_flow_api.g_varchar2_table(212) := '297D3630257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61';
wwv_flow_api.g_varchar2_table(213) := '746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078297D7D406B65796672616D6573204E585265706F7274496E666F342D616E696D6174696F6E7B30257B2D7765626B69742D74';
wwv_flow_api.g_varchar2_table(214) := '72616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C363070782920736361';
wwv_flow_api.g_varchar2_table(215) := '6C65282E352C2E3529207472616E736C617465282D363070782C2D36307078297D3530252C746F7B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C61746528';
wwv_flow_api.g_varchar2_table(216) := '2D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078297D3630257B2D7765626B69742D7472616E73666F726D3A';
wwv_flow_api.g_varchar2_table(217) := '7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C';
wwv_flow_api.g_varchar2_table(218) := '2E393529207472616E736C617465282D363070782C2D36307078297D7D402D7765626B69742D6B65796672616D6573204E585265706F7274496E666F332D616E696D6174696F6E7B30257B6F7061636974793A307D3430252C746F7B6F7061636974793A';
wwv_flow_api.g_varchar2_table(219) := '317D7D406B65796672616D6573204E585265706F7274496E666F332D616E696D6174696F6E7B30257B6F7061636974793A307D3430252C746F7B6F7061636974793A317D7D402D7765626B69742D6B65796672616D6573204E585265706F7274496E666F';
wwv_flow_api.g_varchar2_table(220) := '322D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A';
wwv_flow_api.g_varchar2_table(221) := '7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078297D3430252C746F7B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C363070';
wwv_flow_api.g_varchar2_table(222) := '7829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078';
wwv_flow_api.g_varchar2_table(223) := '297D3630257B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61';
wwv_flow_api.g_varchar2_table(224) := '746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078297D7D406B65796672616D6573204E585265706F7274496E666F322D616E696D6174696F6E7B30257B2D7765626B69742D74';
wwv_flow_api.g_varchar2_table(225) := '72616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E352C2E3529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C363070782920736361';
wwv_flow_api.g_varchar2_table(226) := '6C65282E352C2E3529207472616E736C617465282D363070782C2D36307078297D3430252C746F7B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C61746528';
wwv_flow_api.g_varchar2_table(227) := '2D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C2D36307078297D3630257B2D7765626B69742D7472616E73666F726D3A';
wwv_flow_api.g_varchar2_table(228) := '7472616E736C61746528363070782C3630707829207363616C65282E39352C2E393529207472616E736C617465282D363070782C2D36307078293B7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C65282E39352C';
wwv_flow_api.g_varchar2_table(229) := '2E393529207472616E736C617465282D363070782C2D36307078297D7D234E585265706F7274496E666F202A7B2D7765626B69742D616E696D6174696F6E2D6475726174696F6E3A312E32733B616E696D6174696F6E2D6475726174696F6E3A312E3273';
wwv_flow_api.g_varchar2_table(230) := '3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A69657228302C302C312C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A69657228302C302C';
wwv_flow_api.g_varchar2_table(231) := '312C31297D3C2F7374796C653E3C672069643D5C224E585265706F7274496E666F315C223E3C67207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F7274496E666F322D616E696D6174696F6E3B616E696D61';
wwv_flow_api.g_varchar2_table(232) := '74696F6E2D6E616D653A4E585265706F7274496E666F322D616E696D6174696F6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174';
wwv_flow_api.g_varchar2_table(233) := '696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E';
wwv_flow_api.g_varchar2_table(234) := '736C617465282D363070782C2D36307078295C223E3C7061746820643D5C224D3630203131352E33384332392E3436203131352E333820342E36322039302E353420342E363220363020342E36322032392E34362032392E343620342E36322036302034';
wwv_flow_api.g_varchar2_table(235) := '2E36326333302E353420302035352E33382032342E38342035352E33382035352E333820302033302E35342D32342E38342035352E33382D35352E33382035352E33387A4D363020304332362E3932203020302032362E393220302036307332362E3932';
wwv_flow_api.g_varchar2_table(236) := '2036302036302036302036302D32362E39322036302D36305339332E3038203020363020307A5C22207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F7274496E666F332D616E696D6174696F6E3B616E696D';
wwv_flow_api.g_varchar2_table(237) := '6174696F6E2D6E616D653A4E585265706F7274496E666F332D616E696D6174696F6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D61';
wwv_flow_api.g_varchar2_table(238) := '74696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31295C222066696C6C3D5C22696E68657269745C2220646174612D616E696D61746F722D67726F75703D5C22747275655C2220646174612D';
wwv_flow_api.g_varchar2_table(239) := '616E696D61746F722D747970653D5C22325C222F3E3C2F673E3C67207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F7274496E666F342D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E58';
wwv_flow_api.g_varchar2_table(240) := '5265706F7274496E666F342D616E696D6174696F6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D696E672D66';
wwv_flow_api.g_varchar2_table(241) := '756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B2D7765626B69742D7472616E73666F726D3A7472616E736C61746528363070782C3630707829207363616C6528312C3129207472616E736C617465282D363070782C';
wwv_flow_api.g_varchar2_table(242) := '2D36307078295C223E3C7061746820643D5C224D35372E37352034332E383563302D312E323420312E30312D322E323520322E32352D322E323573322E323520312E303120322E323520322E32357634382E3138633020312E32342D312E303120322E32';
wwv_flow_api.g_varchar2_table(243) := '352D322E323520322E3235732D322E32352D312E30312D322E32352D322E32355634332E38357A6D302D31352E383863302D312E323420312E30312D322E323520322E32352D322E323573322E323520312E303120322E323520322E323576332E333263';
wwv_flow_api.g_varchar2_table(244) := '3020312E32352D312E303120322E32352D322E323520322E3235732D322E32352D312D322E32352D322E3235762D332E33327A5C22207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E585265706F7274496E666F352D61';
wwv_flow_api.g_varchar2_table(245) := '6E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E585265706F7274496E666F352D616E696D6174696F6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C30';
wwv_flow_api.g_varchar2_table(246) := '2C2E35382C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31295C222066696C6C3D5C22696E68657269745C2220646174612D616E696D61746F722D67726F75703D5C';
wwv_flow_api.g_varchar2_table(247) := '22747275655C2220646174612D616E696D61746F722D747970653D5C22325C222F3E3C2F673E3C2F673E3C2F7376673E223B72657475726E20617D2C7A3D66756E6374696F6E28742C65297B747C7C28743D223630707822292C657C7C28653D22233332';
wwv_flow_api.g_varchar2_table(248) := '6336383222293B76617220613D223C73766720786D6C6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C22207374726F6B653D5C22222B652B225C222077696474683D5C22222B742B225C22206865696768743D5C22222B';
wwv_flow_api.g_varchar2_table(249) := '742B225C22207472616E73666F726D3D5C227363616C65282E38295C222076696577426F783D5C223020302033382033385C223E3C672066696C6C3D5C226E6F6E655C222066696C6C2D72756C653D5C226576656E6F64645C22207374726F6B652D7769';
wwv_flow_api.g_varchar2_table(250) := '6474683D5C22325C22207472616E73666F726D3D5C227472616E736C61746528312031295C223E3C636972636C652063783D5C2231385C222063793D5C2231385C2220723D5C2231385C22207374726F6B652D6F7061636974793D5C222E32355C222F3E';
wwv_flow_api.g_varchar2_table(251) := '3C7061746820643D5C224D333620313863302D392E39342D382E30362D31382D31382D31385C223E3C616E696D6174655472616E73666F726D206174747269627574654E616D653D5C227472616E73666F726D5C22206475723D5C2231735C222066726F';
wwv_flow_api.g_varchar2_table(252) := '6D3D5C22302031382031385C2220726570656174436F756E743D5C22696E646566696E6974655C2220746F3D5C223336302031382031385C2220747970653D5C22726F746174655C222F3E3C2F706174683E3C2F673E3C2F7376673E223B72657475726E';
wwv_flow_api.g_varchar2_table(253) := '20617D2C533D66756E6374696F6E28742C65297B747C7C28743D223630707822292C657C7C28653D222333326336383222293B76617220613D223C73766720786D6C6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C2220';
wwv_flow_api.g_varchar2_table(254) := '69643D5C224E584C6F6164696E67486F7572676C6173735C222066696C6C3D5C22222B652B225C222077696474683D5C22222B742B225C22206865696768743D5C22222B742B225C222066696C6C2D72756C653D5C226576656E6F64645C2220636C6970';
wwv_flow_api.g_varchar2_table(255) := '2D72756C653D5C226576656E6F64645C2220696D6167652D72656E646572696E673D5C226F7074696D697A655175616C6974795C222073686170652D72656E646572696E673D5C2267656F6D6574726963507265636973696F6E5C2220746578742D7265';
wwv_flow_api.g_varchar2_table(256) := '6E646572696E673D5C2267656F6D6574726963507265636973696F6E5C222076657273696F6E3D5C22312E315C222076696577426F783D5C2230203020323030203230305C2220786D6C3A73706163653D5C2270726573657276655C223E3C7374796C65';
wwv_flow_api.g_varchar2_table(257) := '3E402D7765626B69742D6B65796672616D6573204E58686F7572676C617373352D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7363616C6528312C31293B7472616E73666F726D3A7363616C6528312C31297D31362E36';
wwv_flow_api.g_varchar2_table(258) := '37257B2D7765626B69742D7472616E73666F726D3A7363616C6528312C2E38293B7472616E73666F726D3A7363616C6528312C2E38297D33332E3333257B2D7765626B69742D7472616E73666F726D3A7363616C65282E38382C2E36293B7472616E7366';
wwv_flow_api.g_varchar2_table(259) := '6F726D3A7363616C65282E38382C2E36297D33372E35257B2D7765626B69742D7472616E73666F726D3A7363616C65282E38352C2E3535293B7472616E73666F726D3A7363616C65282E38352C2E3535297D34312E3637257B2D7765626B69742D747261';
wwv_flow_api.g_varchar2_table(260) := '6E73666F726D3A7363616C65282E382C2E35293B7472616E73666F726D3A7363616C65282E382C2E35297D34352E3833257B2D7765626B69742D7472616E73666F726D3A7363616C65282E37352C2E3435293B7472616E73666F726D3A7363616C65282E';
wwv_flow_api.g_varchar2_table(261) := '37352C2E3435297D3530257B2D7765626B69742D7472616E73666F726D3A7363616C65282E372C2E34293B7472616E73666F726D3A7363616C65282E372C2E34297D35342E3137257B2D7765626B69742D7472616E73666F726D3A7363616C65282E362C';
wwv_flow_api.g_varchar2_table(262) := '2E3335293B7472616E73666F726D3A7363616C65282E362C2E3335297D35382E3333257B2D7765626B69742D7472616E73666F726D3A7363616C65282E352C2E33293B7472616E73666F726D3A7363616C65282E352C2E33297D38332E3333252C746F7B';
wwv_flow_api.g_varchar2_table(263) := '2D7765626B69742D7472616E73666F726D3A7363616C65282E322C30293B7472616E73666F726D3A7363616C65282E322C30297D7D406B65796672616D6573204E58686F7572676C617373352D616E696D6174696F6E7B30257B2D7765626B69742D7472';
wwv_flow_api.g_varchar2_table(264) := '616E73666F726D3A7363616C6528312C31293B7472616E73666F726D3A7363616C6528312C31297D31362E3637257B2D7765626B69742D7472616E73666F726D3A7363616C6528312C2E38293B7472616E73666F726D3A7363616C6528312C2E38297D33';
wwv_flow_api.g_varchar2_table(265) := '332E3333257B2D7765626B69742D7472616E73666F726D3A7363616C65282E38382C2E36293B7472616E73666F726D3A7363616C65282E38382C2E36297D33372E35257B2D7765626B69742D7472616E73666F726D3A7363616C65282E38352C2E353529';
wwv_flow_api.g_varchar2_table(266) := '3B7472616E73666F726D3A7363616C65282E38352C2E3535297D34312E3637257B2D7765626B69742D7472616E73666F726D3A7363616C65282E382C2E35293B7472616E73666F726D3A7363616C65282E382C2E35297D34352E3833257B2D7765626B69';
wwv_flow_api.g_varchar2_table(267) := '742D7472616E73666F726D3A7363616C65282E37352C2E3435293B7472616E73666F726D3A7363616C65282E37352C2E3435297D3530257B2D7765626B69742D7472616E73666F726D3A7363616C65282E372C2E34293B7472616E73666F726D3A736361';
wwv_flow_api.g_varchar2_table(268) := '6C65282E372C2E34297D35342E3137257B2D7765626B69742D7472616E73666F726D3A7363616C65282E362C2E3335293B7472616E73666F726D3A7363616C65282E362C2E3335297D35382E3333257B2D7765626B69742D7472616E73666F726D3A7363';
wwv_flow_api.g_varchar2_table(269) := '616C65282E352C2E33293B7472616E73666F726D3A7363616C65282E352C2E33297D38332E3333252C746F7B2D7765626B69742D7472616E73666F726D3A7363616C65282E322C30293B7472616E73666F726D3A7363616C65282E322C30297D7D402D77';
wwv_flow_api.g_varchar2_table(270) := '65626B69742D6B65796672616D6573204E58686F7572676C617373332D616E696D6174696F6E7B30257B2D7765626B69742D7472616E73666F726D3A7363616C6528312C2E3032293B7472616E73666F726D3A7363616C6528312C2E3032297D37392E31';
wwv_flow_api.g_varchar2_table(271) := '37252C746F7B2D7765626B69742D7472616E73666F726D3A7363616C6528312C31293B7472616E73666F726D3A7363616C6528312C31297D7D406B65796672616D6573204E58686F7572676C617373332D616E696D6174696F6E7B30257B2D7765626B69';
wwv_flow_api.g_varchar2_table(272) := '742D7472616E73666F726D3A7363616C6528312C2E3032293B7472616E73666F726D3A7363616C6528312C2E3032297D37392E3137252C746F7B2D7765626B69742D7472616E73666F726D3A7363616C6528312C31293B7472616E73666F726D3A736361';
wwv_flow_api.g_varchar2_table(273) := '6C6528312C31297D7D402D7765626B69742D6B65796672616D6573204E58686F7572676C617373312D616E696D6174696F6E7B30252C38332E3333257B2D7765626B69742D7472616E73666F726D3A726F746174652830646567293B7472616E73666F72';
wwv_flow_api.g_varchar2_table(274) := '6D3A726F746174652830646567297D746F7B2D7765626B69742D7472616E73666F726D3A726F7461746528313830646567293B7472616E73666F726D3A726F7461746528313830646567297D7D406B65796672616D6573204E58686F7572676C61737331';
wwv_flow_api.g_varchar2_table(275) := '2D616E696D6174696F6E7B30252C38332E3333257B2D7765626B69742D7472616E73666F726D3A726F746174652830646567293B7472616E73666F726D3A726F746174652830646567297D746F7B2D7765626B69742D7472616E73666F726D3A726F7461';
wwv_flow_api.g_varchar2_table(276) := '746528313830646567293B7472616E73666F726D3A726F7461746528313830646567297D7D234E584C6F6164696E67486F7572676C617373202A7B2D7765626B69742D616E696D6174696F6E2D6475726174696F6E3A312E32733B616E696D6174696F6E';
wwv_flow_api.g_varchar2_table(277) := '2D6475726174696F6E3A312E32733B2D7765626B69742D616E696D6174696F6E2D697465726174696F6E2D636F756E743A696E66696E6974653B616E696D6174696F6E2D697465726174696F6E2D636F756E743A696E66696E6974653B2D7765626B6974';
wwv_flow_api.g_varchar2_table(278) := '2D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A69657228302C302C312C31293B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A69657228302C302C312C31297D3C2F73';
wwv_flow_api.g_varchar2_table(279) := '74796C653E3C6720646174612D616E696D61746F722D67726F75703D5C22747275655C2220646174612D616E696D61746F722D747970653D5C22315C22207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E58686F757267';
wwv_flow_api.g_varchar2_table(280) := '6C617373312D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E58686F7572676C617373312D616E696D6174696F6E3B2D7765626B69742D7472616E73666F726D2D6F726967696E3A353025203530253B7472616E73666F726D2D6F7269';
wwv_flow_api.g_varchar2_table(281) := '67696E3A353025203530253B7472616E73666F726D2D626F783A66696C6C2D626F785C223E3C672069643D5C224E58686F7572676C617373325C222066696C6C3D5C22696E68657269745C223E3C6720646174612D616E696D61746F722D67726F75703D';
wwv_flow_api.g_varchar2_table(282) := '5C22747275655C2220646174612D616E696D61746F722D747970653D5C22325C22207374796C653D5C222D7765626B69742D616E696D6174696F6E2D6E616D653A4E58686F7572676C617373332D616E696D6174696F6E3B616E696D6174696F6E2D6E61';
wwv_flow_api.g_varchar2_table(283) := '6D653A4E58686F7572676C617373332D616E696D6174696F6E3B2D7765626B69742D616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B616E696D6174696F6E2D74696D69';
wwv_flow_api.g_varchar2_table(284) := '6E672D66756E6374696F6E3A63756269632D62657A696572282E34322C302C2E35382C31293B2D7765626B69742D7472616E73666F726D2D6F726967696E3A35302520313030253B7472616E73666F726D2D6F726967696E3A35302520313030253B7472';
wwv_flow_api.g_varchar2_table(285) := '616E73666F726D2D626F783A66696C6C2D626F785C22206F7061636974793D5C222E345C223E3C706174682069643D5C224E58686F7572676C617373345C2220643D5C224D313030203130306C2D33342E33382033322E30387633312E31346836382E37';
wwv_flow_api.g_varchar2_table(286) := '36762D33312E31347A5C222F3E3C2F673E3C6720646174612D616E696D61746F722D67726F75703D5C22747275655C2220646174612D616E696D61746F722D747970653D5C22325C22207374796C653D5C222D7765626B69742D616E696D6174696F6E2D';
wwv_flow_api.g_varchar2_table(287) := '6E616D653A4E58686F7572676C617373352D616E696D6174696F6E3B616E696D6174696F6E2D6E616D653A4E58686F7572676C617373352D616E696D6174696F6E3B2D7765626B69742D7472616E73666F726D2D6F726967696E3A35302520313030253B';
wwv_flow_api.g_varchar2_table(288) := '7472616E73666F726D2D6F726967696E3A35302520313030253B7472616E73666F726D2D626F783A66696C6C2D626F785C22206F7061636974793D5C222E345C223E3C706174682069643D5C224E58686F7572676C617373365C2220643D5C224D313030';
wwv_flow_api.g_varchar2_table(289) := '203130304C36352E36322036372E39325633362E37386836382E37367633312E31347A5C222F3E3C2F673E3C7061746820643D5C224D35312E31342033382E383968382E33337631342E393363302031352E3120382E32392032382E39392032332E3334';
wwv_flow_api.g_varchar2_table(290) := '2033392E3120312E383820312E323520332E303420332E393720332E303420372E3038732D312E313620352E38332D332E303420372E3039632D31352E30352031302E312D32332E33342032332E39392D32332E33342033392E30397631342E3933682D';
wwv_flow_api.g_varchar2_table(291) := '382E333361342E38353920342E383539203020312030203020392E37326839372E373261342E38353920342E38353920302031203020302D392E3732682D382E3333762D31342E393363302D31352E312D382E32392D32382E39392D32332E33342D3339';
wwv_flow_api.g_varchar2_table(292) := '2E30392D312E38382D312E32362D332E30342D332E39382D332E30342D372E303973312E31362D352E383320332E30342D372E30386331352E30352D31302E31312032332E33342D32342032332E33342D33392E315633382E383968382E333361342E38';
wwv_flow_api.g_varchar2_table(293) := '353920342E38353920302031203020302D392E37324835312E313461342E38353920342E383539203020312030203020392E37327A6D37392E36372031342E393363302031352E38372D31312E39332032362E32352D31392E30342033312E30332D342E';
wwv_flow_api.g_varchar2_table(294) := '3620332E30382D372E333420382E37352D372E33342031352E3135203020362E343120322E37342031322E303720372E33342031352E313520372E313120342E37382031392E30342031352E31362031392E30342033312E30337631342E39334836392E';
wwv_flow_api.g_varchar2_table(295) := '3139762D31342E393363302D31352E38372031312E39332D32362E32352031392E30342D33312E303220342E362D332E303920372E33342D382E373520372E33342D31352E313620302D362E342D322E37342D31322E30372D372E33342D31352E31352D';
wwv_flow_api.g_varchar2_table(296) := '372E31312D342E37382D31392E30342D31352E31362D31392E30342D33312E30335633382E38396836312E36327631342E39337A5C222F3E3C2F673E3C2F673E3C2F7376673E223B72657475726E20617D2C493D66756E6374696F6E28742C65297B747C';
wwv_flow_api.g_varchar2_table(297) := '7C28743D223630707822292C657C7C28653D222333326336383222293B76617220613D223C73766720786D6C6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C222077696474683D5C22222B742B225C2220686569676874';
wwv_flow_api.g_varchar2_table(298) := '3D5C22222B742B225C222076696577426F783D5C2232352032352035302035305C22207374796C653D5C222D7765626B69742D616E696D6174696F6E3A726F74617465203273206C696E65617220696E66696E6974653B616E696D6174696F6E3A726F74';
wwv_flow_api.g_varchar2_table(299) := '617465203273206C696E65617220696E66696E6974653B6865696768743A222B742B223B2D7765626B69742D7472616E73666F726D2D6F726967696E3A63656E7465722063656E7465723B2D6D732D7472616E73666F726D2D6F726967696E3A63656E74';
wwv_flow_api.g_varchar2_table(300) := '65722063656E7465723B7472616E73666F726D2D6F726967696E3A63656E7465722063656E7465723B77696474683A222B742B223B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B6D617267696E3A6175746F5C223E3C73';
wwv_flow_api.g_varchar2_table(301) := '74796C653E402D7765626B69742D6B65796672616D657320726F746174657B746F7B2D7765626B69742D7472616E73666F726D3A726F7461746528333630646567293B7472616E73666F726D3A726F7461746528333630646567297D7D406B6579667261';
wwv_flow_api.g_varchar2_table(302) := '6D657320726F746174657B746F7B2D7765626B69742D7472616E73666F726D3A726F7461746528333630646567293B7472616E73666F726D3A726F7461746528333630646567297D7D402D7765626B69742D6B65796672616D657320646173687B30257B';
wwv_flow_api.g_varchar2_table(303) := '7374726F6B652D6461736861727261793A312C3230303B7374726F6B652D646173686F66667365743A307D3530257B7374726F6B652D6461736861727261793A38392C3230303B7374726F6B652D646173686F66667365743A2D33357D746F7B7374726F';
wwv_flow_api.g_varchar2_table(304) := '6B652D6461736861727261793A38392C3230303B7374726F6B652D646173686F66667365743A2D3132347D7D406B65796672616D657320646173687B30257B7374726F6B652D6461736861727261793A312C3230303B7374726F6B652D646173686F6666';
wwv_flow_api.g_varchar2_table(305) := '7365743A307D3530257B7374726F6B652D6461736861727261793A38392C3230303B7374726F6B652D646173686F66667365743A2D33357D746F7B7374726F6B652D6461736861727261793A38392C3230303B7374726F6B652D646173686F6666736574';
wwv_flow_api.g_varchar2_table(306) := '3A2D3132347D7D3C2F7374796C653E3C636972636C652063783D5C2235305C222063793D5C2235305C2220723D5C2232305C222066696C6C3D5C226E6F6E655C22207374726F6B653D5C22222B652B225C22207374726F6B652D77696474683D5C22325C';
wwv_flow_api.g_varchar2_table(307) := '22207374796C653D5C222D7765626B69742D616E696D6174696F6E3A6461736820312E357320656173652D696E2D6F757420696E66696E6974652C636F6C6F7220312E357320656173652D696E2D6F757420696E66696E6974653B616E696D6174696F6E';
wwv_flow_api.g_varchar2_table(308) := '3A6461736820312E357320656173652D696E2D6F757420696E66696E6974652C636F6C6F7220312E357320656173652D696E2D6F757420696E66696E6974655C22207374726F6B652D6461736861727261793D5C22313530203230305C22207374726F6B';
wwv_flow_api.g_varchar2_table(309) := '652D646173686F66667365743D5C222D31305C22207374726F6B652D6C696E656361703D5C22726F756E645C222F3E3C2F7376673E223B72657475726E20617D2C4C3D66756E6374696F6E28742C65297B747C7C28743D223630707822292C657C7C2865';
wwv_flow_api.g_varchar2_table(310) := '3D222333326336383222293B76617220613D223C73766720786D6C6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C222066696C6C3D5C22222B652B225C222077696474683D5C22222B742B225C22206865696768743D5C';
wwv_flow_api.g_varchar2_table(311) := '22222B742B225C222076696577426F783D5C2230203020313238203132385C223E3C673E3C706174682066696C6C3D5C22696E68657269745C2220643D5C224D3130392E32352035352E35682D33366C31322D31326132392E35342032392E3534203020';
wwv_flow_api.g_varchar2_table(312) := '3020302D34392E35332031324831382E37354134362E30342034362E30342030203020312039362E392033312E38346C31322E33352D31322E33347633367A6D2D39302E352031376833366C2D31322031326132392E35342032392E3534203020302030';
wwv_flow_api.g_varchar2_table(313) := '2034392E35332D31326831362E39374134362E30342034362E30342030203020312033312E312039362E31364C31382E3734203130382E35762D33367A5C222F3E3C616E696D6174655472616E73666F726D206174747269627574654E616D653D5C2274';
wwv_flow_api.g_varchar2_table(314) := '72616E73666F726D5C22206475723D5C22312E35735C222066726F6D3D5C22302036342036345C2220726570656174436F756E743D5C22696E646566696E6974655C2220746F3D5C223336302036342036345C2220747970653D5C22726F746174655C22';
wwv_flow_api.g_varchar2_table(315) := '2F3E3C2F673E3C2F7376673E223B72657475726E20617D2C4D3D66756E6374696F6E28742C65297B747C7C28743D223630707822292C657C7C28653D222333326336383222293B76617220613D223C73766720786D6C6E733D5C22687474703A2F2F7777';
wwv_flow_api.g_varchar2_table(316) := '772E77332E6F72672F323030302F7376675C222066696C6C3D5C22222B652B225C222077696474683D5C22222B742B225C22206865696768743D5C22222B742B225C22207072657365727665417370656374526174696F3D5C22784D6964594D69645C22';
wwv_flow_api.g_varchar2_table(317) := '2076696577426F783D5C2230203020313030203130305C223E3C67207472616E73666F726D3D5C227472616E736C617465283235203530295C223E3C636972636C6520723D5C22395C222066696C6C3D5C22696E68657269745C22207472616E73666F72';
wwv_flow_api.g_varchar2_table(318) := '6D3D5C227363616C65282E323339295C223E3C616E696D6174655472616E73666F726D206174747269627574654E616D653D5C227472616E73666F726D5C2220626567696E3D5C222D302E323636735C222063616C634D6F64653D5C2273706C696E655C';
wwv_flow_api.g_varchar2_table(319) := '22206475723D5C22302E38735C22206B657953706C696E65733D5C22302E33203020302E3720313B302E33203020302E3720315C22206B657954696D65733D5C22303B302E353B315C2220726570656174436F756E743D5C22696E646566696E6974655C';
wwv_flow_api.g_varchar2_table(320) := '2220747970653D5C227363616C655C222076616C7565733D5C22303B313B305C222F3E3C2F636972636C653E3C2F673E3C67207472616E73666F726D3D5C227472616E736C617465283530203530295C223E3C636972636C6520723D5C22395C22206669';
wwv_flow_api.g_varchar2_table(321) := '6C6C3D5C22696E68657269745C22207472616E73666F726D3D5C227363616C65282E3030313532295C223E3C616E696D6174655472616E73666F726D206174747269627574654E616D653D5C227472616E73666F726D5C2220626567696E3D5C222D302E';
wwv_flow_api.g_varchar2_table(322) := '313333735C222063616C634D6F64653D5C2273706C696E655C22206475723D5C22302E38735C22206B657953706C696E65733D5C22302E33203020302E3720313B302E33203020302E3720315C22206B657954696D65733D5C22303B302E353B315C2220';
wwv_flow_api.g_varchar2_table(323) := '726570656174436F756E743D5C22696E646566696E6974655C2220747970653D5C227363616C655C222076616C7565733D5C22303B313B305C222F3E3C2F636972636C653E3C2F673E3C67207472616E73666F726D3D5C227472616E736C617465283735';
wwv_flow_api.g_varchar2_table(324) := '203530295C223E3C636972636C6520723D5C22395C222066696C6C3D5C22696E68657269745C22207472616E73666F726D3D5C227363616C65282E323939295C223E3C616E696D6174655472616E73666F726D206174747269627574654E616D653D5C22';
wwv_flow_api.g_varchar2_table(325) := '7472616E73666F726D5C2220626567696E3D5C2230735C222063616C634D6F64653D5C2273706C696E655C22206475723D5C22302E38735C22206B657953706C696E65733D5C22302E33203020302E3720313B302E33203020302E3720315C22206B6579';
wwv_flow_api.g_varchar2_table(326) := '54696D65733D5C22303B302E353B315C2220726570656174436F756E743D5C22696E646566696E6974655C2220747970653D5C227363616C655C222076616C7565733D5C22303B313B305C222F3E3C2F636972636C653E3C2F673E3C2F7376673E223B72';
wwv_flow_api.g_varchar2_table(327) := '657475726E20617D2C413D66756E6374696F6E28742C65297B747C7C28743D223630707822292C657C7C28653D222333326336383222293B76617220613D223C73766720786D6C6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F73';
wwv_flow_api.g_varchar2_table(328) := '76675C22207374726F6B653D5C22222B652B225C222077696474683D5C22222B742B225C22206865696768743D5C22222B742B225C222076696577426F783D5C223020302034342034345C223E3C672066696C6C3D5C226E6F6E655C222066696C6C2D72';
wwv_flow_api.g_varchar2_table(329) := '756C653D5C226576656E6F64645C22207374726F6B652D77696474683D5C22325C223E3C636972636C652063783D5C2232325C222063793D5C2232325C2220723D5C22315C223E3C616E696D617465206174747269627574654E616D653D5C22725C2220';
wwv_flow_api.g_varchar2_table(330) := '626567696E3D5C2230735C222063616C634D6F64653D5C2273706C696E655C22206475723D5C22312E38735C22206B657953706C696E65733D5C22302E3136352C20302E38342C20302E34342C20315C22206B657954696D65733D5C22303B20315C2220';
wwv_flow_api.g_varchar2_table(331) := '726570656174436F756E743D5C22696E646566696E6974655C222076616C7565733D5C22313B2032305C222F3E3C616E696D617465206174747269627574654E616D653D5C227374726F6B652D6F7061636974795C2220626567696E3D5C2230735C2220';
wwv_flow_api.g_varchar2_table(332) := '63616C634D6F64653D5C2273706C696E655C22206475723D5C22312E38735C22206B657953706C696E65733D5C22302E332C20302E36312C20302E3335352C20315C22206B657954696D65733D5C22303B20315C2220726570656174436F756E743D5C22';
wwv_flow_api.g_varchar2_table(333) := '696E646566696E6974655C222076616C7565733D5C22313B20305C222F3E3C2F636972636C653E3C636972636C652063783D5C2232325C222063793D5C2232325C2220723D5C22315C223E3C616E696D617465206174747269627574654E616D653D5C22';
wwv_flow_api.g_varchar2_table(334) := '725C2220626567696E3D5C222D302E39735C222063616C634D6F64653D5C2273706C696E655C22206475723D5C22312E38735C22206B657953706C696E65733D5C22302E3136352C20302E38342C20302E34342C20315C22206B657954696D65733D5C22';
wwv_flow_api.g_varchar2_table(335) := '303B20315C2220726570656174436F756E743D5C22696E646566696E6974655C222076616C7565733D5C22313B2032305C222F3E3C616E696D617465206174747269627574654E616D653D5C227374726F6B652D6F7061636974795C2220626567696E3D';
wwv_flow_api.g_varchar2_table(336) := '5C222D302E39735C222063616C634D6F64653D5C2273706C696E655C22206475723D5C22312E38735C22206B657953706C696E65733D5C22302E332C20302E36312C20302E3335352C20315C22206B657954696D65733D5C22303B20315C222072657065';
wwv_flow_api.g_varchar2_table(337) := '6174436F756E743D5C22696E646566696E6974655C222076616C7565733D5C22313B20305C222F3E3C2F636972636C653E3C2F673E3C2F7376673E223B72657475726E20617D2C583D66756E6374696F6E28742C652C61297B747C7C28743D2236307078';
wwv_flow_api.g_varchar2_table(338) := '22292C657C7C28653D222366386638663822292C617C7C28613D222333326336383222293B766172206E3D223C73766720786D6C6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C222069643D5C224E584C6F6164696E67';
wwv_flow_api.g_varchar2_table(339) := '4E6F7469666C69784C69625C222077696474683D5C22222B742B225C22206865696768743D5C22222B742B225C222066696C6C2D72756C653D5C226576656E6F64645C2220636C69702D72756C653D5C226576656E6F64645C2220696D6167652D72656E';
wwv_flow_api.g_varchar2_table(340) := '646572696E673D5C226F7074696D697A655175616C6974795C222073686170652D72656E646572696E673D5C2267656F6D6574726963507265636973696F6E5C2220746578742D72656E646572696E673D5C2267656F6D6574726963507265636973696F';
wwv_flow_api.g_varchar2_table(341) := '6E5C222076657273696F6E3D5C22312E315C222076696577426F783D5C2230203020323030203230305C2220786D6C3A73706163653D5C2270726573657276655C223E3C646566733E3C7374796C653E406B65796672616D6573206E6F7469666C69782D';
wwv_flow_api.g_varchar2_table(342) := '6E7B30257B7374726F6B652D646173686F66667365743A313030307D746F7B7374726F6B652D646173686F66667365743A307D7D406B65796672616D6573206E6F7469666C69782D787B30257B7374726F6B652D646173686F66667365743A313030307D';
wwv_flow_api.g_varchar2_table(343) := '746F7B7374726F6B652D646173686F66667365743A307D7D406B65796672616D6573206E6F7469666C69782D646F747B30252C746F7B7374726F6B652D77696474683A307D3530257B7374726F6B652D77696474683A31327D7D2E6E782D69636F6E2D6C';
wwv_flow_api.g_varchar2_table(344) := '696E657B7374726F6B653A222B652B223B7374726F6B652D77696474683A31323B7374726F6B652D6C696E656361703A726F756E643B7374726F6B652D6C696E656A6F696E3A726F756E643B7374726F6B652D6D697465726C696D69743A32323B66696C';
wwv_flow_api.g_varchar2_table(345) := '6C3A6E6F6E657D3C2F7374796C653E3C2F646566733E3C7061746820643D5C224D34372E3937203133352E303561362E3520362E35203020312031203020313320362E3520362E3520302030203120302D31337A5C22207374796C653D5C22616E696D61';
wwv_flow_api.g_varchar2_table(346) := '74696F6E2D6E616D653A6E6F7469666C69782D646F743B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A656173652D696E2D6F75743B616E696D6174696F6E2D6475726174696F6E3A312E3235733B616E696D6174696F6E2D69746572';
wwv_flow_api.g_varchar2_table(347) := '6174696F6E2D636F756E743A696E66696E6974653B616E696D6174696F6E2D646972656374696F6E3A6E6F726D616C5C222066696C6C3D5C22222B612B225C22207374726F6B653D5C22222B612B225C22207374726F6B652D6C696E656361703D5C2272';
wwv_flow_api.g_varchar2_table(348) := '6F756E645C22207374726F6B652D6C696E656A6F696E3D5C22726F756E645C22207374726F6B652D6D697465726C696D69743D5C2232325C22207374726F6B652D77696474683D5C2231325C222F3E3C7061746820636C6173733D5C226E782D69636F6E';
wwv_flow_api.g_varchar2_table(349) := '2D6C696E655C2220643D5C224D31302E3134203134342E37365638372E353563302D352E36382D342E35342D34312E33362033372E38332D34312E33362034322E333620302033372E38322033352E36382033372E38322034312E33367635372E32315C';
wwv_flow_api.g_varchar2_table(350) := '22207374796C653D5C22616E696D6174696F6E2D6E616D653A6E6F7469666C69782D6E3B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A6C696E6561723B616E696D6174696F6E2D6475726174696F6E3A322E35733B616E696D617469';
wwv_flow_api.g_varchar2_table(351) := '6F6E2D64656C61793A30733B616E696D6174696F6E2D697465726174696F6E2D636F756E743A696E66696E6974653B616E696D6174696F6E2D646972656374696F6E3A6E6F726D616C5C22207374726F6B652D6461736861727261793D5C223530305C22';
wwv_flow_api.g_varchar2_table(352) := '2F3E3C7061746820636C6173733D5C226E782D69636F6E2D6C696E655C2220643D5C224D3131352E3036203134342E34396332342E39382D33322E36382034392E39362D36352E33352037342E39342D39382E30334D3131342E38392034362E36633235';
wwv_flow_api.g_varchar2_table(353) := '2E30392033322E35382035302E31392036352E31372037352E32392039372E37355C22207374796C653D5C22616E696D6174696F6E2D6E616D653A6E6F7469666C69782D783B616E696D6174696F6E2D74696D696E672D66756E6374696F6E3A6C696E65';
wwv_flow_api.g_varchar2_table(354) := '61723B616E696D6174696F6E2D6475726174696F6E3A322E35733B616E696D6174696F6E2D64656C61793A2E32733B616E696D6174696F6E2D697465726174696F6E2D636F756E743A696E66696E6974653B616E696D6174696F6E2D646972656374696F';
wwv_flow_api.g_varchar2_table(355) := '6E3A6E6F726D616C5C22207374726F6B652D6461736861727261793D5C223530305C222F3E3C2F7376673E223B72657475726E206E7D2C523D302C423D302C463D66756E6374696F6E28612C6E2C6F2C73297B69662821782822626F6479222929726574';
wwv_flow_api.g_varchar2_table(356) := '75726E21313B657C7C6A2E4E6F746966792E496E6974287B7D293B76617220633D792821302C652C7B7D293B696628226F626A656374223D3D747970656F66206E26262141727261792E69734172726179286E297C7C226F626A656374223D3D74797065';
wwv_flow_api.g_varchar2_table(357) := '6F66206F26262141727261792E69734172726179286F29297B766172206D3D7B7D3B226F626A656374223D3D747970656F66206E3F6D3D6E3A226F626A656374223D3D747970656F66206F2626286D3D6F292C653D792821302C652C6D297D7661722070';
wwv_flow_api.g_varchar2_table(358) := '3D655B732E746F4C6F63616C654C6F776572436173652822656E22295D3B522B2B2C2266756E6374696F6E223D3D747970656F66206E2626422B2B2C22737472696E6722213D747970656F662061262628613D224E6F7469666C697820222B73292C652E';
wwv_flow_api.g_varchar2_table(359) := '706C61696E54657874262628613D68286129292C21652E706C61696E546578742626612E6C656E6774683E652E6D6573736167654D61784C656E677468262628653D792821302C652C7B636C6F7365427574746F6E3A21302C6D6573736167654D61784C';
wwv_flow_api.g_varchar2_table(360) := '656E6774683A3130307D292C613D2248544D4C2054616773204572726F723A20596F757220636F6E74656E74206C656E677468206973206D6F7265207468616E205C226D6573736167654D61784C656E6774685C22206F7074696F6E2E22292C612E6C65';
wwv_flow_api.g_varchar2_table(361) := '6E6774683E652E6D6573736167654D61784C656E677468262628613D612E737562737472696E6728302C652E6D6573736167654D61784C656E677468292B222E2E2E22292C22736861646F77223D3D3D652E666F6E74417765736F6D6549636F6E537479';
wwv_flow_api.g_varchar2_table(362) := '6C65262628702E666F6E74417765736F6D6549636F6E436F6C6F723D702E6261636B67726F756E64292C652E637373416E696D6174696F6E7C7C28652E637373416E696D6174696F6E4475726174696F6E3D30293B76617220643D742E646F63756D656E';
wwv_flow_api.g_varchar2_table(363) := '742E637265617465456C656D656E74282264697622293B642E69643D6C2E7772617049442C642E7374796C652E77696474683D652E77696474682C642E7374796C652E7A496E6465783D652E7A696E6465782C642E7374796C652E6F7061636974793D65';
wwv_flow_api.g_varchar2_table(364) := '2E6F7061636974792C2263656E7465722D63656E746572223D3D3D652E706F736974696F6E3F28642E7374796C652E6C6566743D652E64697374616E63652C642E7374796C652E746F703D652E64697374616E63652C642E7374796C652E72696768743D';
wwv_flow_api.g_varchar2_table(365) := '652E64697374616E63652C642E7374796C652E626F74746F6D3D652E64697374616E63652C642E7374796C652E6D617267696E3D226175746F222C642E636C6173734C6973742E61646428226E782D666C65782D63656E7465722D63656E74657222292C';
wwv_flow_api.g_varchar2_table(366) := '642E7374796C652E6D61784865696768743D2263616C6328283130307668202D20222B652E64697374616E63652B2229202D20222B652E64697374616E63652B2229222C642E7374796C652E646973706C61793D22666C6578222C642E7374796C652E66';
wwv_flow_api.g_varchar2_table(367) := '6C6578577261703D2277726170222C642E7374796C652E666C6578446972656374696F6E3D22636F6C756D6E222C642E7374796C652E6A757374696679436F6E74656E743D2263656E746572222C642E7374796C652E616C69676E4974656D733D226365';
wwv_flow_api.g_varchar2_table(368) := '6E746572222C642E7374796C652E706F696E7465724576656E74733D226E6F6E6522293A2263656E7465722D746F70223D3D3D652E706F736974696F6E3F28642E7374796C652E6C6566743D652E64697374616E63652C642E7374796C652E7269676874';
wwv_flow_api.g_varchar2_table(369) := '3D652E64697374616E63652C642E7374796C652E746F703D652E64697374616E63652C642E7374796C652E626F74746F6D3D226175746F222C642E7374796C652E6D617267696E3D226175746F22293A2263656E7465722D626F74746F6D223D3D3D652E';
wwv_flow_api.g_varchar2_table(370) := '706F736974696F6E3F28642E7374796C652E6C6566743D652E64697374616E63652C642E7374796C652E72696768743D652E64697374616E63652C642E7374796C652E626F74746F6D3D652E64697374616E63652C642E7374796C652E746F703D226175';
wwv_flow_api.g_varchar2_table(371) := '746F222C642E7374796C652E6D617267696E3D226175746F22293A2272696768742D626F74746F6D223D3D3D652E706F736974696F6E3F28642E7374796C652E72696768743D652E64697374616E63652C642E7374796C652E626F74746F6D3D652E6469';
wwv_flow_api.g_varchar2_table(372) := '7374616E63652C642E7374796C652E746F703D226175746F222C642E7374796C652E6C6566743D226175746F22293A226C6566742D746F70223D3D3D652E706F736974696F6E3F28642E7374796C652E6C6566743D652E64697374616E63652C642E7374';
wwv_flow_api.g_varchar2_table(373) := '796C652E746F703D652E64697374616E63652C642E7374796C652E72696768743D226175746F222C642E7374796C652E626F74746F6D3D226175746F22293A226C6566742D626F74746F6D223D3D3D652E706F736974696F6E3F28642E7374796C652E6C';
wwv_flow_api.g_varchar2_table(374) := '6566743D652E64697374616E63652C642E7374796C652E626F74746F6D3D652E64697374616E63652C642E7374796C652E746F703D226175746F222C642E7374796C652E72696768743D226175746F22293A28642E7374796C652E72696768743D652E64';
wwv_flow_api.g_varchar2_table(375) := '697374616E63652C642E7374796C652E746F703D652E64697374616E63652C642E7374796C652E6C6566743D226175746F222C642E7374796C652E626F74746F6D3D226175746F22293B76617220673B652E6261636B4F7665726C6179262628673D742E';
wwv_flow_api.g_varchar2_table(376) := '646F63756D656E742E637265617465456C656D656E74282264697622292C672E69643D652E49442B224F7665726C6179222C672E7374796C652E77696474683D2231303025222C672E7374796C652E6865696768743D2231303025222C672E7374796C65';
wwv_flow_api.g_varchar2_table(377) := '2E706F736974696F6E3D226669786564222C672E7374796C652E7A496E6465783D652E7A696E6465782C672E7374796C652E6C6566743D302C672E7374796C652E746F703D302C672E7374796C652E72696768743D302C672E7374796C652E626F74746F';
wwv_flow_api.g_varchar2_table(378) := '6D3D302C672E7374796C652E6261636B67726F756E643D702E6261636B4F7665726C6179436F6C6F727C7C652E6261636B4F7665726C6179436F6C6F722C672E636C6173734E616D653D652E637373416E696D6174696F6E3F22776974682D616E696D61';
wwv_flow_api.g_varchar2_table(379) := '74696F6E223A22222C672E7374796C652E616E696D6174696F6E4475726174696F6E3D652E637373416E696D6174696F6E3F652E637373416E696D6174696F6E4475726174696F6E2B226D73223A22222C742E646F63756D656E742E676574456C656D65';
wwv_flow_api.g_varchar2_table(380) := '6E744279496428672E6964293F303D3D3D42262628742E646F63756D656E742E676574456C656D656E744279496428672E6964292E7374796C652E6261636B67726F756E643D702E6261636B4F7665726C6179436F6C6F727C7C652E6261636B4F766572';
wwv_flow_api.g_varchar2_table(381) := '6C6179436F6C6F72293A742E646F63756D656E742E626F64792E617070656E644368696C64286729292C742E646F63756D656E742E676574456C656D656E744279496428642E6964297C7C742E646F63756D656E742E626F64792E617070656E64436869';
wwv_flow_api.g_varchar2_table(382) := '6C642864293B76617220663D742E646F63756D656E742E637265617465456C656D656E74282264697622293B662E69643D652E49442B222D222B522C662E636C6173734E616D653D652E636C6173734E616D652B2220222B702E6368696C64436C617373';
wwv_flow_api.g_varchar2_table(383) := '4E616D652B2220222B28652E637373416E696D6174696F6E3F22776974682D616E696D6174696F6E223A2222292B2220222B28652E75736549636F6E3F22776974682D69636F6E223A2222292B22206E782D222B652E637373416E696D6174696F6E5374';
wwv_flow_api.g_varchar2_table(384) := '796C652B2220222B28652E636C6F7365427574746F6E26262266756E6374696F6E22213D747970656F66206E3F22776974682D636C6F73652D627574746F6E223A2222292B2220222B282266756E6374696F6E223D3D747970656F66206E3F2277697468';
wwv_flow_api.g_varchar2_table(385) := '2D63616C6C6261636B223A2222292B2220222B28652E636C69636B546F436C6F73653F22636C69636B2D746F2D636C6F7365223A2222292C662E7374796C652E666F6E7453697A653D652E666F6E7453697A652C662E7374796C652E636F6C6F723D702E';
wwv_flow_api.g_varchar2_table(386) := '74657874436F6C6F722C662E7374796C652E6261636B67726F756E643D702E6261636B67726F756E642C662E7374796C652E626F726465725261646975733D652E626F726465725261646975732C662E7374796C652E706F696E7465724576656E74733D';
wwv_flow_api.g_varchar2_table(387) := '22616C6C222C652E72746C262628662E7365744174747269627574652822646972222C2272746C22292C662E636C6173734C6973742E616464282272746C2D6F6E2229292C662E7374796C652E666F6E7446616D696C793D225C22222B652E666F6E7446';
wwv_flow_api.g_varchar2_table(388) := '616D696C792B225C222C20222B722C652E637373416E696D6174696F6E262628662E7374796C652E616E696D6174696F6E4475726174696F6E3D652E637373416E696D6174696F6E4475726174696F6E2B226D7322293B76617220753D22223B69662865';
wwv_flow_api.g_varchar2_table(389) := '2E636C6F7365427574746F6E26262266756E6374696F6E22213D747970656F66206E262628753D223C7370616E20636C6173733D5C226E6F746966792D636C6F73652D627574746F6E5C223E3C73766720636C6173733D5C22636C636B32636C735C2220';
wwv_flow_api.g_varchar2_table(390) := '786D6C6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C2220786D6C3A73706163653D5C2270726573657276655C222077696474683D5C22323070785C22206865696768743D5C22323070785C222076657273696F6E3D5C';
wwv_flow_api.g_varchar2_table(391) := '22312E315C22207374796C653D5C2273686170652D72656E646572696E673A67656F6D6574726963507265636973696F6E3B20746578742D72656E646572696E673A67656F6D6574726963507265636973696F6E3B20696D6167652D72656E646572696E';
wwv_flow_api.g_varchar2_table(392) := '673A6F7074696D697A655175616C6974793B2066696C6C2D72756C653A6576656E6F64643B20636C69702D72756C653A6576656E6F64645C2276696577426F783D5C223020302032302032305C22786D6C6E733A786C696E6B3D5C22687474703A2F2F77';
wwv_flow_api.g_varchar2_table(393) := '77772E77332E6F72672F313939392F786C696E6B5C223E3C646566733E3C7374796C6520747970653D5C22746578742F6373735C223E2E636C69636B32636C6F73657B66696C6C3A222B702E6E6F7469666C697849636F6E436F6C6F722B227D3C2F7374';
wwv_flow_api.g_varchar2_table(394) := '796C653E3C2F646566733E3C673E3C7061746820636C6173733D5C22636C69636B32636C6F73655C2220643D5C224D302E333820322E31396C372E3820372E3831202D372E3820372E3831632D302E35312C302E35202D302E35312C312E3331202D302E';
wwv_flow_api.g_varchar2_table(395) := '30312C312E383120302E32352C302E323520302E35372C302E333820302E39312C302E333820302E33342C3020302E36372C2D302E313420302E39312C2D302E33386C372E3831202D372E383120372E383120372E383163302E32342C302E323420302E';
wwv_flow_api.g_varchar2_table(396) := '35372C302E333820302E39312C302E333820302E33342C3020302E36362C2D302E313420302E392C2D302E333820302E35312C2D302E3520302E35312C2D312E333120302C2D312E38316C2D372E3831202D372E383120372E3831202D372E383163302E';
wwv_flow_api.g_varchar2_table(397) := '35312C2D302E3520302E35312C2D312E333120302C2D312E3832202D302E352C2D302E35202D312E33312C2D302E35202D312E38312C306C2D372E383120372E3831202D372E3831202D372E3831632D302E352C2D302E35202D312E33312C2D302E3520';
wwv_flow_api.g_varchar2_table(398) := '2D312E38312C30202D302E35312C302E3531202D302E35312C312E333220302C312E38327A5C222F3E3C2F673E3C2F7376673E3C2F7370616E3E22292C21652E75736549636F6E29662E696E6E657248544D4C3D223C7370616E20636C6173733D5C2274';
wwv_flow_api.g_varchar2_table(399) := '68652D6D6573736167655C223E222B612B223C2F7370616E3E222B28652E636C6F7365427574746F6E3F753A2222293B656C736520696628652E757365466F6E74417765736F6D6529662E696E6E657248544D4C3D223C69207374796C653D5C22636F6C';
wwv_flow_api.g_varchar2_table(400) := '6F723A222B702E666F6E74417765736F6D6549636F6E436F6C6F722B223B20666F6E742D73697A653A222B652E666F6E74417765736F6D6549636F6E53697A652B223B5C2220636C6173733D5C226E6D692077666120222B702E666F6E74417765736F6D';
wwv_flow_api.g_varchar2_table(401) := '65436C6173734E616D652B2220222B2822736861646F77223D3D3D652E666F6E74417765736F6D6549636F6E5374796C653F22736861646F77223A22626173696322292B225C223E3C2F693E3C7370616E20636C6173733D5C227468652D6D6573736167';
wwv_flow_api.g_varchar2_table(402) := '6520776974682D69636F6E5C223E222B612B223C2F7370616E3E222B28652E636C6F7365427574746F6E3F753A2222293B656C73657B76617220623B623D2253756363657373223D3D3D733F223C73766720636C6173733D5C226E6D695C2220786D6C6E';
wwv_flow_api.g_varchar2_table(403) := '733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C2220786D6C3A73706163653D5C2270726573657276655C222077696474683D5C22343070785C22206865696768743D5C22343070785C222076657273696F6E3D5C22312E31';
wwv_flow_api.g_varchar2_table(404) := '5C22207374796C653D5C2273686170652D72656E646572696E673A67656F6D6574726963507265636973696F6E3B20746578742D72656E646572696E673A67656F6D6574726963507265636973696F6E3B20696D6167652D72656E646572696E673A6F70';
wwv_flow_api.g_varchar2_table(405) := '74696D697A655175616C6974793B2066696C6C2D72756C653A6576656E6F64643B20636C69702D72756C653A6576656E6F64645C2276696577426F783D5C223020302034302034305C22786D6C6E733A786C696E6B3D5C22687474703A2F2F7777772E77';
wwv_flow_api.g_varchar2_table(406) := '332E6F72672F313939392F786C696E6B5C223E3C646566733E3C7374796C6520747970653D5C22746578742F6373735C223E234E6F7469666C69782D49636F6E2D537563636573737B66696C6C3A222B702E6E6F7469666C697849636F6E436F6C6F722B';
wwv_flow_api.g_varchar2_table(407) := '227D3C2F7374796C653E3C2F646566733E3C673E3C706174682069643D5C224E6F7469666C69782D49636F6E2D537563636573735C2220643D5C224D323020306331312E30332C302032302C382E39372032302C323020302C31312E3033202D382E3937';
wwv_flow_api.g_varchar2_table(408) := '2C3230202D32302C3230202D31312E30332C30202D32302C2D382E3937202D32302C2D323020302C2D31312E303320382E39372C2D32302032302C2D32307A6D302033372E393863392E39322C302031372E39382C2D382E30362031372E39382C2D3137';
wwv_flow_api.g_varchar2_table(409) := '2E393820302C2D392E3932202D382E30362C2D31372E3938202D31372E39382C2D31372E3938202D392E39322C30202D31372E39382C382E3036202D31372E39382C31372E393820302C392E393220382E30362C31372E39382031372E39382C31372E39';
wwv_flow_api.g_varchar2_table(410) := '387A6D2D322E34202D31332E32396C31312E3532202D31322E393663302E33372C2D302E343120312E30312C2D302E343520312E34322C2D302E303820302E34322C302E333720302E34362C3120302E30392C312E34326C2D31322E31362031332E3637';
wwv_flow_api.g_varchar2_table(411) := '632D302E31392C302E3232202D302E34362C302E3334202D302E37352C302E3334202D302E32332C30202D302E34352C2D302E3037202D302E36332C2D302E32326C2D372E36202D362E3037632D302E34332C2D302E3335202D302E352C2D302E393920';
wwv_flow_api.g_varchar2_table(412) := '2D302E31362C2D312E343220302E33352C2D302E343320302E39392C2D302E3520312E34322C2D302E31366C362E383520352E34387A5C222F3E3C2F673E3C2F7376673E223A224661696C757265223D3D3D733F223C73766720636C6173733D5C226E6D';
wwv_flow_api.g_varchar2_table(413) := '695C2220786D6C6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C2220786D6C3A73706163653D5C2270726573657276655C222077696474683D5C22343070785C22206865696768743D5C22343070785C22207665727369';
wwv_flow_api.g_varchar2_table(414) := '6F6E3D5C22312E315C22207374796C653D5C2273686170652D72656E646572696E673A67656F6D6574726963507265636973696F6E3B20746578742D72656E646572696E673A67656F6D6574726963507265636973696F6E3B20696D6167652D72656E64';
wwv_flow_api.g_varchar2_table(415) := '6572696E673A6F7074696D697A655175616C6974793B2066696C6C2D72756C653A6576656E6F64643B20636C69702D72756C653A6576656E6F64645C2276696577426F783D5C223020302034302034305C22786D6C6E733A786C696E6B3D5C2268747470';
wwv_flow_api.g_varchar2_table(416) := '3A2F2F7777772E77332E6F72672F313939392F786C696E6B5C223E3C646566733E3C7374796C6520747970653D5C22746578742F6373735C223E234E6F7469666C69782D49636F6E2D4661696C7572657B66696C6C3A222B702E6E6F7469666C69784963';
wwv_flow_api.g_varchar2_table(417) := '6F6E436F6C6F722B227D3C2F7374796C653E3C2F646566733E3C673E3C706174682069643D5C224E6F7469666C69782D49636F6E2D4661696C7572655C2220643D5C224D323020306331312E30332C302032302C382E39372032302C323020302C31312E';
wwv_flow_api.g_varchar2_table(418) := '3033202D382E39372C3230202D32302C3230202D31312E30332C30202D32302C2D382E3937202D32302C2D323020302C2D31312E303320382E39372C2D32302032302C2D32307A6D302033372E393863392E39322C302031372E39382C2D382E30362031';
wwv_flow_api.g_varchar2_table(419) := '372E39382C2D31372E393820302C2D392E3932202D382E30362C2D31372E3938202D31372E39382C2D31372E3938202D392E39322C30202D31372E39382C382E3036202D31372E39382C31372E393820302C392E393220382E30362C31372E3938203137';
wwv_flow_api.g_varchar2_table(420) := '2E39382C31372E39387A6D312E3432202D31372E39386C362E313320362E313263302E33392C302E3420302E33392C312E303420302C312E3433202D302E31392C302E3139202D302E34352C302E3239202D302E37312C302E3239202D302E32372C3020';
wwv_flow_api.g_varchar2_table(421) := '2D302E35332C2D302E31202D302E37322C2D302E32396C2D362E3132202D362E3133202D362E313320362E3133632D302E31392C302E3139202D302E34342C302E3239202D302E37312C302E3239202D302E32372C30202D302E35322C2D302E31202D30';
wwv_flow_api.g_varchar2_table(422) := '2E37312C2D302E3239202D302E33392C2D302E3339202D302E33392C2D312E303320302C2D312E34336C362E3133202D362E3132202D362E3133202D362E3133632D302E33392C2D302E3339202D302E33392C2D312E303320302C2D312E343220302E33';
wwv_flow_api.g_varchar2_table(423) := '392C2D302E333920312E30332C2D302E333920312E34322C306C362E313320362E313220362E3132202D362E313263302E342C2D302E333920312E30342C2D302E333920312E34332C3020302E33392C302E333920302E33392C312E303320302C312E34';
wwv_flow_api.g_varchar2_table(424) := '326C2D362E313320362E31337A5C222F3E3C2F673E3C2F7376673E223A225761726E696E67223D3D3D733F223C73766720636C6173733D5C226E6D695C2220786D6C6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C2220';
wwv_flow_api.g_varchar2_table(425) := '786D6C3A73706163653D5C2270726573657276655C222077696474683D5C22343070785C22206865696768743D5C22343070785C222076657273696F6E3D5C22312E315C22207374796C653D5C2273686170652D72656E646572696E673A67656F6D6574';
wwv_flow_api.g_varchar2_table(426) := '726963507265636973696F6E3B20746578742D72656E646572696E673A67656F6D6574726963507265636973696F6E3B20696D6167652D72656E646572696E673A6F7074696D697A655175616C6974793B2066696C6C2D72756C653A6576656E6F64643B';
wwv_flow_api.g_varchar2_table(427) := '20636C69702D72756C653A6576656E6F64645C2276696577426F783D5C223020302034302034305C22786D6C6E733A786C696E6B3D5C22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B5C223E3C646566733E3C7374796C652074';
wwv_flow_api.g_varchar2_table(428) := '7970653D5C22746578742F6373735C223E234E6F7469666C69782D49636F6E2D5761726E696E677B66696C6C3A222B702E6E6F7469666C697849636F6E436F6C6F722B227D3C2F7374796C653E3C2F646566733E3C673E3C706174682069643D5C224E6F';
wwv_flow_api.g_varchar2_table(429) := '7469666C69782D49636F6E2D5761726E696E675C2220643D5C224D32312E393120332E34386C31372E382033302E383963302E38342C312E3436202D302E32332C332E3235202D312E39312C332E32356C2D33352E362030632D312E36382C30202D322E';
wwv_flow_api.g_varchar2_table(430) := '37352C2D312E3739202D312E39312C2D332E32356C31372E38202D33302E383963302E38352C2D312E343720322E39372C2D312E343720332E38322C307A6D31362E31352033312E38346C2D31372E38202D33302E3839632D302E31312C2D302E32202D';
wwv_flow_api.g_varchar2_table(431) := '302E34312C2D302E32202D302E35322C306C2D31372E382033302E3839632D302E31322C302E3220302E30352C302E3420302E32362C302E346C33352E36203063302E32312C3020302E33382C2D302E3220302E32362C2D302E347A6D2D31392E303120';
wwv_flow_api.g_varchar2_table(432) := '2D342E31326C30202D312E303563302C2D302E353320302E34322C2D302E393520302E39352C2D302E393520302E35332C3020302E39352C302E343220302E39352C302E39356C3020312E303563302C302E3533202D302E34322C302E3935202D302E39';
wwv_flow_api.g_varchar2_table(433) := '352C302E3935202D302E35332C30202D302E39352C2D302E3432202D302E39352C2D302E39357A6D30202D342E36366C30202D31332E333963302C2D302E353220302E34322C2D302E393520302E39352C2D302E393520302E35332C3020302E39352C30';
wwv_flow_api.g_varchar2_table(434) := '2E343320302E39352C302E39356C302031332E333963302C302E3533202D302E34322C302E3936202D302E39352C302E3936202D302E35332C30202D302E39352C2D302E3433202D302E39352C2D302E39367A5C222F3E3C2F673E3C2F7376673E223A22';
wwv_flow_api.g_varchar2_table(435) := '496E666F223D3D3D733F223C73766720636C6173733D5C226E6D695C2220786D6C6E733D5C22687474703A2F2F7777772E77332E6F72672F323030302F7376675C2220786D6C3A73706163653D5C2270726573657276655C222077696474683D5C223430';
wwv_flow_api.g_varchar2_table(436) := '70785C22206865696768743D5C22343070785C222076657273696F6E3D5C22312E315C22207374796C653D5C2273686170652D72656E646572696E673A67656F6D6574726963507265636973696F6E3B20746578742D72656E646572696E673A67656F6D';
wwv_flow_api.g_varchar2_table(437) := '6574726963507265636973696F6E3B20696D6167652D72656E646572696E673A6F7074696D697A655175616C6974793B2066696C6C2D72756C653A6576656E6F64643B20636C69702D72756C653A6576656E6F64645C2276696577426F783D5C22302030';
wwv_flow_api.g_varchar2_table(438) := '2034302034305C22786D6C6E733A786C696E6B3D5C22687474703A2F2F7777772E77332E6F72672F313939392F786C696E6B5C223E3C646566733E3C7374796C6520747970653D5C22746578742F6373735C223E234E6F7469666C69782D49636F6E2D49';
wwv_flow_api.g_varchar2_table(439) := '6E666F7B66696C6C3A222B702E6E6F7469666C697849636F6E436F6C6F722B227D3C2F7374796C653E3C2F646566733E3C673E3C706174682069643D5C224E6F7469666C69782D49636F6E2D496E666F5C2220643D5C224D323020306331312E30332C30';
wwv_flow_api.g_varchar2_table(440) := '2032302C382E39372032302C323020302C31312E3033202D382E39372C3230202D32302C3230202D31312E30332C30202D32302C2D382E3937202D32302C2D323020302C2D31312E303320382E39372C2D32302032302C2D32307A6D302033372E393863';
wwv_flow_api.g_varchar2_table(441) := '392E39322C302031372E39382C2D382E30362031372E39382C2D31372E393820302C2D392E3932202D382E30362C2D31372E3938202D31372E39382C2D31372E3938202D392E39322C30202D31372E39382C382E3036202D31372E39382C31372E393820';
wwv_flow_api.g_varchar2_table(442) := '302C392E393220382E30362C31372E39382031372E39382C31372E39387A6D2D302E3939202D32332E3363302C2D302E353420302E34342C2D302E393820302E39392C2D302E393820302E35352C3020302E39392C302E343420302E39392C302E39386C';
wwv_flow_api.g_varchar2_table(443) := '302031352E383663302C302E3535202D302E34342C302E3939202D302E39392C302E3939202D302E35352C30202D302E39392C2D302E3434202D302E39392C2D302E39396C30202D31352E38367A6D30202D352E323263302C2D302E353520302E34342C';
wwv_flow_api.g_varchar2_table(444) := '2D302E393920302E39392C2D302E393920302E35352C3020302E39392C302E343420302E39392C302E39396C3020312E303963302C302E3534202D302E34342C302E3939202D302E39392C302E3939202D302E35352C30202D302E39392C2D302E343520';
wwv_flow_api.g_varchar2_table(445) := '2D302E39392C2D302E39396C30202D312E30397A5C222F3E3C2F673E3C2F7376673E223A22222C662E696E6E657248544D4C3D622B223C7370616E20636C6173733D5C227468652D6D65737361676520776974682D69636F6E5C223E222B612B223C2F73';
wwv_flow_api.g_varchar2_table(446) := '70616E3E222B28652E636C6F7365427574746F6E3F753A2222297D696628226C6566742D626F74746F6D223D3D3D652E706F736974696F6E7C7C2272696768742D626F74746F6D223D3D3D652E706F736974696F6E297B766172206B3D742E646F63756D';
wwv_flow_api.g_varchar2_table(447) := '656E742E676574456C656D656E744279496428642E6964293B6B2E696E736572744265666F726528662C6B2E66697273744368696C64297D656C736520742E646F63756D656E742E676574456C656D656E744279496428642E6964292E617070656E6443';
wwv_flow_api.g_varchar2_table(448) := '68696C642866293B76617220773D742E646F63756D656E742E676574456C656D656E744279496428662E6964293B69662877297B76617220762C4E3D742E646F63756D656E742E676574456C656D656E744279496428642E6964293B652E6261636B4F76';
wwv_flow_api.g_varchar2_table(449) := '65726C6179262628763D742E646F63756D656E742E676574456C656D656E744279496428672E696429293B76617220432C7A2C533D66756E6374696F6E28297B772E636C6173734C6973742E616464282272656D6F766522292C652E6261636B4F766572';
wwv_flow_api.g_varchar2_table(450) := '6C61792626303E3D4E2E6368696C64456C656D656E74436F756E742626762E636C6173734C6973742E616464282272656D6F766522292C636C65617254696D656F75742843297D2C493D66756E6374696F6E28297B7726266E756C6C213D3D772E706172';
wwv_flow_api.g_varchar2_table(451) := '656E744E6F64652626772E706172656E744E6F64652E72656D6F76654368696C642877292C303E3D4E2E6368696C64456C656D656E74436F756E7426266E756C6C213D3D4E2E706172656E744E6F64652626284E2E706172656E744E6F64652E72656D6F';
wwv_flow_api.g_varchar2_table(452) := '76654368696C64284E292C652E6261636B4F7665726C617926266E756C6C213D3D762E706172656E744E6F64652626762E706172656E744E6F64652E72656D6F76654368696C64287629292C636C65617254696D656F7574287A297D3B696628652E636C';
wwv_flow_api.g_varchar2_table(453) := '6F7365427574746F6E26262266756E6374696F6E22213D747970656F66206E297B766172204C3D742E646F63756D656E742E676574456C656D656E744279496428662E6964292E717565727953656C6563746F72416C6C28227370616E2E6E6F74696679';
wwv_flow_api.g_varchar2_table(454) := '2D636C6F73652D627574746F6E22295B305D3B4C2E6164644576656E744C697374656E65722822636C69636B222C66756E6374696F6E28297B5328293B76617220743D73657454696D656F75742866756E6374696F6E28297B4928292C636C6561725469';
wwv_flow_api.g_varchar2_table(455) := '6D656F75742874297D2C652E637373416E696D6174696F6E4475726174696F6E297D297D696628282266756E6374696F6E223D3D747970656F66206E7C7C652E636C69636B546F436C6F7365292626772E6164644576656E744C697374656E6572282263';
wwv_flow_api.g_varchar2_table(456) := '6C69636B222C66756E6374696F6E28297B2266756E6374696F6E223D3D747970656F66206E262628422D2D2C6E2829292C5328293B76617220743D73657454696D656F75742866756E6374696F6E28297B4928292C636C65617254696D656F7574287429';
wwv_flow_api.g_varchar2_table(457) := '7D2C652E637373416E696D6174696F6E4475726174696F6E297D292C21652E636C6F7365427574746F6E26262266756E6374696F6E22213D747970656F66206E297B766172204D3D66756E6374696F6E28297B433D73657454696D656F75742866756E63';
wwv_flow_api.g_varchar2_table(458) := '74696F6E28297B5328297D2C652E74696D656F7574292C7A3D73657454696D656F75742866756E6374696F6E28297B4928297D2C652E74696D656F75742B652E637373416E696D6174696F6E4475726174696F6E297D3B4D28292C652E70617573654F6E';
wwv_flow_api.g_varchar2_table(459) := '486F766572262628772E6164644576656E744C697374656E657228226D6F757365656E746572222C66756E6374696F6E28297B772E636C6173734C6973742E61646428226E782D70617573656422292C636C65617254696D656F75742843292C636C6561';
wwv_flow_api.g_varchar2_table(460) := '7254696D656F7574287A297D292C772E6164644576656E744C697374656E657228226D6F7573656C65617665222C66756E6374696F6E28297B772E636C6173734C6973742E72656D6F766528226E782D70617573656422292C4D28297D29297D7D696628';
wwv_flow_api.g_varchar2_table(461) := '652E73686F774F6E6C795468654C6173744F6E652626303C5229666F722876617220412C583D742E646F63756D656E742E717565727953656C6563746F72416C6C28225B69645E3D222B652E49442B222D5D3A6E6F74285B69643D222B652E49442B222D';
wwv_flow_api.g_varchar2_table(462) := '222B522B225D2922292C463D303B463C582E6C656E6774683B462B2B29413D585B465D2C6E756C6C213D3D412E706172656E744E6F64652626412E706172656E744E6F64652E72656D6F76654368696C642841293B653D792821302C652C63297D2C453D';
wwv_flow_api.g_varchar2_table(463) := '66756E6374696F6E28652C6E2C692C6F2C732C6C297B69662821782822626F647922292972657475726E21313B617C7C6A2E5265706F72742E496E6974287B7D293B766172206D3D7B7D3B696628226F626A656374223D3D747970656F66206F26262141';
wwv_flow_api.g_varchar2_table(464) := '727261792E69734172726179286F297C7C226F626A656374223D3D747970656F66207326262141727261792E69734172726179287329297B76617220703D7B7D3B226F626A656374223D3D747970656F66206F3F703D6F3A226F626A656374223D3D7479';
wwv_flow_api.g_varchar2_table(465) := '70656F662073262628703D73292C6D3D792821302C612C7B7D292C613D792821302C612C70297D76617220643D615B6C2E746F4C6F63616C654C6F776572436173652822656E22295D3B22737472696E6722213D747970656F662065262628653D224E6F';
wwv_flow_api.g_varchar2_table(466) := '7469666C697820222B6C292C22737472696E6722213D747970656F66206E2626282253756363657373223D3D3D6C3F6E3D225C22446F206E6F742074727920746F206265636F6D65206120706572736F6E206F6620737563636573732062757420747279';
wwv_flow_api.g_varchar2_table(467) := '20746F206265636F6D65206120706572736F6E206F662076616C75652E5C22203C62723E3C62723E2D20416C626572742045696E737465696E223A224661696C757265223D3D3D6C3F6E3D225C224661696C7572652069732073696D706C792074686520';
wwv_flow_api.g_varchar2_table(468) := '6F70706F7274756E69747920746F20626567696E20616761696E2C20746869732074696D65206D6F726520696E74656C6C6967656E746C792E5C22203C62723E3C62723E2D2048656E727920466F7264223A225761726E696E67223D3D3D6C3F6E3D225C';
wwv_flow_api.g_varchar2_table(469) := '225468652070656F706C65732077686F2077616E7420746F206C69766520636F6D666F727461626C7920776974686F75742070726F647563696E6720616E6420666174696775653B20746865792061726520646F6F6D656420746F206C6F736520746865';
wwv_flow_api.g_varchar2_table(470) := '6972206469676E6974792C207468656E206C6962657274792C20616E64207468656E20696E646570656E64656E636520616E642064657374696E792E5C22203C62723E3C62723E2D204D757374616661204B656D616C204174617475726B223A22496E66';
wwv_flow_api.g_varchar2_table(471) := '6F223D3D6C2626286E3D225C224B6E6F776C65646765207265737473206E6F742075706F6E20747275746820616C6F6E652C206275742075706F6E206572726F7220616C736F2E5C22203C62723E3C62723E2D204361726C20477573746176204A756E67';
wwv_flow_api.g_varchar2_table(472) := '2229292C22737472696E6722213D747970656F662069262628693D224F6B617922292C612E706C61696E54657874262628653D682865292C6E3D68286E292C693D68286929292C612E706C61696E546578747C7C28652E6C656E6774683E612E7469746C';
wwv_flow_api.g_varchar2_table(473) := '654D61784C656E677468262628653D2248544D4C2054616773204572726F72222C6E3D22596F7572205469746C6520636F6E74656E74206C656E677468206973206D6F7265207468616E205C227469746C654D61784C656E6774685C22206F7074696F6E';
wwv_flow_api.g_varchar2_table(474) := '2E222C693D224F6B617922292C6E2E6C656E6774683E612E6D6573736167654D61784C656E677468262628653D2248544D4C2054616773204572726F72222C6E3D22596F7572204D65737361676520636F6E74656E74206C656E677468206973206D6F72';
wwv_flow_api.g_varchar2_table(475) := '65207468616E205C226D6573736167654D61784C656E6774685C22206F7074696F6E2E222C693D224F6B617922292C692E6C656E6774683E612E627574746F6E4D61784C656E677468262628653D2248544D4C2054616773204572726F72222C6E3D2259';
wwv_flow_api.g_varchar2_table(476) := '6F757220427574746F6E20636F6E74656E74206C656E677468206973206D6F7265207468616E205C22627574746F6E4D61784C656E6774685C22206F7074696F6E2E222C693D224F6B61792229292C652E6C656E6774683E612E7469746C654D61784C65';
wwv_flow_api.g_varchar2_table(477) := '6E677468262628653D652E737562737472696E6728302C612E7469746C654D61784C656E677468292B222E2E2E22292C6E2E6C656E6774683E612E6D6573736167654D61784C656E6774682626286E3D6E2E737562737472696E6728302C612E6D657373';
wwv_flow_api.g_varchar2_table(478) := '6167654D61784C656E677468292B222E2E2E22292C692E6C656E6774683E612E627574746F6E4D61784C656E677468262628693D692E737562737472696E6728302C612E627574746F6E4D61784C656E677468292B222E2E2E22292C612E637373416E69';
wwv_flow_api.g_varchar2_table(479) := '6D6174696F6E7C7C28612E637373416E696D6174696F6E4475726174696F6E3D30293B76617220673D742E646F63756D656E742E637265617465456C656D656E74282264697622293B672E69643D632E49442C672E636C6173734E616D653D612E636C61';
wwv_flow_api.g_varchar2_table(480) := '73734E616D652C672E7374796C652E7A496E6465783D612E7A696E6465782C672E7374796C652E626F726465725261646975733D612E626F726465725261646975732C672E7374796C652E666F6E7446616D696C793D225C22222B612E666F6E7446616D';
wwv_flow_api.g_varchar2_table(481) := '696C792B225C222C20222B722C612E72746C262628672E7365744174747269627574652822646972222C2272746C22292C672E636C6173734C6973742E616464282272746C2D6F6E2229292C672E7374796C652E646973706C61793D22666C6578222C67';
wwv_flow_api.g_varchar2_table(482) := '2E7374796C652E666C6578577261703D2277726170222C672E7374796C652E666C6578446972656374696F6E3D22636F6C756D6E222C672E7374796C652E616C69676E4974656D733D2263656E746572222C672E7374796C652E6A757374696679436F6E';
wwv_flow_api.g_varchar2_table(483) := '74656E743D2263656E746572223B76617220663D22223B612E6261636B4F7665726C6179262628663D223C64697620636C6173733D5C22222B612E636C6173734E616D652B222D6F7665726C6179222B28612E637373416E696D6174696F6E3F22207769';
wwv_flow_api.g_varchar2_table(484) := '74682D616E696D6174696F6E223A2222292B225C22207374796C653D5C226261636B67726F756E643A222B28642E6261636B4F7665726C6179436F6C6F727C7C612E6261636B4F7665726C6179436F6C6F72292B223B616E696D6174696F6E2D64757261';
wwv_flow_api.g_varchar2_table(485) := '74696F6E3A222B612E637373416E696D6174696F6E4475726174696F6E2B226D733B5C223E3C2F6469763E22293B76617220753D22223B6966282253756363657373223D3D3D6C3F753D7728612E73766753697A652C642E737667436F6C6F72293A2246';
wwv_flow_api.g_varchar2_table(486) := '61696C757265223D3D3D6C3F753D7628612E73766753697A652C642E737667436F6C6F72293A225761726E696E67223D3D3D6C3F753D4E28612E73766753697A652C642E737667436F6C6F72293A22496E666F223D3D6C262628753D4328612E73766753';
wwv_flow_api.g_varchar2_table(487) := '697A652C642E737667436F6C6F7229292C672E696E6E657248544D4C3D662B223C64697620636C6173733D5C22222B612E636C6173734E616D652B222D636F6E74656E74222B28612E637373416E696D6174696F6E3F2220776974682D616E696D617469';
wwv_flow_api.g_varchar2_table(488) := '6F6E20223A2222292B22206E782D222B612E637373416E696D6174696F6E5374796C652B225C22207374796C653D5C2277696474683A222B612E77696474682B223B206261636B67726F756E643A222B612E6261636B67726F756E64436F6C6F722B223B';
wwv_flow_api.g_varchar2_table(489) := '20616E696D6174696F6E2D6475726174696F6E3A222B612E637373416E696D6174696F6E4475726174696F6E2B226D733B5C223E3C646976207374796C653D5C2277696474683A222B612E73766753697A652B223B206865696768743A222B612E737667';
wwv_flow_api.g_varchar2_table(490) := '53697A652B223B5C2220636C6173733D5C22222B612E636C6173734E616D652B222D69636F6E5C223E222B752B223C2F6469763E3C683520636C6173733D5C22222B612E636C6173734E616D652B222D7469746C655C22207374796C653D5C22666F6E74';
wwv_flow_api.g_varchar2_table(491) := '2D7765696768743A3530303B20666F6E742D73697A653A222B612E7469746C65466F6E7453697A652B223B20636F6C6F723A222B642E7469746C65436F6C6F722B223B5C223E222B652B223C2F68353E3C7020636C6173733D5C22222B612E636C617373';
wwv_flow_api.g_varchar2_table(492) := '4E616D652B222D6D6573736167655C22207374796C653D5C22666F6E742D73697A653A222B612E6D657373616765466F6E7453697A652B223B20636F6C6F723A222B642E6D657373616765436F6C6F722B223B5C223E222B6E2B223C2F703E3C61206964';
wwv_flow_api.g_varchar2_table(493) := '3D5C224E585265706F7274427574746F6E5C2220636C6173733D5C22222B612E636C6173734E616D652B222D627574746F6E5C22207374796C653D5C22666F6E742D7765696768743A3530303B20666F6E742D73697A653A222B612E627574746F6E466F';
wwv_flow_api.g_varchar2_table(494) := '6E7453697A652B223B206261636B67726F756E643A222B642E627574746F6E4261636B67726F756E642B223B20636F6C6F723A222B642E627574746F6E436F6C6F722B223B5C223E222B692B223C2F613E3C2F6469763E222C21742E646F63756D656E74';
wwv_flow_api.g_varchar2_table(495) := '2E676574456C656D656E744279496428672E696429297B742E646F63756D656E742E626F64792E617070656E644368696C642867293B76617220623D742E646F63756D656E742E676574456C656D656E744279496428672E6964292C6B3D742E646F6375';
wwv_flow_api.g_varchar2_table(496) := '6D656E742E676574456C656D656E744279496428224E585265706F7274427574746F6E22293B6B2E6164644576656E744C697374656E65722822636C69636B222C66756E6374696F6E28297B2266756E6374696F6E223D3D747970656F66206F26266F28';
wwv_flow_api.g_varchar2_table(497) := '292C622E636C6173734C6973742E616464282272656D6F766522293B76617220743D73657454696D656F75742866756E6374696F6E28297B6E756C6C213D3D622E706172656E744E6F64652626622E706172656E744E6F64652E72656D6F76654368696C';
wwv_flow_api.g_varchar2_table(498) := '642862292C636C65617254696D656F75742874297D2C612E637373416E696D6174696F6E4475726174696F6E297D297D613D792821302C612C6D297D2C443D66756E6374696F6E28652C612C692C6F2C732C6C2C632C702C64297B69662821782822626F';
wwv_flow_api.g_varchar2_table(499) := '647922292972657475726E21313B6E7C7C6A2E436F6E6669726D2E496E6974287B7D293B76617220673D792821302C6E2C7B7D293B226F626A65637422213D747970656F6620637C7C41727261792E697341727261792863297C7C286E3D792821302C6E';
wwv_flow_api.g_varchar2_table(500) := '2C6329292C22737472696E6722213D747970656F662065262628653D224E6F7469666C697820436F6E6669726D22292C22737472696E6722213D747970656F662061262628613D22446F20796F752061677265652077697468206D653F22292C22737472';
wwv_flow_api.g_varchar2_table(501) := '696E6722213D747970656F662069262628693D2259657322292C22737472696E6722213D747970656F66206F2626286F3D224E6F22292C2266756E6374696F6E22213D747970656F662073262628733D766F69642030292C2266756E6374696F6E22213D';
wwv_flow_api.g_varchar2_table(502) := '747970656F66206C2626286C3D766F69642030292C6E2E706C61696E54657874262628653D682865292C613D682861292C693D682869292C6F3D68286F29292C6E2E706C61696E546578747C7C28652E6C656E6774683E6E2E7469746C654D61784C656E';
wwv_flow_api.g_varchar2_table(503) := '677468262628653D2248544D4C2054616773204572726F72222C613D22596F7572205469746C6520636F6E74656E74206C656E677468206973206D6F7265207468616E205C227469746C654D61784C656E6774685C22206F7074696F6E2E222C693D224F';
wwv_flow_api.g_varchar2_table(504) := '6B6179222C6F3D222E2E2E22292C612E6C656E6774683E6E2E6D6573736167654D61784C656E677468262628653D2248544D4C2054616773204572726F72222C613D22596F7572204D65737361676520636F6E74656E74206C656E677468206973206D6F';
wwv_flow_api.g_varchar2_table(505) := '7265207468616E205C226D6573736167654D61784C656E6774685C22206F7074696F6E2E222C693D224F6B6179222C6F3D222E2E2E22292C28692E6C656E6774687C7C6F2E6C656E677468293E6E2E627574746F6E734D61784C656E677468262628653D';
wwv_flow_api.g_varchar2_table(506) := '2248544D4C2054616773204572726F72222C613D22596F757220427574746F6E7320636F6E74656E7473206C656E677468206973206D6F7265207468616E205C22627574746F6E734D61784C656E6774685C22206F7074696F6E2E222C693D224F6B6179';
wwv_flow_api.g_varchar2_table(507) := '222C6F3D222E2E2E2229292C652E6C656E6774683E6E2E7469746C654D61784C656E677468262628653D652E737562737472696E6728302C6E2E7469746C654D61784C656E677468292B222E2E2E22292C612E6C656E6774683E6E2E6D6573736167654D';
wwv_flow_api.g_varchar2_table(508) := '61784C656E677468262628613D612E737562737472696E6728302C6E2E6D6573736167654D61784C656E677468292B222E2E2E22292C692E6C656E6774683E6E2E627574746F6E734D61784C656E677468262628693D692E737562737472696E6728302C';
wwv_flow_api.g_varchar2_table(509) := '6E2E627574746F6E734D61784C656E677468292B222E2E2E22292C6F2E6C656E6774683E6E2E627574746F6E734D61784C656E6774682626286F3D6F2E737562737472696E6728302C6E2E627574746F6E734D61784C656E677468292B222E2E2E22292C';
wwv_flow_api.g_varchar2_table(510) := '6E2E637373416E696D6174696F6E7C7C286E2E637373416E696D6174696F6E4475726174696F6E3D30293B76617220663D742E646F63756D656E742E637265617465456C656D656E74282264697622293B662E69643D6D2E49442C662E636C6173734E61';
wwv_flow_api.g_varchar2_table(511) := '6D653D6E2E636C6173734E616D652B286E2E637373416E696D6174696F6E3F2220776974682D616E696D6174696F6E206E782D222B6E2E637373416E696D6174696F6E5374796C653A2222292C662E7374796C652E7A496E6465783D6E2E7A696E646578';
wwv_flow_api.g_varchar2_table(512) := '2C662E7374796C652E70616464696E673D6E2E64697374616E63652C6E2E72746C262628662E7365744174747269627574652822646972222C2272746C22292C662E636C6173734C6973742E616464282272746C2D6F6E2229293B76617220753D227374';
wwv_flow_api.g_varchar2_table(513) := '72696E67223D3D747970656F66206E2E706F736974696F6E3F6E2E706F736974696F6E2E7472696D28293A2263656E746572223B662E636C6173734C6973742E61646428226E782D706F736974696F6E2D222B75292C662E7374796C652E666F6E744661';
wwv_flow_api.g_varchar2_table(514) := '6D696C793D225C22222B6E2E666F6E7446616D696C792B225C222C20222B723B76617220623D22223B6E2E6261636B4F7665726C6179262628623D223C64697620636C6173733D5C22222B6E2E636C6173734E616D652B222D6F7665726C6179222B286E';
wwv_flow_api.g_varchar2_table(515) := '2E637373416E696D6174696F6E3F2220776974682D616E696D6174696F6E223A2222292B225C22207374796C653D5C226261636B67726F756E643A222B6E2E6261636B4F7665726C6179436F6C6F722B223B616E696D6174696F6E2D6475726174696F6E';
wwv_flow_api.g_varchar2_table(516) := '3A222B6E2E637373416E696D6174696F6E4475726174696F6E2B226D733B5C223E3C2F6469763E22293B766172206B3D22223B2266756E6374696F6E223D3D747970656F6620732626286B3D223C612069643D5C224E58436F6E6669726D427574746F6E';
wwv_flow_api.g_varchar2_table(517) := '43616E63656C5C2220636C6173733D5C22636F6E6669726D2D627574746F6E2D63616E63656C5C22207374796C653D5C22636F6C6F723A222B6E2E63616E63656C427574746F6E436F6C6F722B223B6261636B67726F756E643A222B6E2E63616E63656C';
wwv_flow_api.g_varchar2_table(518) := '427574746F6E4261636B67726F756E642B223B666F6E742D73697A653A222B6E2E627574746F6E73466F6E7453697A652B223B5C223E222B6F2B223C2F613E22293B76617220773D22222C763D21313B69662870262622737472696E67223D3D74797065';
wwv_flow_api.g_varchar2_table(519) := '6F6620642626303C642E6C656E677468262628763D642C773D223C6469763E3C696E7075742069643D5C224E58436F6E6669726D56616C69646174696F6E496E7075745C2220747970653D5C22746578745C22207374796C653D5C22666F6E742D73697A';
wwv_flow_api.g_varchar2_table(520) := '653A222B6E2E6D657373616765466F6E7453697A652B223B626F726465722D7261646975733A20222B6E2E626F726465725261646975732B223B5C22206D61786C656E6774683D5C22222B642E6C656E6774682B225C22206175746F636F6D706C657465';
wwv_flow_api.g_varchar2_table(521) := '3D5C226F66665C22207370656C6C636865636B3D5C2266616C73655C22206175746F6361706974616C697A653D5C226E6F6E655C22202F3E3C2F6469763E22292C662E696E6E657248544D4C3D622B223C64697620636C6173733D5C22222B6E2E636C61';
wwv_flow_api.g_varchar2_table(522) := '73734E616D652B222D636F6E74656E745C22207374796C653D5C2277696474683A222B6E2E77696474682B223B206261636B67726F756E643A222B6E2E6261636B67726F756E64436F6C6F722B223B20616E696D6174696F6E2D6475726174696F6E3A22';
wwv_flow_api.g_varchar2_table(523) := '2B6E2E637373416E696D6174696F6E4475726174696F6E2B226D733B20626F726465722D7261646975733A20222B6E2E626F726465725261646975732B223B5C223E3C64697620636C6173733D5C22222B6E2E636C6173734E616D652B222D686561645C';
wwv_flow_api.g_varchar2_table(524) := '223E3C6835207374796C653D5C22636F6C6F723A222B6E2E7469746C65436F6C6F722B223B666F6E742D73697A653A222B6E2E7469746C65466F6E7453697A652B223B5C223E222B652B223C2F68353E3C646976207374796C653D5C22636F6C6F723A22';
wwv_flow_api.g_varchar2_table(525) := '2B6E2E6D657373616765436F6C6F722B223B666F6E742D73697A653A222B6E2E6D657373616765466F6E7453697A652B223B5C223E222B612B772B223C2F6469763E3C2F6469763E3C64697620636C6173733D5C22222B6E2E636C6173734E616D652B22';
wwv_flow_api.g_varchar2_table(526) := '2D627574746F6E735C223E3C612069643D5C224E58436F6E6669726D427574746F6E4F6B5C2220636C6173733D5C22636F6E6669726D2D627574746F6E2D6F6B222B282266756E6374696F6E223D3D747970656F6620733F22223A222066756C6C22292B';
wwv_flow_api.g_varchar2_table(527) := '225C22207374796C653D5C22636F6C6F723A222B6E2E6F6B427574746F6E436F6C6F722B223B6261636B67726F756E643A222B6E2E6F6B427574746F6E4261636B67726F756E642B223B666F6E742D73697A653A222B6E2E627574746F6E73466F6E7453';
wwv_flow_api.g_varchar2_table(528) := '697A652B223B5C223E222B692B223C2F613E222B6B2B223C2F6469763E3C2F6469763E222C21742E646F63756D656E742E676574456C656D656E744279496428662E696429297B742E646F63756D656E742E626F64792E617070656E644368696C642866';
wwv_flow_api.g_varchar2_table(529) := '293B766172204E3D742E646F63756D656E742E676574456C656D656E744279496428662E6964292C433D742E646F63756D656E742E676574456C656D656E744279496428224E58436F6E6669726D427574746F6E4F6B22292C7A3D742E646F63756D656E';
wwv_flow_api.g_varchar2_table(530) := '742E676574456C656D656E744279496428224E58436F6E6669726D56616C69646174696F6E496E70757422293B6966287A2626287A2E666F63757328292C7A2E6164644576656E744C697374656E657228226B65797570222C66756E6374696F6E287429';
wwv_flow_api.g_varchar2_table(531) := '7B76617220653D28742E7461726765742E76616C75657C7C2222292E746F537472696E6728293B69662865213D3D76297A2E636C6173734C6973742E61646428226E782D76616C69646174696F6E2D6661696C75726522292C7A2E636C6173734C697374';
wwv_flow_api.g_varchar2_table(532) := '2E72656D6F766528226E782D76616C69646174696F6E2D7375636365737322293B656C73657B7A2E636C6173734C6973742E72656D6F766528226E782D76616C69646174696F6E2D6661696C75726522292C7A2E636C6173734C6973742E61646428226E';
wwv_flow_api.g_varchar2_table(533) := '782D76616C69646174696F6E2D7375636365737322293B76617220613D22656E746572223D3D3D28742E6B65797C7C2222292E746F4C6F63616C654C6F776572436173652822656E22297C7C31333D3D3D742E6B6579436F64653B612626432E64697370';
wwv_flow_api.g_varchar2_table(534) := '617463684576656E74286E6577204576656E742822636C69636B2229297D7D29292C432E6164644576656E744C697374656E65722822636C69636B222C66756E6374696F6E2874297B6966287026267626267A297B76617220653D287A2E76616C75657C';
wwv_flow_api.g_varchar2_table(535) := '7C2222292E746F537472696E6728293B69662865213D3D762972657475726E207A2E666F63757328292C7A2E636C6173734C6973742E61646428226E782D76616C69646174696F6E2D6661696C75726522292C742E73746F7050726F7061676174696F6E';
wwv_flow_api.g_varchar2_table(536) := '28292C742E70726576656E7444656661756C7428292C742E72657475726E56616C75653D21312C742E63616E63656C427562626C653D21302C21313B7A2E636C6173734C6973742E72656D6F766528226E782D76616C69646174696F6E2D6661696C7572';
wwv_flow_api.g_varchar2_table(537) := '6522297D2266756E6374696F6E223D3D747970656F66207326267328292C4E2E636C6173734C6973742E616464282272656D6F766522293B76617220613D73657454696D656F75742866756E6374696F6E28297B6E756C6C213D3D4E2E706172656E744E';
wwv_flow_api.g_varchar2_table(538) := '6F64652626284E2E706172656E744E6F64652E72656D6F76654368696C64284E292C636C65617254696D656F7574286129297D2C6E2E637373416E696D6174696F6E4475726174696F6E297D292C2266756E6374696F6E223D3D747970656F662073297B';
wwv_flow_api.g_varchar2_table(539) := '76617220533D742E646F63756D656E742E676574456C656D656E744279496428224E58436F6E6669726D427574746F6E43616E63656C22293B532E6164644576656E744C697374656E65722822636C69636B222C66756E6374696F6E28297B2266756E63';
wwv_flow_api.g_varchar2_table(540) := '74696F6E223D3D747970656F66206C26266C28292C4E2E636C6173734C6973742E616464282272656D6F766522293B76617220743D73657454696D656F75742866756E6374696F6E28297B6E756C6C213D3D4E2E706172656E744E6F64652626284E2E70';
wwv_flow_api.g_varchar2_table(541) := '6172656E744E6F64652E72656D6F76654368696C64284E292C636C65617254696D656F7574287429297D2C6E2E637373416E696D6174696F6E4475726174696F6E297D297D7D6E3D792821302C6E2C67297D2C543D66756E6374696F6E28652C612C6E2C';
wwv_flow_api.g_varchar2_table(542) := '6F2C73297B69662821782822626F647922292972657475726E21313B697C7C6A2E4C6F6164696E672E496E6974287B7D293B766172206C3D792821302C692C7B7D293B696628226F626A656374223D3D747970656F66206526262141727261792E697341';
wwv_flow_api.g_varchar2_table(543) := '727261792865297C7C226F626A656374223D3D747970656F66206126262141727261792E69734172726179286129297B76617220633D7B7D3B226F626A656374223D3D747970656F6620653F633D653A226F626A656374223D3D747970656F6620612626';
wwv_flow_api.g_varchar2_table(544) := '28633D61292C693D792821302C692C63297D766172206D3D22223B69662822737472696E67223D3D747970656F6620652626303C652E6C656E6774682626286D3D65292C6F297B6D3D6D2E746F537472696E6728292E6C656E6774683E692E6D65737361';
wwv_flow_api.g_varchar2_table(545) := '67654D61784C656E6774683F68286D292E746F537472696E6728292E737562737472696E6728302C692E6D6573736167654D61784C656E677468292B222E2E2E223A68286D292E746F537472696E6728293B76617220643D22223B303C6D2E6C656E6774';
wwv_flow_api.g_varchar2_table(546) := '68262628643D223C702069643D5C22222B692E6D65737361676549442B225C2220636C6173733D5C226C6F6164696E672D6D6573736167655C22207374796C653D5C22636F6C6F723A222B692E6D657373616765436F6C6F722B223B666F6E742D73697A';
wwv_flow_api.g_varchar2_table(547) := '653A222B692E6D657373616765466F6E7453697A652B223B5C223E222B6D2B223C2F703E22292C692E637373416E696D6174696F6E7C7C28692E637373416E696D6174696F6E4475726174696F6E3D30293B76617220663D22223B696628227374616E64';
wwv_flow_api.g_varchar2_table(548) := '617264223D3D3D6E29663D7A28692E73766753697A652C692E737667436F6C6F72293B656C73652069662822686F7572676C617373223D3D3D6E29663D5328692E73766753697A652C692E737667436F6C6F72293B656C73652069662822636972636C65';
wwv_flow_api.g_varchar2_table(549) := '223D3D3D6E29663D4928692E73766753697A652C692E737667436F6C6F72293B656C736520696628226172726F7773223D3D3D6E29663D4C28692E73766753697A652C692E737667436F6C6F72293B656C73652069662822646F7473223D3D3D6E29663D';
wwv_flow_api.g_varchar2_table(550) := '4D28692E73766753697A652C692E737667436F6C6F72293B656C7365206966282270756C7365223D3D3D6E29663D4128692E73766753697A652C692E737667436F6C6F72293B656C73652069662822637573746F6D223D3D3D6E26266E756C6C213D3D69';
wwv_flow_api.g_varchar2_table(551) := '2E637573746F6D53766755726C29663D223C696D6720636C6173733D5C22637573746F6D2D6C6F6164696E672D69636F6E5C222077696474683D5C22222B692E73766753697A652B225C22206865696768743D5C22222B692E73766753697A652B225C22';
wwv_flow_api.g_varchar2_table(552) := '207372633D5C22222B692E637573746F6D53766755726C2B225C2220616C743D5C224E6F7469666C69785C223E223B656C73657B69662822637573746F6D223D3D3D6E26266E756C6C3D3D692E637573746F6D53766755726C2972657475726E20672822';
wwv_flow_api.g_varchar2_table(553) := '4E6F7469666C6978204572726F72222C22596F75206861766520746F20736574206120737461746963205356472075726C20746F205C22637573746F6D53766755726C5C22206F7074696F6E20746F20757365204C6F6164696E6720437573746F6D2E22';
wwv_flow_api.g_varchar2_table(554) := '292C21313B226E6F7469666C6978223D3D3D6E262628663D5828692E73766753697A652C2223663866386638222C22233332633638322229297D76617220753D7061727365496E742828692E73766753697A657C7C2222292E7265706C616365282F5B5E';
wwv_flow_api.g_varchar2_table(555) := '302D395D2F672C222229292C623D742E696E6E657257696474682C6B3D753E3D623F622D34302B227078223A752B227078222C773D223C646976207374796C653D5C2277696474683A222B6B2B223B206865696768743A222B6B2B223B5C2220636C6173';
wwv_flow_api.g_varchar2_table(556) := '733D5C22222B692E636C6173734E616D652B222D69636F6E222B28303C6D2E6C656E6774683F2220776974682D6D657373616765223A2222292B225C223E222B662B223C2F6469763E222C763D742E646F63756D656E742E637265617465456C656D656E';
wwv_flow_api.g_varchar2_table(557) := '74282264697622293B696628762E69643D702E49442C762E636C6173734E616D653D692E636C6173734E616D652B28692E637373416E696D6174696F6E3F2220776974682D616E696D6174696F6E223A2222292B28692E636C69636B546F436C6F73653F';
wwv_flow_api.g_varchar2_table(558) := '2220636C69636B2D746F2D636C6F7365223A2222292C762E7374796C652E7A496E6465783D692E7A696E6465782C762E7374796C652E6261636B67726F756E643D692E6261636B67726F756E64436F6C6F722C762E7374796C652E616E696D6174696F6E';
wwv_flow_api.g_varchar2_table(559) := '4475726174696F6E3D692E637373416E696D6174696F6E4475726174696F6E2B226D73222C762E7374796C652E666F6E7446616D696C793D225C22222B692E666F6E7446616D696C792B225C222C20222B722C762E7374796C652E646973706C61793D22';
wwv_flow_api.g_varchar2_table(560) := '666C6578222C762E7374796C652E666C6578577261703D2277726170222C762E7374796C652E666C6578446972656374696F6E3D22636F6C756D6E222C762E7374796C652E616C69676E4974656D733D2263656E746572222C762E7374796C652E6A7573';
wwv_flow_api.g_varchar2_table(561) := '74696679436F6E74656E743D2263656E746572222C692E72746C262628762E7365744174747269627574652822646972222C2272746C22292C762E636C6173734C6973742E616464282272746C2D6F6E2229292C762E696E6E657248544D4C3D772B642C';
wwv_flow_api.g_varchar2_table(562) := '21742E646F63756D656E742E676574456C656D656E744279496428762E696429262628742E646F63756D656E742E626F64792E617070656E644368696C642876292C692E636C69636B546F436C6F736529297B766172204E3D742E646F63756D656E742E';
wwv_flow_api.g_varchar2_table(563) := '676574456C656D656E744279496428762E6964293B4E2E6164644576656E744C697374656E65722822636C69636B222C66756E6374696F6E28297B762E636C6173734C6973742E616464282272656D6F766522293B76617220743D73657454696D656F75';
wwv_flow_api.g_varchar2_table(564) := '742866756E6374696F6E28297B6E756C6C213D3D762E706172656E744E6F6465262628762E706172656E744E6F64652E72656D6F76654368696C642876292C636C65617254696D656F7574287429297D2C692E637373416E696D6174696F6E4475726174';
wwv_flow_api.g_varchar2_table(565) := '696F6E297D297D7D656C736520696628742E646F63756D656E742E676574456C656D656E744279496428702E4944292976617220433D742E646F63756D656E742E676574456C656D656E744279496428702E4944292C523D73657454696D656F75742866';
wwv_flow_api.g_varchar2_table(566) := '756E6374696F6E28297B432E636C6173734C6973742E616464282272656D6F766522293B76617220743D73657454696D656F75742866756E6374696F6E28297B6E756C6C213D3D432E706172656E744E6F6465262628432E706172656E744E6F64652E72';
wwv_flow_api.g_varchar2_table(567) := '656D6F76654368696C642843292C636C65617254696D656F7574287429297D2C692E637373416E696D6174696F6E4475726174696F6E293B636C65617254696D656F75742852297D2C73293B693D792821302C692C6C297D2C4F3D66756E6374696F6E28';
wwv_flow_api.g_varchar2_table(568) := '65297B22737472696E6722213D747970656F662065262628653D2222293B76617220613D742E646F63756D656E742E676574456C656D656E744279496428702E4944293B6966286129696628303C652E6C656E677468297B653D652E6C656E6774683E69';
wwv_flow_api.g_varchar2_table(569) := '2E6D6573736167654D61784C656E6774683F682865292E737562737472696E6728302C692E6D6573736167654D61784C656E677468292B222E2E2E223A682865293B766172206E3D612E676574456C656D656E747342795461674E616D6528227022295B';
wwv_flow_api.g_varchar2_table(570) := '305D3B6966286E296E2E696E6E657248544D4C3D653B656C73657B766172206F3D742E646F63756D656E742E637265617465456C656D656E7428227022293B6F2E69643D692E6D65737361676549442C6F2E636C6173734E616D653D226C6F6164696E67';
wwv_flow_api.g_varchar2_table(571) := '2D6D657373616765206E65772D6C6F6164696E672D6D657373616765222C6F2E7374796C652E636F6C6F723D692E6D657373616765436F6C6F722C6F2E7374796C652E666F6E7453697A653D692E6D657373616765466F6E7453697A652C6F2E696E6E65';
wwv_flow_api.g_varchar2_table(572) := '7248544D4C3D652C612E617070656E644368696C64286F297D7D656C7365206728224E6F7469666C6978204572726F72222C22576865726520697320746865206E6577206D6573736167653F22297D2C573D302C483D66756E6374696F6E28652C612C6E';
wwv_flow_api.g_varchar2_table(573) := '2C732C6C2C63297B766172206D3D22737472696E6722213D747970656F6620617C7C313E28617C7C2222292E6C656E6774687C7C313D3D3D28617C7C2222292E6C656E6774682626282223223D3D3D28617C7C2222295B305D7C7C222E223D3D3D28617C';
wwv_flow_api.g_varchar2_table(574) := '7C2222295B305D293B6966286D2972657475726E206728224E6F7469666C6978204572726F72222C225468652073656C6563746F7220706172616D65746572206D757374206265206120537472696E6720616E64206D6174636865732061207370656369';
wwv_flow_api.g_varchar2_table(575) := '66696564204353532073656C6563746F722873292E22292C21313B76617220703D742E646F63756D656E742E717565727953656C6563746F72416C6C2861293B696628313E702E6C656E6774682972657475726E206728224E6F7469666C697820457272';
wwv_flow_api.g_varchar2_table(576) := '6F72222C22596F752063616C6C656420746865205C224E6F7469666C69782E426C6F636B2E2E2E5C222066756E6374696F6E2077697468205C22222B612B225C222073656C6563746F722C20627574207468657265206973206E6F207375636820656C65';
wwv_flow_api.g_varchar2_table(577) := '6D656E7428732920696E2074686520646F63756D656E742E22292C21313B6F7C7C6A2E426C6F636B2E496E6974287B7D293B76617220753D792821302C6F2C7B7D293B696628226F626A656374223D3D747970656F66207326262141727261792E697341';
wwv_flow_api.g_varchar2_table(578) := '727261792873297C7C226F626A656374223D3D747970656F66206C26262141727261792E69734172726179286C29297B76617220623D7B7D3B226F626A656374223D3D747970656F6620733F623D733A226F626A656374223D3D747970656F66206C2626';
wwv_flow_api.g_varchar2_table(579) := '28623D6C292C6F3D792821302C6F2C62297D766172206B3D22223B22737472696E67223D3D747970656F6620732626303C732E6C656E6774682626286B3D73292C6F2E637373416E696D6174696F6E7C7C286F2E637373416E696D6174696F6E44757261';
wwv_flow_api.g_varchar2_table(580) := '74696F6E3D30293B76617220773D226E6F7469666C69782D626C6F636B223B22737472696E67223D3D747970656F66206F2E636C6173734E616D65262628773D6F2E636C6173734E616D652E7472696D2829293B76617220763D226E756D626572223D3D';
wwv_flow_api.g_varchar2_table(581) := '747970656F66206F2E717565727953656C6563746F724C696D69743F6F2E717565727953656C6563746F724C696D69743A3230302C4E3D702E6C656E6774683E3D763F763A702E6C656E6774683B6966286529666F722876617220433D303B433C4E3B43';
wwv_flow_api.g_varchar2_table(582) := '2B2B297B76617220583D705B435D2C523D582E717565727953656C6563746F72416C6C28225B69645E3D222B642E49442B225D22293B696628313E522E6C656E677468297B76617220423D22223B6E26262822686F7572676C617373223D3D3D6E3F423D';
wwv_flow_api.g_varchar2_table(583) := '53286F2E73766753697A652C6F2E737667436F6C6F72293A22636972636C65223D3D3D6E3F423D49286F2E73766753697A652C6F2E737667436F6C6F72293A226172726F7773223D3D3D6E3F423D4C286F2E73766753697A652C6F2E737667436F6C6F72';
wwv_flow_api.g_varchar2_table(584) := '293A22646F7473223D3D3D6E3F423D4D286F2E73766753697A652C6F2E737667436F6C6F72293A2270756C7365223D3D3D6E3F423D41286F2E73766753697A652C6F2E737667436F6C6F72293A423D7A286F2E73766753697A652C6F2E737667436F6C6F';
wwv_flow_api.g_varchar2_table(585) := '7229293B76617220463D223C7370616E20636C6173733D5C22222B772B222D69636F6E5C22207374796C653D5C2277696474683A222B6F2E73766753697A652B223B6865696768743A222B6F2E73766753697A652B223B5C223E222B422B223C2F737061';
wwv_flow_api.g_varchar2_table(586) := '6E3E222C453D22223B303C6B2E6C656E6774682626286B3D6B2E6C656E6774683E6F2E6D6573736167654D61784C656E6774683F68286B292E737562737472696E6728302C6F2E6D6573736167654D61784C656E677468292B222E2E2E223A68286B292C';
wwv_flow_api.g_varchar2_table(587) := '453D223C7370616E207374796C653D5C22666F6E742D73697A653A222B6F2E6D657373616765466F6E7453697A652B223B636F6C6F723A222B6F2E6D657373616765436F6C6F722B223B5C2220636C6173733D5C22222B772B222D6D6573736167655C22';
wwv_flow_api.g_varchar2_table(588) := '3E222B6B2B223C2F7370616E3E22292C572B2B3B76617220443D742E646F63756D656E742E637265617465456C656D656E74282264697622293B442E69643D642E49442B222D222B572C442E636C6173734E616D653D772B222D77726170222B286F2E63';
wwv_flow_api.g_varchar2_table(589) := '7373416E696D6174696F6E3F2220776974682D616E696D6174696F6E223A2222292C442E7374796C652E706F736974696F6E3D6F2E706F736974696F6E2C442E7374796C652E7A496E6465783D6F2E7A696E6465782C442E7374796C652E6261636B6772';
wwv_flow_api.g_varchar2_table(590) := '6F756E643D6F2E6261636B67726F756E64436F6C6F722C442E7374796C652E616E696D6174696F6E4475726174696F6E3D6F2E637373416E696D6174696F6E4475726174696F6E2B226D73222C442E7374796C652E666F6E7446616D696C793D225C2222';
wwv_flow_api.g_varchar2_table(591) := '2B6F2E666F6E7446616D696C792B225C222C20222B722C442E7374796C652E646973706C61793D22666C6578222C442E7374796C652E666C6578577261703D2277726170222C442E7374796C652E666C6578446972656374696F6E3D22636F6C756D6E22';
wwv_flow_api.g_varchar2_table(592) := '2C442E7374796C652E616C69676E4974656D733D2263656E746572222C442E7374796C652E6A757374696679436F6E74656E743D2263656E746572222C6F2E72746C262628442E7365744174747269627574652822646972222C2272746C22292C442E63';
wwv_flow_api.g_varchar2_table(593) := '6C6173734C6973742E616464282272746C2D6F6E2229292C442E696E6E657248544D4C3D462B453B76617220543D742E676574436F6D70757465645374796C652858292E67657450726F706572747956616C75652822706F736974696F6E22292C4F3D22';
wwv_flow_api.g_varchar2_table(594) := '737472696E67223D3D747970656F6620543F542E746F4C6F63616C654C6F776572436173652822656E22293A2272656C6174697665222C483D4D6174682E726F756E6428312E32352A7061727365496E74286F2E73766753697A6529292B34302C503D58';
wwv_flow_api.g_varchar2_table(595) := '2E6F66667365744865696768747C7C302C513D22223B483E50262628513D226D696E2D6865696768743A222B482B2270783B22293B76617220593D22223B593D582E6765744174747269627574652822696422293F2223222B582E676574417474726962';
wwv_flow_api.g_varchar2_table(596) := '7574652822696422293A582E636C6173734C6973745B305D3F222E222B582E636C6173734C6973745B305D3A28582E7461674E616D657C7C2222292E746F4C6F63616C654C6F776572436173652822656E22293B76617220473D22222C563D2D313E3D5B';
wwv_flow_api.g_varchar2_table(597) := '226162736F6C757465222C2272656C6174697665222C226669786564222C22737469636B79225D2E696E6465784F66284F293B696628567C7C303C512E6C656E677468297B696628217828226865616422292972657475726E21313B56262628473D2270';
wwv_flow_api.g_varchar2_table(598) := '6F736974696F6E3A72656C617469766521696D706F7274616E743B22293B76617220713D223C7374796C652069643D5C225374796C652D222B642E49442B222D222B572B225C223E222B592B222E222B772B222D706F736974696F6E7B222B472B512B22';
wwv_flow_api.g_varchar2_table(599) := '7D3C2F7374796C653E222C553D742E646F63756D656E742E63726561746552616E676528293B552E73656C6563744E6F646528742E646F63756D656E742E68656164293B766172204B3D552E637265617465436F6E7465787475616C467261676D656E74';
wwv_flow_api.g_varchar2_table(600) := '2871293B742E646F63756D656E742E686561642E617070656E644368696C64284B292C582E636C6173734C6973742E61646428772B222D706F736974696F6E22297D582E617070656E644368696C642844297D7D656C736520766172204A3D66756E6374';
wwv_flow_api.g_varchar2_table(601) := '696F6E2865297B76617220613D73657454696D656F75742866756E6374696F6E28297B6E756C6C213D3D652E706172656E744E6F64652626652E706172656E744E6F64652E72656D6F76654368696C642865293B766172206E3D652E6765744174747269';
wwv_flow_api.g_varchar2_table(602) := '627574652822696422292C693D742E646F63756D656E742E676574456C656D656E744279496428225374796C652D222B6E293B6926266E756C6C213D3D692E706172656E744E6F64652626692E706172656E744E6F64652E72656D6F76654368696C6428';
wwv_flow_api.g_varchar2_table(603) := '69292C636C65617254696D656F75742861297D2C6F2E637373416E696D6174696F6E4475726174696F6E297D2C5A3D66756E6374696F6E2874297B696628742626303C742E6C656E67746829666F722876617220652C6E3D303B6E3C742E6C656E677468';
wwv_flow_api.g_varchar2_table(604) := '3B6E2B2B29653D745B6E5D2C65262628652E636C6173734C6973742E616464282272656D6F766522292C4A286529293B656C7365206628224E6F7469666C697820496E666F222C225C224E6F7469666C69782E426C6F636B2E52656D6F766528293B5C22';
wwv_flow_api.g_varchar2_table(605) := '2066756E6374696F6E2063616C6C65642077697468205C22222B612B225C222073656C6563746F722C2062757420746869732073656C6563746F7220646F6573206E6F7420686176652061205C224E6F7469666C69782E426C6F636B2E2E2E5C2220656C';
wwv_flow_api.g_varchar2_table(606) := '656D656E7420746F2072656D6F76652E22297D2C243D66756E6374696F6E2874297B76617220653D73657454696D656F75742866756E6374696F6E28297B76617220613D772B222D706F736974696F6E223B742E636C6173734C6973742E72656D6F7665';
wwv_flow_api.g_varchar2_table(607) := '2861292C636C65617254696D656F75742865297D2C6F2E637373416E696D6174696F6E4475726174696F6E2B333030297D2C5F3D73657454696D656F75742866756E6374696F6E28297B666F722876617220742C653D303B653C4E3B652B2B29743D705B';
wwv_flow_api.g_varchar2_table(608) := '655D2C242874292C523D742E717565727953656C6563746F72416C6C28225B69645E3D222B642E49442B225D22292C5A2852293B636C65617254696D656F7574285F297D2C63293B6F3D792821302C6F2C75297D2C6A3D7B4E6F746966793A7B496E6974';
wwv_flow_api.g_varchar2_table(609) := '3A66756E6374696F6E2874297B653D792821302C6C2C74292C6B28652E757365476F6F676C65466F6E742C652E666F6E7446616D696C79292C6228297D2C4D657267653A66756E6374696F6E2874297B72657475726E20653F766F696428653D79282130';
wwv_flow_api.g_varchar2_table(610) := '2C652C7429293A286728224E6F7469666C6978204572726F72222C22596F75206861766520746F20696E697469616C697A6520746865204E6F74696679206D6F64756C65206265666F72652063616C6C204D657267652066756E6374696F6E2E22292C21';
wwv_flow_api.g_varchar2_table(611) := '31297D2C537563636573733A66756E6374696F6E28742C652C61297B4628742C652C612C225375636365737322297D2C4661696C7572653A66756E6374696F6E28742C652C61297B4628742C652C612C224661696C75726522297D2C5761726E696E673A';
wwv_flow_api.g_varchar2_table(612) := '66756E6374696F6E28742C652C61297B4628742C652C612C225761726E696E6722297D2C496E666F3A66756E6374696F6E28742C652C61297B4628742C652C612C22496E666F22297D7D2C5265706F72743A7B496E69743A66756E6374696F6E2874297B';
wwv_flow_api.g_varchar2_table(613) := '613D792821302C632C74292C6B28612E757365476F6F676C65466F6E742C612E666F6E7446616D696C79292C6228297D2C4D657267653A66756E6374696F6E2874297B72657475726E20613F766F696428613D792821302C612C7429293A286728224E6F';
wwv_flow_api.g_varchar2_table(614) := '7469666C6978204572726F72222C22596F75206861766520746F20696E697469616C697A6520746865205265706F7274206D6F64756C65206265666F72652063616C6C204D657267652066756E6374696F6E2E22292C2131297D2C537563636573733A66';
wwv_flow_api.g_varchar2_table(615) := '756E6374696F6E28742C652C612C6E2C69297B4528742C652C612C6E2C692C225375636365737322297D2C4661696C7572653A66756E6374696F6E28742C652C612C6E2C69297B4528742C652C612C6E2C692C224661696C75726522297D2C5761726E69';
wwv_flow_api.g_varchar2_table(616) := '6E673A66756E6374696F6E28742C652C612C6E2C69297B4528742C652C612C6E2C692C225761726E696E6722297D2C496E666F3A66756E6374696F6E28742C652C612C6E2C69297B4528742C652C612C6E2C692C22496E666F22297D7D2C436F6E666972';
wwv_flow_api.g_varchar2_table(617) := '6D3A7B496E69743A66756E6374696F6E2874297B6E3D792821302C6D2C74292C6B286E2E757365476F6F676C65466F6E742C6E2E666F6E7446616D696C79292C6228297D2C4D657267653A66756E6374696F6E2874297B72657475726E206E3F766F6964';
wwv_flow_api.g_varchar2_table(618) := '286E3D792821302C6E2C7429293A286728224E6F7469666C6978204572726F72222C22596F75206861766520746F20696E697469616C697A652074686520436F6E6669726D206D6F64756C65206265666F72652063616C6C204D657267652066756E6374';
wwv_flow_api.g_varchar2_table(619) := '696F6E2E22292C2131297D2C53686F773A66756E6374696F6E28742C652C612C6E2C692C6F2C73297B4428742C652C612C6E2C692C6F2C732C21312C2131297D2C41736B3A66756E6374696F6E28742C652C612C6E2C692C6F2C732C72297B4428742C65';
wwv_flow_api.g_varchar2_table(620) := '2C6E2C692C6F2C732C722C21302C61297D7D2C4C6F6164696E673A7B496E69743A66756E6374696F6E2874297B693D792821302C702C74292C6B28692E757365476F6F676C65466F6E742C692E666F6E7446616D696C79292C6228297D2C4D657267653A';
wwv_flow_api.g_varchar2_table(621) := '66756E6374696F6E2874297B72657475726E20693F766F696428693D792821302C692C7429293A286728224E6F7469666C6978204572726F72222C22596F75206861766520746F20696E697469616C697A6520746865204C6F6164696E67206D6F64756C';
wwv_flow_api.g_varchar2_table(622) := '65206265666F72652063616C6C204D657267652066756E6374696F6E2E22292C2131297D2C5374616E646172643A66756E6374696F6E28742C65297B5428742C652C227374616E64617264222C21302C30297D2C486F7572676C6173733A66756E637469';
wwv_flow_api.g_varchar2_table(623) := '6F6E28742C65297B5428742C652C22686F7572676C617373222C21302C30297D2C436972636C653A66756E6374696F6E28742C65297B5428742C652C22636972636C65222C21302C30297D2C4172726F77733A66756E6374696F6E28742C65297B542874';
wwv_flow_api.g_varchar2_table(624) := '2C652C226172726F7773222C21302C30297D2C446F74733A66756E6374696F6E28742C65297B5428742C652C22646F7473222C21302C30297D2C50756C73653A66756E6374696F6E28742C65297B5428742C652C2270756C7365222C21302C30297D2C43';
wwv_flow_api.g_varchar2_table(625) := '7573746F6D3A66756E6374696F6E28742C65297B5428742C652C22637573746F6D222C21302C30297D2C4E6F7469666C69783A66756E6374696F6E28742C65297B5428742C652C226E6F7469666C6978222C21302C30297D2C52656D6F76653A66756E63';
wwv_flow_api.g_varchar2_table(626) := '74696F6E2874297B226E756D62657222213D747970656F662074262628743D30292C542821312C21312C21312C21312C74297D2C4368616E67653A66756E6374696F6E2874297B4F2874297D7D2C426C6F636B3A7B496E69743A66756E6374696F6E2874';
wwv_flow_api.g_varchar2_table(627) := '297B6F3D792821302C642C74292C6B286F2E757365476F6F676C65466F6E742C6F2E666F6E7446616D696C79292C6228297D2C4D657267653A66756E6374696F6E2874297B72657475726E206F3F766F6964286F3D792821302C6F2C7429293A28672822';
wwv_flow_api.g_varchar2_table(628) := '4E6F7469666C6978204572726F72222C22596F75206861766520746F20696E697469616C697A6520746865205C224E6F7469666C69782E426C6F636B5C22206D6F64756C65206265666F72652063616C6C204D657267652066756E6374696F6E2E22292C';
wwv_flow_api.g_varchar2_table(629) := '2131297D2C5374616E646172643A66756E6374696F6E28742C652C61297B482821302C742C227374616E64617264222C652C61297D2C486F7572676C6173733A66756E6374696F6E28742C652C61297B482821302C742C22686F7572676C617373222C65';
wwv_flow_api.g_varchar2_table(630) := '2C61297D2C436972636C653A66756E6374696F6E28742C652C61297B482821302C742C22636972636C65222C652C61297D2C4172726F77733A66756E6374696F6E28742C652C61297B482821302C742C226172726F7773222C652C61297D2C446F74733A';
wwv_flow_api.g_varchar2_table(631) := '66756E6374696F6E28742C652C61297B482821302C742C22646F7473222C652C61297D2C50756C73653A66756E6374696F6E28742C652C61297B482821302C742C2270756C7365222C652C61297D2C52656D6F76653A66756E6374696F6E28742C65297B';
wwv_flow_api.g_varchar2_table(632) := '226E756D62657222213D747970656F662065262628653D30292C482821312C742C21312C21312C21312C65297D7D7D3B72657475726E7B4E6F746966793A6A2E4E6F746966792C5265706F72743A6A2E5265706F72742C436F6E6669726D3A6A2E436F6E';
wwv_flow_api.g_varchar2_table(633) := '6669726D2C4C6F6164696E673A6A2E4C6F6164696E672C426C6F636B3A6A2E426C6F636B7D7D293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(30108108576108363876)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_file_name=>'notiflix-2.7.0.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7661722062654374624E6F7469666C6978203D207B7D3B0D0A0D0A62654374624E6F7469666C69782E7574696C203D207B0D0A202020207265706C6163654974656D733A2066756E6374696F6E2028704D736729207B0D0A202020202020766172206974';
wwv_flow_api.g_varchar2_table(2) := '656D3B0D0A202020202020766172206974656D4F6E506167653B0D0A202020202020766172206974656D73203D206E6577205265674578702822235C5C772B23222C20226722293B0D0A202020202020766172207265706C616365644D7367203D20704D';
wwv_flow_api.g_varchar2_table(3) := '73673B0D0A20200D0A2020202020207768696C6520286974656D203D206974656D732E6578656328704D73672929207B0D0A202020202020202020206974656D4F6E50616765203D202478286974656D5B305D2E7265706C616365282F232F672C202222';
wwv_flow_api.g_varchar2_table(4) := '29293B0D0A20202020202020202020696620286974656D4F6E5061676529207B0D0A20202020202020202020202020207265706C616365644D7367203D207265706C616365644D73672E7265706C616365286974656D5B305D2C202476286974656D4F6E';
wwv_flow_api.g_varchar2_table(5) := '5061676529293B0D0A202020202020202020207D0D0A2020202020207D0D0A20202020202072657475726E207265706C616365644D73673B0D0A202020207D0D0A20207D3B0D0A0D0A62654374624E6F7469666C69782E4E6F74696679203D207B0D0A20';
wwv_flow_api.g_varchar2_table(6) := '2020207574696C3A2062654374624E6F7469666C69782E7574696C2C0D0A20200D0A20202020537563636573733A2066756E6374696F6E2028705468697329207B0D0A20202020202020204E6F7469666C69782E4E6F746966792E537563636573732874';
wwv_flow_api.g_varchar2_table(7) := '6869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653033292C2066756E6374696F6E20286529207B0D0A2020202020202020617065782E64612E726573756D652870546869732E726573756D65';
wwv_flow_api.g_varchar2_table(8) := '43616C6C6261636B2C2066616C7365293B0D0A2020202020207D293B0D0A202020207D2C0D0A202020204661696C7572653A2066756E6374696F6E2028705468697329207B0D0A20202020202020204E6F7469666C69782E4E6F746966792E4661696C75';
wwv_flow_api.g_varchar2_table(9) := '726528746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653033292C2066756E6374696F6E20286529207B0D0A2020202020202020617065782E64612E726573756D652870546869732E7265';
wwv_flow_api.g_varchar2_table(10) := '73756D6543616C6C6261636B2C2066616C7365293B0D0A2020202020207D293B0D0A202020207D2C0D0A202020205761726E696E673A2066756E6374696F6E2028705468697329207B0D0A20202020202020204E6F7469666C69782E4E6F746966792E57';
wwv_flow_api.g_varchar2_table(11) := '61726E696E6728746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653033292C2066756E6374696F6E20286529207B0D0A2020202020202020617065782E64612E726573756D652870546869';
wwv_flow_api.g_varchar2_table(12) := '732E726573756D6543616C6C6261636B2C2066616C7365293B0D0A2020202020207D293B0D0A202020207D2C0D0A20202020496E666F3A2066756E6374696F6E2028705468697329207B0D0A20202020202020204E6F7469666C69782E4E6F746966792E';
wwv_flow_api.g_varchar2_table(13) := '496E666F28746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653033292C2066756E6374696F6E20286529207B0D0A2020202020202020617065782E64612E726573756D652870546869732E';
wwv_flow_api.g_varchar2_table(14) := '726573756D6543616C6C6261636B2C2066616C7365293B0D0A2020202020207D2C0D0A2020202020207B0D0A202020202020202072746C3A20747275652C0D0A2020202020207D293B0D0A202020207D0D0A20207D3B0D0A0D0A202062654374624E6F74';
wwv_flow_api.g_varchar2_table(15) := '69666C69782E5265706F7274203D207B0D0A202020207574696C3A2062654374624E6F7469666C69782E7574696C2C0D0A20200D0A20202020537563636573733A2066756E6374696F6E2028705468697329207B0D0A2020202020202020204E6F746966';
wwv_flow_api.g_varchar2_table(16) := '6C69782E5265706F72742E537563636573732820746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653033292C20746869732E7574696C2E7265706C6163654974656D732870546869732E61';
wwv_flow_api.g_varchar2_table(17) := '6374696F6E2E6174747269627574653034292C20746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653133292C2066756E6374696F6E20286529207B0D0A2020202020202020617065782E64';
wwv_flow_api.g_varchar2_table(18) := '612E726573756D652870546869732E726573756D6543616C6C6261636B2C2066616C7365293B0D0A2020202020207D293B200D0A202020207D2C0D0A202020204661696C7572653A2066756E6374696F6E2028705468697329207B0D0A20202020202020';
wwv_flow_api.g_varchar2_table(19) := '20204E6F7469666C69782E5265706F72742E4661696C7572652820746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653033292C20746869732E7574696C2E7265706C6163654974656D7328';
wwv_flow_api.g_varchar2_table(20) := '70546869732E616374696F6E2E6174747269627574653034292C20746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653133292C2066756E6374696F6E20286529207B0D0A20202020202020';
wwv_flow_api.g_varchar2_table(21) := '20617065782E64612E726573756D652870546869732E726573756D6543616C6C6261636B2C2066616C7365293B0D0A2020202020207D293B200D0A202020207D2C0D0A202020205761726E696E673A2066756E6374696F6E2028705468697329207B0D0A';
wwv_flow_api.g_varchar2_table(22) := '2020202020202020204E6F7469666C69782E5265706F72742E5761726E696E672820746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653033292C20746869732E7574696C2E7265706C6163';
wwv_flow_api.g_varchar2_table(23) := '654974656D732870546869732E616374696F6E2E6174747269627574653034292C20746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653133292C2066756E6374696F6E20286529207B0D0A';
wwv_flow_api.g_varchar2_table(24) := '2020202020202020617065782E64612E726573756D652870546869732E726573756D6543616C6C6261636B2C2066616C7365293B0D0A2020202020207D293B200D0A202020207D2C0D0A20202020496E666F3A2066756E6374696F6E2028705468697329';
wwv_flow_api.g_varchar2_table(25) := '207B0D0A2020202020202020204E6F7469666C69782E5265706F72742E496E666F2820746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653033292C20746869732E7574696C2E7265706C61';
wwv_flow_api.g_varchar2_table(26) := '63654974656D732870546869732E616374696F6E2E6174747269627574653034292C20746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653133292C2066756E6374696F6E20286529207B0D';
wwv_flow_api.g_varchar2_table(27) := '0A2020202020202020617065782E64612E726573756D652870546869732E726573756D6543616C6C6261636B2C2066616C7365293B0D0A2020202020207D293B200D0A202020207D0D0A20207D3B0D0A0D0A202062654374624E6F7469666C69782E436F';
wwv_flow_api.g_varchar2_table(28) := '6E6669726D203D207B0D0A202020207574696C3A2062654374624E6F7469666C69782E7574696C2C0D0A20200D0A2020202053686F773A2066756E6374696F6E2028705468697329207B0D0A2020202020202020204E6F7469666C69782E436F6E666972';
wwv_flow_api.g_varchar2_table(29) := '6D2E53686F772820746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653033292C20746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E617474726962';
wwv_flow_api.g_varchar2_table(30) := '7574653034292C20746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E6174747269627574653133292C20746869732E7574696C2E7265706C6163654974656D732870546869732E616374696F6E2E617474726962';
wwv_flow_api.g_varchar2_table(31) := '7574653134292C2066756E6374696F6E28297B20617065782E64612E726573756D652870546869732E726573756D6543616C6C6261636B2C2066616C7365293B207D2C2066756E6374696F6E28297B203B207D20293B200D0A202020207D0D0A2020207D';
wwv_flow_api.g_varchar2_table(32) := '3B0D0A';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(30108108930794363880)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_file_name=>'apex.notiflix.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7661722062654374624E6F7469666C69783D7B7D3B62654374624E6F7469666C69782E7574696C3D7B7265706C6163654974656D733A66756E6374696F6E2874297B666F722876617220652C692C613D6E6577205265674578702822235C5C772B23222C';
wwv_flow_api.g_varchar2_table(2) := '226722292C753D743B653D612E657865632874293B2928693D247828655B305D2E7265706C616365282F232F672C2222292929262628753D752E7265706C61636528655B305D2C247628692929293B72657475726E20757D7D2C62654374624E6F746966';
wwv_flow_api.g_varchar2_table(3) := '6C69782E4E6F746966793D7B7574696C3A62654374624E6F7469666C69782E7574696C2C537563636573733A66756E6374696F6E2874297B4E6F7469666C69782E4E6F746966792E5375636365737328746869732E7574696C2E7265706C616365497465';
wwv_flow_api.g_varchar2_table(4) := '6D7328742E616374696F6E2E6174747269627574653033292C2866756E6374696F6E2865297B617065782E64612E726573756D6528742E726573756D6543616C6C6261636B2C2131297D29297D2C4661696C7572653A66756E6374696F6E2874297B4E6F';
wwv_flow_api.g_varchar2_table(5) := '7469666C69782E4E6F746966792E4661696C75726528746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269627574653033292C2866756E6374696F6E2865297B617065782E64612E726573756D6528742E726573';
wwv_flow_api.g_varchar2_table(6) := '756D6543616C6C6261636B2C2131297D29297D2C5761726E696E673A66756E6374696F6E2874297B4E6F7469666C69782E4E6F746966792E5761726E696E6728746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E61747472';
wwv_flow_api.g_varchar2_table(7) := '69627574653033292C2866756E6374696F6E2865297B617065782E64612E726573756D6528742E726573756D6543616C6C6261636B2C2131297D29297D2C496E666F3A66756E6374696F6E2874297B4E6F7469666C69782E4E6F746966792E496E666F28';
wwv_flow_api.g_varchar2_table(8) := '746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269627574653033292C2866756E6374696F6E2865297B617065782E64612E726573756D6528742E726573756D6543616C6C6261636B2C2131297D292C7B72746C';
wwv_flow_api.g_varchar2_table(9) := '3A21307D297D7D2C62654374624E6F7469666C69782E5265706F72743D7B7574696C3A62654374624E6F7469666C69782E7574696C2C537563636573733A66756E6374696F6E2874297B4E6F7469666C69782E5265706F72742E53756363657373287468';
wwv_flow_api.g_varchar2_table(10) := '69732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269627574653033292C746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269627574653034292C746869732E7574696C2E7265';
wwv_flow_api.g_varchar2_table(11) := '706C6163654974656D7328742E616374696F6E2E6174747269627574653133292C2866756E6374696F6E2865297B617065782E64612E726573756D6528742E726573756D6543616C6C6261636B2C2131297D29297D2C4661696C7572653A66756E637469';
wwv_flow_api.g_varchar2_table(12) := '6F6E2874297B4E6F7469666C69782E5265706F72742E4661696C75726528746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269627574653033292C746869732E7574696C2E7265706C6163654974656D7328742E';
wwv_flow_api.g_varchar2_table(13) := '616374696F6E2E6174747269627574653034292C746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269627574653133292C2866756E6374696F6E2865297B617065782E64612E726573756D6528742E726573756D';
wwv_flow_api.g_varchar2_table(14) := '6543616C6C6261636B2C2131297D29297D2C5761726E696E673A66756E6374696F6E2874297B4E6F7469666C69782E5265706F72742E5761726E696E6728746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E617474726962';
wwv_flow_api.g_varchar2_table(15) := '7574653033292C746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269627574653034292C746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269627574653133292C286675';
wwv_flow_api.g_varchar2_table(16) := '6E6374696F6E2865297B617065782E64612E726573756D6528742E726573756D6543616C6C6261636B2C2131297D29297D2C496E666F3A66756E6374696F6E2874297B4E6F7469666C69782E5265706F72742E496E666F28746869732E7574696C2E7265';
wwv_flow_api.g_varchar2_table(17) := '706C6163654974656D7328742E616374696F6E2E6174747269627574653033292C746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269627574653034292C746869732E7574696C2E7265706C6163654974656D73';
wwv_flow_api.g_varchar2_table(18) := '28742E616374696F6E2E6174747269627574653133292C2866756E6374696F6E2865297B617065782E64612E726573756D6528742E726573756D6543616C6C6261636B2C2131297D29297D7D2C62654374624E6F7469666C69782E436F6E6669726D3D7B';
wwv_flow_api.g_varchar2_table(19) := '7574696C3A62654374624E6F7469666C69782E7574696C2C53686F773A66756E6374696F6E2874297B4E6F7469666C69782E436F6E6669726D2E53686F7728746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269';
wwv_flow_api.g_varchar2_table(20) := '627574653033292C746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269627574653034292C746869732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269627574653133292C7468';
wwv_flow_api.g_varchar2_table(21) := '69732E7574696C2E7265706C6163654974656D7328742E616374696F6E2E6174747269627574653134292C2866756E6374696F6E28297B617065782E64612E726573756D6528742E726573756D6543616C6C6261636B2C2131297D292C2866756E637469';
wwv_flow_api.g_varchar2_table(22) := '6F6E28297B7D29297D7D3B0A2F2F2320736F757263654D617070696E6755524C3D617065782E6E6F7469666C69782E6A732E6D6170';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(30126299431809832487)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_file_name=>'apex.notiflix.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '7B2276657273696F6E223A332C22736F7572636573223A5B22617065782E6E6F7469666C69782E6A73225D2C226E616D6573223A5B2262654374624E6F7469666C6978222C227574696C222C227265706C6163654974656D73222C22704D7367222C2269';
wwv_flow_api.g_varchar2_table(2) := '74656D222C226974656D4F6E50616765222C226974656D73222C22526567457870222C227265706C616365644D7367222C2265786563222C222478222C227265706C616365222C222476222C224E6F74696679222C2253756363657373222C2270546869';
wwv_flow_api.g_varchar2_table(3) := '73222C224E6F7469666C6978222C2274686973222C22616374696F6E222C226174747269627574653033222C2265222C2261706578222C226461222C22726573756D65222C22726573756D6543616C6C6261636B222C224661696C757265222C22576172';
wwv_flow_api.g_varchar2_table(4) := '6E696E67222C22496E666F222C2272746C222C225265706F7274222C226174747269627574653034222C226174747269627574653133222C22436F6E6669726D222C2253686F77222C226174747269627574653134225D2C226D617070696E6773223A22';
wwv_flow_api.g_varchar2_table(5) := '414141412C49414149412C63414167422C4741457042412C63414163432C4B41414F2C4341436A42432C614141632C53414155432C47414D74422C49414C412C49414149432C45414341432C45414341432C454141512C49414149432C4F41414F2C5341';
wwv_flow_api.g_varchar2_table(6) := '41552C4B41433742432C454141634C2C45414558432C4541414F452C4541414D472C4B41414B4E2C4B41437242452C454141614B2C474141474E2C4541414B2C474141474F2C514141512C4B41414D2C5141456C43482C45414163412C45414159472C51';
wwv_flow_api.g_varchar2_table(7) := '414151502C4541414B2C47414149512C47414147502C4B414774442C4F41414F472C49414962522C63414163612C4F4141532C4341436E425A2C4B41414D442C63414163432C4B41457042612C514141532C53414155432C47414366432C53414153482C';
wwv_flow_api.g_varchar2_table(8) := '4F41414F432C51414151472C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F432C634141632C53414155432C4741437046432C4B41414B432C47414147432C4F41414F522C4541414D532C6742414167422C4F41477A43432C51';
wwv_flow_api.g_varchar2_table(9) := '4141532C53414155562C47414366432C53414153482C4F41414F592C51414151522C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F432C634141632C53414155432C4741437046432C4B41414B432C47414147432C4F41414F52';
wwv_flow_api.g_varchar2_table(10) := '2C4541414D532C6742414167422C4F41477A43452C514141532C53414155582C47414366432C53414153482C4F41414F612C51414151542C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F432C634141632C53414155432C4741';
wwv_flow_api.g_varchar2_table(11) := '437046432C4B41414B432C47414147432C4F41414F522C4541414D532C6742414167422C4F41477A43472C4B41414D2C534141555A2C4741435A432C53414153482C4F41414F632C4B41414B562C4B41414B68422C4B41414B432C61414161612C454141';
wwv_flow_api.g_varchar2_table(12) := '4D472C4F41414F432C634141632C53414155432C4741436A46432C4B41414B432C47414147432C4F41414F522C4541414D532C6742414167422C4B414576432C43414345492C4B41414B2C4D414B5835422C6341416336422C4F4141532C434143724235';
wwv_flow_api.g_varchar2_table(13) := '422C4B41414D442C63414163432C4B41457042612C514141532C53414155432C47414364432C53414153612C4F41414F662C51414153472C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F432C61414163462C4B41414B68422C';
wwv_flow_api.g_varchar2_table(14) := '4B41414B432C61414161612C4541414D472C4F41414F592C61414163622C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F612C634141632C53414155582C474143314C432C4B41414B432C47414147432C4F41414F522C454141';
wwv_flow_api.g_varchar2_table(15) := '4D532C6742414167422C4F41477A43432C514141532C53414155562C47414364432C53414153612C4F41414F4A2C51414153522C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F432C61414163462C4B41414B68422C4B41414B';
wwv_flow_api.g_varchar2_table(16) := '432C61414161612C4541414D472C4F41414F592C61414163622C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F612C634141632C53414155582C474143314C432C4B41414B432C47414147432C4F41414F522C4541414D532C67';
wwv_flow_api.g_varchar2_table(17) := '42414167422C4F41477A43452C514141532C53414155582C47414364432C53414153612C4F41414F482C51414153542C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F432C61414163462C4B41414B68422C4B41414B432C6141';
wwv_flow_api.g_varchar2_table(18) := '4161612C4541414D472C4F41414F592C61414163622C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F612C634141632C53414155582C474143314C432C4B41414B432C47414147432C4F41414F522C4541414D532C6742414167';
wwv_flow_api.g_varchar2_table(19) := '422C4F41477A43472C4B41414D2C534141555A2C47414358432C53414153612C4F41414F462C4B41414D562C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F432C61414163462C4B41414B68422C4B41414B432C61414161612C';
wwv_flow_api.g_varchar2_table(20) := '4541414D472C4F41414F592C61414163622C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F612C634141632C53414155582C474143764C432C4B41414B432C47414147432C4F41414F522C4541414D532C6742414167422C5141';
wwv_flow_api.g_varchar2_table(21) := '4B334378422C6341416367432C514141552C43414374422F422C4B41414D442C63414163432C4B4145704267432C4B41414D2C534141556C422C47414358432C5341415367422C51414151432C4B41414D68422C4B41414B68422C4B41414B432C614141';
wwv_flow_api.g_varchar2_table(22) := '61612C4541414D472C4F41414F432C61414163462C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F592C61414163622C4B41414B68422C4B41414B432C61414161612C4541414D472C4F41414F612C61414163642C4B41414B68';
wwv_flow_api.g_varchar2_table(23) := '422C4B41414B432C61414161612C4541414D472C4F41414F67422C634141632C57414159622C4B41414B432C47414147432C4F41414F522C4541414D532C6742414167422C4D414157222C2266696C65223A22617065782E6E6F7469666C69782E6A7322';
wwv_flow_api.g_varchar2_table(24) := '7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(30126299768536832489)
,p_plugin_id=>wwv_flow_api.id(30107914691810351214)
,p_file_name=>'apex.notiflix.js.map'
,p_mime_type=>'application/json'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
