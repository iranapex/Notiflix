/***************************************************************************************************
Plugin Name:        Notifilix
Sponser:            ArtaBit Afzar (www.iranapex.ir)
Create Date:        2021-01-25
Author:             Mahdi Ahmadi
Email:              ahmadi@iranapex.ir 
Description:        Notiflix is a  library for client-side non-blocking notifications, popup boxes, 
                    loading indicators, and more to that makes your web projects much better.
Plugin Type:        [Dynamic Action]

Version Support:    APEX 5.1 +
****************************************************************************************************
SUMMARY OF CHANGES
Date(yyyy-mm-dd)    Author              Comments
------------------- ------------------- ------------------------------------------------------------
2021-01-27          Mahdi Ahmadi        Add Confirm 
***************************************************************************************************/

function render(p_dynamic_action in apex_plugin.t_dynamic_action
              , p_plugin         in apex_plugin.t_plugin)
return apex_plugin.t_dynamic_action_render_result is
    
    l_rtl                  varchar2(5)    := p_plugin.attribute_01;
    l_def_ok_btn_label     varchar2(4000) := p_plugin.attribute_02;
    l_def_cancel_btn_label varchar2(4000) := p_plugin.attribute_03;

    l_message_type       varchar2(4000) := p_dynamic_action.attribute_01;
    l_dialog_type        varchar2(4000) := p_dynamic_action.attribute_02;
    l_message            varchar2(4000) := p_dynamic_action.attribute_03;
    l_messageBody        varchar2(4000) := p_dynamic_action.attribute_04;
    l_width              varchar2(4000) := p_dynamic_action.attribute_05;
    l_position           varchar2(4000) := p_dynamic_action.attribute_06;
    l_backOverlay        varchar2(4000) := p_dynamic_action.attribute_07;
    l_AnimationStyle     varchar2(4000) := p_dynamic_action.attribute_08;
    l_useIcon            varchar2(6)    := p_dynamic_action.attribute_09;
    l_closeButton        varchar2(4000) := p_dynamic_action.attribute_10;
    l_borderRadius       varchar2(4000) := p_dynamic_action.attribute_11;
    l_distance           varchar2(4000) := p_dynamic_action.attribute_12;
    l_ok_label           varchar2(4000) := p_dynamic_action.attribute_13;
    l_cancel_label       varchar2(4000) := p_dynamic_action.attribute_14;
    l_timeout            varchar2(4000) := p_dynamic_action.attribute_15;
    
    l_function_call varchar2(4000);
    l_render_result apex_plugin.t_dynamic_action_render_result;
    
    function get_properties return varchar2 is
        l_props        varchar2(32767);
    begin
        if (l_message_type = 'NOTIFY') then 
            l_props := 'Notiflix.Notify.Init({width:'''|| l_width || 'px'',rtl:'|| l_rtl ||',borderRadius:"'|| l_borderRadius || 'px",distance:"'|| l_distance ||'px",position:"'|| l_position ||'",closeButton: '|| l_closeButton ||' ,backOverlay:'|| l_backOverlay ||',timeout:'|| l_timeout ||',useIcon:'|| l_useIcon ||',cssAnimationStyle:"' || l_AnimationStyle ||'",});';
        
        elsif (l_message_type = 'REPORT') then
            l_props := 'Notiflix.Report.Init({width:'''|| l_width || 'px'',rtl:'|| l_rtl ||',borderRadius:"'|| l_borderRadius || 'px",backOverlay:'|| l_backOverlay ||',cssAnimationStyle:"' || l_AnimationStyle ||'",});';
        
        elsif (l_message_type = 'CONFIRM') then
            l_props := 'Notiflix.Confirm.Init({width:'''|| l_width || 'px'',rtl:'|| l_rtl ||',borderRadius:"'|| l_borderRadius || 'px",distance:"'|| l_distance ||'px",backOverlay:'|| l_backOverlay ||',cssAnimationStyle:"' || l_AnimationStyle ||'",});';
        end if;
        
        return l_props;
    end get_properties;
    
begin
    
    if (apex_application.g_debug) then
        apex_plugin_util.debug_dynamic_action(p_plugin, p_dynamic_action);
    end if;
    
    -- Load Static Files (JS/CSS)
    apex_javascript.add_library(
        p_name      => 'notiflix-2.7.0.min',
        p_directory => p_plugin.file_prefix,
        p_version   => null
    );
    apex_javascript.add_library(
        p_name      => 'apex.notiflix',
        p_directory => p_plugin.file_prefix,
        p_version   => null
    );
    apex_css.add_file(
        p_name      => 'notiflix-2.7.0.min',
        p_directory => p_plugin.file_prefix,
        p_version   => null
    );

    l_render_result.attribute_03 := l_message;
    l_render_result.attribute_04 := l_messageBody;
    l_render_result.attribute_13 := l_ok_label;
    l_render_result.attribute_14 := l_cancel_label;

    if (l_message_type = 'NOTIFY') then
        
        if (l_dialog_type = 'SUCCESS') then
            l_function_call := 'beCtbNotiflix.Notify.Success(this);';
        elsif (l_dialog_type = 'FAILURE') then
            l_function_call := 'beCtbNotiflix.Notify.Failure(this);';
        elsif (l_dialog_type = 'WARNING') then
            l_function_call := 'beCtbNotiflix.Notify.Warning(this);';
        elsif (l_dialog_type = 'INFO') then
            l_function_call := 'beCtbNotiflix.Notify.Info(this);';
        end if;
        
        l_render_result.javascript_function := 'function() { '|| get_properties || ' ' || l_function_call || '}';

    elsif (l_message_type = 'REPORT') then

        if (l_dialog_type = 'SUCCESS') then
            l_function_call := 'beCtbNotiflix.Report.Success(this);';
        elsif (l_dialog_type = 'FAILURE') then
            l_function_call := 'beCtbNotiflix.Report.Failure(this);';
        elsif (l_dialog_type = 'WARNING') then
            l_function_call := 'beCtbNotiflix.Report.Warning(this);';
        elsif (l_dialog_type = 'INFO') then
            l_function_call := 'beCtbNotiflix.Report.Info(this);';
        end if;
        
        l_render_result.javascript_function := 'function() { '|| get_properties || ' ' || l_function_call || '}';
    
    elsif (l_message_type = 'CONFIRM') then

        l_function_call := 'beCtbNotiflix.Confirm.Show(this);';
        
        l_render_result.javascript_function := 'function() { ' || get_properties || ' ' || l_function_call || '}';
        
    end if;


    return l_render_result;
  
end;
