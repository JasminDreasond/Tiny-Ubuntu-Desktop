#!/usr/bin/env bash
#################################################
# Please do not make any changes to this file,  #
# change the variables in webui-user.sh instead #
#################################################

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


# If run from macOS, load defaults from webui-macos-env.sh
if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ -f "$SCRIPT_DIR"/webui-macos-env.sh ]]
        then
        source "$SCRIPT_DIR"/webui-macos-env.sh
    fi
fi

# Read variables from webui-user.sh
# shellcheck source=/dev/null
if [[ -f "$SCRIPT_DIR"/webui-user.sh ]]
then
    source "$SCRIPT_DIR"/webui-user.sh
fi

# If $venv_dir is "-", then disable venv support
use_venv=1
if [[ $venv_dir == "-" ]]; then
  use_venv=0
fi

# Set defaults
# Install directory without trailing slash
if [[ -z "${install_dir}" ]]
then
    install_dir="$SCRIPT_DIR"
fi

# Name of the subdirectory (defaults to stable-diffusion-webui)
if [[ -z "${clone_dir}" ]]
then
    clone_dir="stable-diffusion-forge-webui"
fi

# python3 executable
if [[ -z "${python_cmd}" ]]
then
    python_cmd="python3.10"
fi

# git executable
if [[ -z "${GIT}" ]]
then
    export GIT="git"
else
    export GIT_PYTHON_GIT_EXECUTABLE="${GIT}"
fi

# python3 venv without trailing slash (defaults to ${install_dir}/${clone_dir}/venv)
if [[ -z "${venv_dir}" ]] && [[ $use_venv -eq 1 ]]
then
    venv_dir="venv"
fi

if [[ -z "${LAUNCH_SCRIPT}" ]]
then
    LAUNCH_SCRIPT="launch.py"
fi

# this script cannot be run as root by default
can_run_as_root=0

# read any command line flags to the webui.sh script
while getopts "f" flag > /dev/null 2>&1
do
    case ${flag} in
        f) can_run_as_root=1;;
        *) break;;
    esac
done

# Disable sentry logging
export ERROR_REPORTING=FALSE

# Do not reinstall existing pip packages on Debian/Ubuntu
export PIP_IGNORE_INSTALLED=0

# Pretty print
delimiter="################################################################"

