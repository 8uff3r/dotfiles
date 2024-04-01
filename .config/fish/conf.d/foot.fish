
function foot_cmd_start --on-event fish_preexec
  echo -en "\e]133;C\e\\"
end
function foot_cmd_end --on-event fish_postexec
  echo -en "\e]133;D\e\\"
end
function mark_prompt_start --on-event fish_prompt
    echo -en "\e]133;A\e\\"
end