printf "\e[49m                                                                \e[m
\e[49m                                                                \e[m
\e[49m                                                                \e[m
\e[49m               \e[38;2;115;0;9;49m▄\e[38;2;113;0;8;49m▄\e[49m    \e[38;2;115;0;9;49m▄\e[49m                                          \e[m
\e[49m          \e[38;2;168;16;35;49m▄\e[38;2;231;34;73;49m▄▄▄▄▄\e[38;2;231;34;73;48;2;132;9;21m▄\e[38;2;231;34;73;48;2;205;6;62m▄\e[38;2;123;3;9;48;2;231;34;73m▄\e[38;2;231;34;73;49m▄▄\e[49;38;2;115;0;9m▀\e[38;2;219;25;67;49m▄\e[49m                                         \e[m
\e[49m       \e[38;2;219;28;68;49m▄\e[38;2;231;34;73;48;2;197;18;48m▄\e[48;2;231;34;73m             \e[38;2;231;34;73;48;2;229;31;71m▄\e[48;2;231;34;73m \e[38;2;231;34;73;49m▄\e[38;2;114;0;8;49m▄\e[38;2;207;208;205;49m▄\e[38;2;208;210;207;49m▄\e[38;2;119;9;18;49m▄\e[49m                                   \e[m
\e[49m     \e[38;2;254;75;110;49m▄\e[38;2;254;75;110;48;2;205;5;63m▄\e[48;2;205;5;63m \e[38;2;179;1;54;48;2;151;3;42m▄\e[48;2;231;34;73m     \e[38;2;115;0;9;48;2;231;34;73m▄\e[48;2;231;34;73m        \e[38;2;115;0;8;48;2;231;34;73m▄\e[38;2;254;248;236;48;2;231;34;73m▄\e[38;2;130;1;13;48;2;231;34;73m▄\e[48;2;208;210;207m  \e[38;2;154;85;91;48;2;208;210;207m▄\e[38;2;208;210;207;48;2;117;1;11m▄\e[38;2;114;0;6;49m▄\e[49m                                 \e[m
\e[49m    \e[38;2;237;64;97;49m▄\e[48;2;254;75;110m   \e[48;2;205;5;63m \e[38;2;143;0;40;48;2;173;11;51m▄\e[48;2;231;34;73m \e[38;2;178;13;40;48;2;231;34;73m▄\e[38;2;231;34;73;48;2;115;0;9m▄\e[48;2;231;34;73m          \e[38;2;214;29;63;48;2;115;0;9m▄\e[48;2;254;255;252m \e[38;2;227;207;205;48;2;116;1;11m▄\e[38;2;240;229;227;48;2;208;210;207m▄\e[38;2;254;255;252;48;2;254;219;175m▄\e[38;2;208;210;207;48;2;167;121;125m▄\e[48;2;208;210;207m  \e[49m     \e[38;2;117;0;9;49m▄\e[38;2;231;34;73;49m▄▄\e[38;2;231;34;73;48;2;115;0;9m▄▄▄▄\e[38;2;231;34;73;49m▄▄\e[38;2;115;0;9;49m▄\e[49m                  \e[m
\e[49m    \e[48;2;254;75;110m   \e[38;2;114;0;8;48;2;254;75;110m▄\e[49;38;2;210;11;66m▀\e[49;38;2;147;2;43m▀\e[38;2;254;75;110;48;2;115;0;9m▄\e[38;2;205;5;63;48;2;184;2;55m▄\e[49;38;2;231;34;73m▀\e[49;38;2;124;1;13m▀\e[38;2;209;25;65;48;2;231;34;73m▄\e[48;2;231;34;73m    \e[38;2;122;0;10;48;2;231;34;73m▄\e[38;2;208;210;207;48;2;231;34;73m▄\e[38;2;255;159;35;48;2;231;34;73m▄\e[38;2;254;255;252;48;2;231;34;73m▄▄\e[38;2;205;104;23;48;2;253;228;193m▄\e[38;2;141;29;16;48;2;228;129;30m▄\e[38;2;175;69;21;48;2;254;173;67m▄\e[38;2;167;113;115;48;2;243;236;234m▄\e[48;2;208;210;207m   \e[38;2;200;193;191;48;2;115;0;9m▄\e[49m \e[38;2;142;5;22;49m▄\e[38;2;231;34;73;48;2;114;0;8m▄\e[48;2;231;34;73m        \e[38;2;231;34;73;48;2;226;30;69m▄\e[38;2;231;34;73;48;2;177;7;41m▄\e[38;2;231;34;73;48;2;122;0;12m▄\e[38;2;231;34;73;48;2;206;4;62m▄\e[38;2;122;1;12;48;2;121;3;7m▄\e[38;2;168;27;47;49m▄\e[49m               \e[m
\e[49m    \e[48;2;254;75;110m \e[49;38;2;232;60;93m▀\e[49m   \e[38;2;250;70;103;48;2;115;0;9m▄\e[38;2;115;0;9;48;2;254;75;110m▄\e[38;2;115;0;9;49m▄\e[38;2;115;0;9;48;2;113;0;5m▄\e[38;2;252;251;248;48;2;117;0;8m▄\e[38;2;254;75;110;48;2;205;5;63m▄▄\e[38;2;211;9;67;48;2;143;0;40m▄\e[38;2;134;0;30;48;2;231;34;73m▄\e[38;2;208;210;207;48;2;115;0;9m▄\e[48;2;208;210;207m \e[38;2;166;111;113;48;2;151;79;85m▄\e[38;2;254;255;252;48;2;115;0;9m▄\e[38;2;115;0;9;48;2;185;128;131m▄\e[38;2;254;255;252;48;2;190;137;139m▄\e[38;2;176;111;114;48;2;119;4;9m▄\e[38;2;254;255;252;48;2;255;159;35m▄\e[38;2;115;0;9;48;2;255;159;35m▄\e[38;2;118;5;14;48;2;254;255;252m▄\e[38;2;115;0;9;48;2;254;255;252m▄\e[38;2;208;210;207;48;2;248;152;34m▄\e[48;2;208;210;207m  \e[38;2;231;34;73;48;2;115;0;9m▄\e[48;2;231;34;73m                \e[38;2;231;34;73;48;2;114;0;8m▄\e[38;2;145;7;23;49m▄\e[49m             \e[m
\e[49m    \e[49;38;2;115;0;9m▀\e[49m    \e[49;38;2;115;0;9m▀\e[49m \e[38;2;115;0;9;49m▄\e[38;2;143;54;61;48;2;253;253;250m▄\e[38;2;119;19;26;48;2;115;0;9m▄\e[48;2;254;75;110m   \e[48;2;208;210;207m  \e[48;2;115;0;9m \e[48;2;254;255;252m  \e[48;2;115;0;9m \e[38;2;211;179;180;48;2;254;255;252m▄\e[38;2;215;114;26;48;2;254;255;252m▄\e[38;2;115;0;9;48;2;254;255;252m▄\e[48;2;208;210;207m \e[38;2;115;0;9;48;2;208;210;207m▄\e[48;2;208;210;207m   \e[38;2;118;10;15;48;2;208;210;207m▄\e[38;2;231;34;73;48;2;198;186;184m▄\e[38;2;208;210;207;48;2;201;22;52m▄\e[38;2;208;210;207;48;2;231;34;73m▄\e[49;38;2;231;34;73m▀\e[38;2;114;0;8;48;2;231;34;73m▄\e[38;2;174;10;37;48;2;231;34;73m▄\e[48;2;231;34;73m          \e[38;2;215;26;61;48;2;231;34;73m▄\e[48;2;231;34;73m  \e[38;2;231;34;73;48;2;228;32;71m▄\e[38;2;231;34;73;49m▄\e[49m           \e[m
\e[49m           \e[38;2;254;255;252;48;2;186;130;132m▄\e[38;2;230;131;30;48;2;185;80;20m▄\e[38;2;145;34;13;48;2;115;0;9m▄\e[38;2;115;0;9;48;2;119;7;16m▄\e[38;2;212;47;76;48;2;254;75;110m▄\e[48;2;254;75;110m \e[48;2;208;210;207m \e[38;2;129;31;39;48;2;208;210;207m▄\e[48;2;115;0;9m  \e[38;2;255;159;35;48;2;115;0;9m▄\e[38;2;255;159;35;48;2;126;13;10m▄\e[48;2;254;255;252m   \e[48;2;208;210;207m   \e[38;2;120;13;21;48;2;208;210;207m▄\e[48;2;208;210;207m \e[48;2;231;34;73m  \e[38;2;231;34;73;48;2;123;19;27m▄\e[38;2;178;141;144;48;2;208;210;207m▄\e[38;2;120;9;18;48;2;206;206;203m▄\e[38;2;122;15;23;49m▄\e[38;2;197;185;184;48;2;208;210;207m▄\e[48;2;208;210;207m \e[38;2;143;66;72;48;2;195;181;180m▄\e[49;38;2;226;32;70m▀\e[49;38;2;231;34;73m▀\e[38;2;230;33;72;48;2;231;34;73m▄\e[48;2;231;34;73m       \e[38;2;231;34;73;48;2;141;5;19m▄\e[38;2;115;0;9;48;2;231;34;73m▄\e[38;2;203;4;62;48;2;155;1;44m▄\e[38;2;254;75;110;48;2;117;0;6m▄\e[49m          \e[m
\e[49m          \e[38;2;120;15;19;48;2;114;0;8m▄\e[38;2;188;166;167;48;2;254;255;252m▄\e[38;2;254;255;252;48;2;230;217;216m▄\e[38;2;208;210;207;48;2;255;159;35m▄\e[38;2;208;210;207;48;2;115;0;9m▄\e[48;2;208;210;207m \e[38;2;208;210;207;48;2;254;75;110m▄\e[48;2;208;210;207m \e[38;2;208;210;207;48;2;115;2;9m▄\e[38;2;143;31;14;48;2;255;159;35m▄\e[38;2;149;40;14;48;2;255;159;35m▄\e[38;2;227;203;203;48;2;255;159;35m▄\e[38;2;254;255;252;48;2;115;0;9m▄\e[48;2;254;255;252m   \e[48;2;208;210;207m   \e[38;2;152;85;88;48;2;147;72;77m▄\e[48;2;231;34;73m   \e[38;2;222;26;68;48;2;231;34;73m▄\e[38;2;208;210;207;48;2;115;0;9m▄\e[38;2;184;155;154;48;2;208;210;207m▄\e[38;2;182;152;154;48;2;208;210;207m▄\e[48;2;208;210;207m \e[38;2;208;210;207;48;2;180;143;144m▄\e[49;38;2;114;0;8m▀\e[49m   \e[49;38;2;115;0;9m▀\e[49;38;2;231;34;73m▀\e[48;2;231;34;73m       \e[38;2;205;19;55;49m▄\e[49;38;2;251;72;108m▀\e[48;2;254;75;110m \e[49m         \e[m
\e[49m          \e[38;2;115;0;9;48;2;187;163;161m▄\e[48;2;208;210;207m  \e[38;2;116;4;12;48;2;208;210;207m▄\e[48;2;208;210;207m  \e[38;2;165;114;115;48;2;208;210;207m▄\e[48;2;208;210;207m   \e[38;2;208;210;207;48;2;209;211;208m▄\e[38;2;208;210;207;48;2;254;255;252m▄▄▄\e[48;2;208;210;207m     \e[38;2;150;9;24;48;2;115;0;9m▄\e[38;2;139;6;17;48;2;231;34;73m▄\e[48;2;231;34;73m  \e[38;2;115;0;9;48;2;179;2;45m▄\e[38;2;169;125;127;48;2;206;207;204m▄\e[38;2;187;162;162;48;2;208;210;207m▄\e[48;2;208;210;207m \e[38;2;208;210;207;48;2;165;112;116m▄\e[38;2;115;0;9;48;2;208;210;207m▄\e[49m       \e[38;2;114;0;8;48;2;231;34;73m▄\e[38;2;203;19;52;48;2;231;34;73m▄\e[48;2;231;34;73m     \e[38;2;115;0;9;49m▄\e[49m \e[38;2;115;0;9;48;2;196;43;65m▄\e[49m        \e[m
\e[49m           \e[48;2;208;210;207m                  \e[38;2;129;0;14;48;2;231;34;73m▄\e[48;2;231;34;73m   \e[38;2;146;9;23;48;2;116;0;10m▄\e[48;2;208;210;207m  \e[38;2;208;210;207;48;2;138;54;60m▄\e[38;2;146;67;74;48;2;208;210;207m▄\e[49m         \e[49;38;2;154;4;45m▀\e[38;2;115;0;9;48;2;231;34;73m▄\e[38;2;143;0;40;48;2;231;34;73m▄\e[38;2;205;5;63;48;2;225;25;69m▄\e[38;2;205;5;63;48;2;146;0;42m▄\e[38;2;205;5;63;48;2;197;12;58m▄\e[38;2;124;0;19;48;2;115;0;9m▄\e[49m          \e[m
\e[49m            \e[38;2;114;0;8;48;2;208;210;207m▄\e[48;2;208;210;207m              \e[38;2;115;0;9;48;2;208;210;207m▄\e[38;2;115;0;9;48;2;125;1;13m▄\e[48;2;231;34;73m    \e[38;2;129;33;40;48;2;115;0;9m▄\e[38;2;208;210;207;48;2;141;56;63m▄\e[48;2;208;210;207m \e[38;2;208;210;207;48;2;173;131;133m▄\e[38;2;123;20;28;48;2;208;210;207m▄\e[38;2;126;24;32;49m▄\e[49m         \e[49;38;2;149;6;25m▀\e[38;2;254;75;110;48;2;213;7;63m▄\e[48;2;254;75;110m   \e[38;2;114;0;8;48;2;115;0;9m▄\e[49m          \e[m
\e[49m             \e[49;38;2;119;0;0m▀\e[49;38;2;208;210;207m▀\e[38;2;115;0;9;48;2;208;210;207m▄\e[48;2;208;210;207m        \e[38;2;115;0;9;48;2;208;210;207m▄\e[48;2;208;210;207m \e[38;2;228;33;70;48;2;115;0;9m▄\e[48;2;231;34;73m \e[38;2;231;34;73;48;2;157;8;29m▄\e[48;2;231;34;73m   \e[38;2;117;0;9;48;2;231;34;73m▄\e[38;2;208;209;206;48;2;207;202;201m▄\e[38;2;208;210;207;48;2;132;40;45m▄\e[48;2;208;210;207m \e[38;2;208;210;207;48;2;115;1;9m▄\e[48;2;208;210;207m  \e[49m          \e[48;2;254;75;110m   \e[38;2;115;0;9;48;2;254;75;110m▄\e[49m           \e[m
\e[49m                  \e[38;2;114;0;8;48;2;208;210;207m▄\e[48;2;208;210;207m      \e[38;2;199;191;189;48;2;208;210;207m▄\e[48;2;231;34;73m      \e[38;2;155;92;96;48;2;231;34;73m▄\e[49m \e[48;2;208;210;207m     \e[38;2;208;210;207;48;2;115;0;9m▄\e[49m         \e[48;2;254;75;110m  \e[49;38;2;251;72;107m▀\e[49m            \e[m
\e[49m                \e[38;2;114;0;8;49m▄\e[38;2;131;35;43;49m▄\e[38;2;154;88;92;49m▄\e[38;2;115;0;9;48;2;208;210;207m▄\e[48;2;208;210;207m     \e[38;2;190;171;169;48;2;166;116;117m▄\e[48;2;231;34;73m     \e[38;2;210;26;57;48;2;205;24;57m▄\e[38;2;205;5;63;49m▄\e[49m \e[48;2;208;210;207m      \e[38;2;139;55;61;49m▄\e[49m      \e[38;2;119;0;0;49m▄\e[49;38;2;206;48;75m▀\e[49;38;2;138;11;24m▀\e[49m              \e[m
\e[49m             \e[38;2;114;0;6;49m▄\e[38;2;208;210;207;49m▄\e[48;2;208;210;207m      \e[38;2;176;140;143;48;2;208;210;207m▄\e[48;2;208;210;207m \e[38;2;205;204;202;48;2;208;210;207m▄\e[48;2;208;210;207m \e[38;2;208;210;207;48;2;207;208;205m▄\e[48;2;208;210;207m  \e[38;2;208;210;207;48;2;115;0;9m▄\e[38;2;208;210;207;48;2;225;25;69m▄\e[38;2;117;6;14;48;2;231;34;73m▄\e[38;2;254;75;110;48;2;205;5;63m▄\e[38;2;254;75;110;48;2;245;69;103m▄\e[49m \e[48;2;208;210;207m       \e[49m                       \e[m
\e[49m            \e[38;2;161;105;107;49m▄\e[48;2;208;210;207m         \e[38;2;115;0;9;48;2;208;210;207m▄\e[48;2;208;210;207m        \e[38;2;121;12;21;48;2;254;75;110m▄\e[48;2;254;75;110m \e[48;2;114;0;8m \e[48;2;208;210;207m       \e[38;2;205;203;201;48;2;115;0;9m▄\e[49m                      \e[m
\e[49m           \e[38;2;115;0;9;49m▄\e[48;2;208;210;207m        \e[38;2;138;52;58;48;2;133;42;49m▄\e[38;2;115;0;9;48;2;208;210;207m▄\e[48;2;208;210;207m        \e[38;2;115;0;9;48;2;128;28;36m▄\e[38;2;204;199;197;48;2;208;209;206m▄\e[38;2;208;209;206;48;2;254;75;110m▄\e[49;38;2;114;0;8m▀\e[38;2;175;135;138;48;2;208;210;207m▄\e[48;2;208;210;207m      \e[38;2;193;176;176;48;2;208;210;207m▄\e[49m                      \e[m
\e[49m           \e[38;2;193;178;180;48;2;141;62;64m▄\e[48;2;208;210;207m        \e[38;2;116;3;11;48;2;121;16;23m▄\e[48;2;208;210;207m         \e[38;2;134;45;52;48;2;122;16;24m▄\e[49;38;2;125;23;31m▀\e[49;38;2;119;0;0m▀\e[49m  \e[49;38;2;208;210;207m▀▀▀▀▀▀\e[49m                       \e[m
\e[49m           \e[49;38;2;143;58;65m▀\e[48;2;208;210;207m      \e[38;2;156;90;96;48;2;208;210;207m▄\e[49;38;2;208;210;207m▀\e[49m \e[48;2;208;210;207m         \e[38;2;115;0;9;48;2;126;24;33m▄\e[49m                                 \e[m
\e[49m              \e[49;38;2;113;0;8m▀\e[49m      \e[49;38;2;208;210;207m▀\e[38;2;132;37;43;48;2;208;210;207m▄\e[48;2;208;210;207m     \e[38;2;138;54;58;48;2;208;210;207m▄\e[49;38;2;208;210;207m▀\e[49;38;2;119;0;0m▀\e[49m                                 \e[m
\e[49m                                                                \e[m
\e[49m                                                                \e[m
";

printf "\n%s\n" "${delimiter}"
printf "\e[1m\e[32mTiny script edited by Tiny Jasmini (JasminDreasond) :3\n"
printf "\e[1m\e[34mTested on Kubuntu 24.04.\e[0m\n"
printf "\e[1m\e[32mInstall script for stable-diffusion + Web UI\n"
printf "\n%s\n" "${delimiter}"

# Do not run as root
if [[ $(id -u) -eq 0 && can_run_as_root -eq 0 ]]
then
    printf "\n%s\n" "${delimiter}"
    printf "\e[1m\e[31mERROR: This script must not be launched as root, aborting...\e[0m"
    printf "\n%s\n" "${delimiter}"
    exit 1
else
    printf "\n%s\n" "${delimiter}"
    printf "Running on \e[1m\e[32m%s\e[0m user" "$(whoami)"
    printf "\n%s\n" "${delimiter}"
fi

if [[ $(getconf LONG_BIT) = 32 ]]
then
    printf "\n%s\n" "${delimiter}"
    printf "\e[1m\e[31mERROR: Unsupported Running on a 32bit OS\e[0m"
    printf "\n%s\n" "${delimiter}"
    exit 1
fi

if [[ -d .git ]]
then
    printf "\n%s\n" "${delimiter}"
    printf "Repo already cloned, using it as install directory"
    printf "\n%s\n" "${delimiter}"
    install_dir="${PWD}/../"
    clone_dir="${PWD##*/}"
fi

# Check prerequisites
gpu_info=$(lspci 2>/dev/null | grep -E "VGA|Display")
case "$gpu_info" in
    *"Navi 1"*)
        export HSA_OVERRIDE_GFX_VERSION=10.3.0
        if [[ -z "${TORCH_COMMAND}" ]]
        then
            pyv="$(${python_cmd} -c 'import sys; print(".".join(map(str, sys.version_info[0:2])))')"
            if [[ $(bc <<< "$pyv <= 3.10") -eq 1 ]]
            then
                # Navi users will still use torch 1.13 because 2.0 does not seem to work.
                export TORCH_COMMAND="pip install --pre torch torchvision --index-url https://download.pytorch.org/whl/nightly/rocm5.6"
            else
                printf "\e[1m\e[31mERROR: RX 5000 series GPUs must be using at max python 3.10, aborting...\e[0m"
                exit 1
            fi
        fi
    ;;
    *"Navi 2"*) export HSA_OVERRIDE_GFX_VERSION=10.3.0
    ;;
    *"Navi 3"*) [[ -z "${TORCH_COMMAND}" ]] && \
         export TORCH_COMMAND="pip install --pre torch torchvision --index-url https://download.pytorch.org/whl/nightly/rocm5.7"
    ;;
    *"Renoir"*) export HSA_OVERRIDE_GFX_VERSION=9.0.0
        printf "\n%s\n" "${delimiter}"
        printf "Experimental support for Renoir: make sure to have at least 4GB of VRAM and 10GB of RAM or enable cpu mode: --use-cpu all --no-half"
        printf "\n%s\n" "${delimiter}"
    ;;
    *)
    ;;
esac
if ! echo "$gpu_info" | grep -q "NVIDIA";
then
    if echo "$gpu_info" | grep -q "AMD" && [[ -z "${TORCH_COMMAND}" ]]
    then
        export TORCH_COMMAND="pip install torch==2.0.1+rocm5.4.2 torchvision==0.15.2+rocm5.4.2 --index-url https://download.pytorch.org/whl/rocm5.4.2"
    elif echo "$gpu_info" | grep -q "Huawei" && [[ -z "${TORCH_COMMAND}" ]]
    then
        export TORCH_COMMAND="pip install torch==2.1.0 torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu; pip install torch_npu"

    fi
fi

for preq in "${GIT}" "${python_cmd}"
do
    if ! hash "${preq}" &>/dev/null
    then
        printf "\n%s\n" "${delimiter}"
        printf "\e[1m\e[31mERROR: %s is not installed, aborting...\e[0m" "${preq}"
        printf "\n%s\n" "${delimiter}"
        exit 1
    fi
done

if [[ $use_venv -eq 1 ]] && ! "${python_cmd}" -c "import venv" &>/dev/null
then
    printf "\n%s\n" "${delimiter}"
    printf "\e[1m\e[31mERROR: python3-venv is not installed, aborting...\e[0m"
    printf "\n%s\n" "${delimiter}"
    exit 1
fi

cd "${install_dir}"/ || { printf "\e[1m\e[31mERROR: Can't cd to %s/, aborting...\e[0m" "${install_dir}"; exit 1; }
if [[ -d "${clone_dir}" ]]
then
    cd "${clone_dir}"/ || { printf "\e[1m\e[31mERROR: Can't cd to %s/%s/, aborting...\e[0m" "${install_dir}" "${clone_dir}"; exit 1; }
else
    printf "\n%s\n" "${delimiter}"
    printf "Clone stable-diffusion-webui"
    printf "\n%s\n" "${delimiter}"
    "${GIT}" clone https://github.com/lllyasviel/stable-diffusion-webui-forge "${clone_dir}"
    cd "${clone_dir}"/ || { printf "\e[1m\e[31mERROR: Can't cd to %s/%s/, aborting...\e[0m" "${install_dir}" "${clone_dir}"; exit 1; }
fi

if [[ $use_venv -eq 1 ]] && [[ -z "${VIRTUAL_ENV}" ]];
then
    printf "\n%s\n" "${delimiter}"
    printf "Create and activate python venv"
    printf "\n%s\n" "${delimiter}"
    cd "${install_dir}"/"${clone_dir}"/ || { printf "\e[1m\e[31mERROR: Can't cd to %s/%s/, aborting...\e[0m" "${install_dir}" "${clone_dir}"; exit 1; }
    if [[ ! -d "${venv_dir}" ]]
    then
        "${python_cmd}" -m venv "${venv_dir}"
        first_launch=1
    fi
    # shellcheck source=/dev/null
    if [[ -f "${venv_dir}"/bin/activate ]]
    then
        source "${venv_dir}"/bin/activate
    else
        printf "\n%s\n" "${delimiter}"
        printf "\e[1m\e[31mERROR: Cannot activate python venv, aborting...\e[0m"
        printf "\n%s\n" "${delimiter}"
        exit 1
    fi
else
    printf "\n%s\n" "${delimiter}"
    printf "python venv already activate or run without venv: ${VIRTUAL_ENV}"
    printf "\n%s\n" "${delimiter}"
fi

# Try using TCMalloc on Linux
prepare_tcmalloc() {
    if [[ "${OSTYPE}" == "linux"* ]] && [[ -z "${NO_TCMALLOC}" ]] && [[ -z "${LD_PRELOAD}" ]]; then
        # check glibc version
        LIBC_VER=$(echo $(ldd --version | awk 'NR==1 {print $NF}') | grep -oP '\d+\.\d+')
        echo "glibc version is $LIBC_VER"
        libc_vernum=$(expr $LIBC_VER)
        # Since 2.34 libpthread is integrated into libc.so
        libc_v234=2.34
        # Define Tcmalloc Libs arrays
        TCMALLOC_LIBS=("libtcmalloc(_minimal|)\.so\.\d" "libtcmalloc\.so\.\d")
        # Traversal array
        for lib in "${TCMALLOC_LIBS[@]}"
        do
            # Determine which type of tcmalloc library the library supports
            TCMALLOC="$(PATH=/usr/sbin:$PATH ldconfig -p | grep -P $lib | head -n 1)"
            TC_INFO=(${TCMALLOC//=>/})
            if [[ ! -z "${TC_INFO}" ]]; then
                echo "Check TCMalloc: ${TC_INFO}"
                # Determine if the library is linked to libpthread and resolve undefined symbol: pthread_key_create
                if [ $(echo "$libc_vernum < $libc_v234" | bc) -eq 1 ]; then
                    # glibc < 2.34 pthread_key_create into libpthread.so. check linking libpthread.so...
                    if ldd ${TC_INFO[2]} | grep -q 'libpthread'; then
                        echo "$TC_INFO is linked with libpthread,execute LD_PRELOAD=${TC_INFO[2]}"
                        # set fullpath LD_PRELOAD (To be on the safe side)
                        export LD_PRELOAD="${TC_INFO[2]}"
                        break
                    else
                        echo "$TC_INFO is not linked with libpthread will trigger undefined symbol: pthread_Key_create error"
                    fi
                else
                    # Version 2.34 of libc.so (glibc) includes the pthread library IN GLIBC. (USE ubuntu 22.04 and modern linux system and WSL)
                    # libc.so(glibc) is linked with a library that works in ALMOST ALL Linux userlands. SO NO CHECK!
                    echo "$TC_INFO is linked with libc.so,execute LD_PRELOAD=${TC_INFO[2]}"
                    # set fullpath LD_PRELOAD (To be on the safe side)
                    export LD_PRELOAD="${TC_INFO[2]}"
                    break
                fi
            fi
        done
        if [[ -z "${LD_PRELOAD}" ]]; then
            printf "\e[1m\e[31mCannot locate TCMalloc. Do you have tcmalloc or google-perftool installed on your system? (improves CPU memory usage)\e[0m\n"
        fi
    fi
}

KEEP_GOING=1
export SD_WEBUI_RESTART=tmp/restart
while [[ "$KEEP_GOING" -eq "1" ]]; do
    if [[ ! -z "${ACCELERATE}" ]] && [ ${ACCELERATE}="True" ] && [ -x "$(command -v accelerate)" ]; then
        printf "\n%s\n" "${delimiter}"
        printf "Accelerating launch.py..."
        printf "\n%s\n" "${delimiter}"
        prepare_tcmalloc
        accelerate launch --num_cpu_threads_per_process=6 "${LAUNCH_SCRIPT}" "$@"
    else
        printf "\n%s\n" "${delimiter}"
        printf "Launching launch.py..."
        printf "\n%s\n" "${delimiter}"
        prepare_tcmalloc
        "${python_cmd}" -u "${LAUNCH_SCRIPT}" "$@"
    fi

    if [[ ! -f tmp/restart ]]; then
        KEEP_GOING=0
    fi
done
