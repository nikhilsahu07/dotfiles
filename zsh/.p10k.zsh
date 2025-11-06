# Custom P10K configuration inspired by Starship with Catppuccin Mocha theme
# Based on the starship.toml configuration provided

# Temporarily change options.
'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Unset all configuration options.
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # Zsh >= 5.1 is required.
  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  # Soft Pastel Color Palette (256-color codes)
  local rosewater=224      # Soft pink-white
  local flamingo=217       # Soft coral  
  local pink=218           # Soft pink
  local mauve=183          # Soft purple
  local red=217            # Soft red
  local maroon=216         # Soft maroon
  local peach=223          # Soft peach
  local yellow=228         # Soft yellow
  local green=157          # Soft green
  local teal=152           # Soft teal
  local sky=159            # Soft sky blue
  local sapphire=153       # Soft sapphire
  local blue=153           # Soft blue
  local lavender=183       # Soft lavender
  local text=252           # Soft white
  local subtext1=249       # Light gray
  local subtext0=246       # Medium gray
  local overlay2=243       # Soft gray
  local overlay1=240       # Darker soft gray
  local overlay0=237       # Dark soft gray
  local surface2=236       # Dark surface
  local surface1=235       # Darker surface
  local surface0=234       # Background surface
  local base=233           # Dark base
  local mantle=232         # Darker base
  local crust=231          # Darkest base

  # Left prompt segments (matching starship format)
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon_joined           # OS identifier (surface0 bg)
    user_joined              # Username (surface0 bg)
    dir                      # Directory (peach bg)
    vcs                      # Git info (green bg)
    virtualenv               # Virtual environment (mauve bg)
    # Docker (blue bg)
    docker_context
    # Time (purple bg)
    time
    newline                  # Line break
    prompt_char              # Prompt character
  )

  # Right prompt (empty to match starship layout)
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

  # Use Nerd Font icons
  typeset -g POWERLEVEL9K_MODE=nerdfont-v3

  # No icon padding
  typeset -g POWERLEVEL9K_ICON_PADDING=none

  # Background color
  typeset -g POWERLEVEL9K_BACKGROUND=$base

  # Segment separators (pointy arrows)
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='|'
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='|'

  # Prompt ends
  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'

  # Add newline before each prompt
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  #################################[ OS Icon ]##################################
  typeset -g POWERLEVEL9K_OS_ICON_BACKGROUND=$surface0
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=$sky
  
  # OS symbols (matching starship config)
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='${P9K_OS_ICON} '
  
  #################################[ Username ]##################################
  typeset -g POWERLEVEL9K_USER_BACKGROUND=$surface0
  typeset -g POWERLEVEL9K_USER_DEFAULT_FOREGROUND=$text
  typeset -g POWERLEVEL9K_USER_ROOT_FOREGROUND=$peach
  typeset -g POWERLEVEL9K_USER_TEMPLATE=' %n '
  typeset -g POWERLEVEL9K_USER_DEFAULT_TEMPLATE=$POWERLEVEL9K_USER_TEMPLATE
  typeset -g POWERLEVEL9K_USER_ROOT_TEMPLATE=$POWERLEVEL9K_USER_TEMPLATE

  #################################[ Directory ]##################################
  typeset -g POWERLEVEL9K_DIR_BACKGROUND=$peach
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=$base
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=$base
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=$base
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=false
  
  # Directory truncation
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_last
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=…/
  
  # Directory substitutions (matching starship config)
  typeset -g POWERLEVEL9K_DIR_CLASSES=(
    '*/Documents(|/*)'  DOCUMENTS  ''
    '*/Downloads(|/*)'  DOWNLOADS  ''
    '*/Music(|/*)'      MUSIC      ''
    '*/Pictures(|/*)'   PICTURES   ''
    '*/Developer(|/*)'  DEVELOPER  ''
    '*'                 DEFAULT    ''
  )
  
  typeset -g POWERLEVEL9K_DIR_DOCUMENTS_VISUAL_IDENTIFIER_EXPANSION='󰈙'
  typeset -g POWERLEVEL9K_DIR_DOWNLOADS_VISUAL_IDENTIFIER_EXPANSION=''
  typeset -g POWERLEVEL9K_DIR_MUSIC_VISUAL_IDENTIFIER_EXPANSION='󰝚'
  typeset -g POWERLEVEL9K_DIR_PICTURES_VISUAL_IDENTIFIER_EXPANSION=''
  typeset -g POWERLEVEL9K_DIR_DEVELOPER_VISUAL_IDENTIFIER_EXPANSION='󰲋'

  #################################[ Git Status ]##################################
  typeset -g POWERLEVEL9K_VCS_BACKGROUND=$green
  typeset -g POWERLEVEL9K_VCS_FOREGROUND=$base
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$base
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$base
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$base
  typeset -g POWERLEVEL9K_VCS_STAGED_FOREGROUND=$base
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_FOREGROUND=$base
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_FOREGROUND=$base
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND=$base
  typeset -g POWERLEVEL9K_VCS_BEHIND_FOREGROUND=$base
  typeset -g POWERLEVEL9K_VCS_AHEAD_FOREGROUND=$base
  typeset -g POWERLEVEL9K_VCS_STASH_FOREGROUND=$base

  # Git branch icon
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=''
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON=''
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
  typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON='!'
  typeset -g POWERLEVEL9K_VCS_STAGED_ICON='+'
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='⇣'
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='⇡'
  typeset -g POWERLEVEL9K_VCS_STASH_ICON='*'

  #################################[ Programming Languages ]##################################
  # All programming language segments use teal background
  
  # Go
  typeset -g POWERLEVEL9K_GO_VERSION_BACKGROUND=$teal
  typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND=$base
  typeset -g POWERLEVEL9K_GO_VERSION_VISUAL_IDENTIFIER_EXPANSION=''
  
  # Node.js
  typeset -g POWERLEVEL9K_NODE_VERSION_BACKGROUND=$teal
  typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=$base
  typeset -g POWERLEVEL9K_NODE_VERSION_VISUAL_IDENTIFIER_EXPANSION=''
  

  # Python
  typeset -g POWERLEVEL9K_PYTHON_BACKGROUND=$teal
  typeset -g POWERLEVEL9K_PYTHON_FOREGROUND=$base
  typeset -g POWERLEVEL9K_PYTHON_VISUAL_IDENTIFIER_EXPANSION=''

  #################################[ Docker ]##################################
  typeset -g POWERLEVEL9K_DOCKER_CONTEXT_BACKGROUND=$blue
  typeset -g POWERLEVEL9K_DOCKER_CONTEXT_FOREGROUND=$base
  typeset -g POWERLEVEL9K_DOCKER_CONTEXT_VISUAL_IDENTIFIER_EXPANSION=''

  #################################[ Virtualenv ]##################################
  typeset -g POWERLEVEL9K_VIRTUALENV_BACKGROUND=$mauve
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=$base
  typeset -g POWERLEVEL9K_VIRTUALENV_VISUAL_IDENTIFIER_EXPANSION=''
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  typeset -g POWERLEVEL9K_VIRTUALENV_LEFT_DELIMITER=''
  typeset -g POWERLEVEL9K_VIRTUALENV_RIGHT_DELIMITER=''
  typeset -g POWERLEVEL9K_VIRTUALENV_PREFIX='%242F%f'
  typeset -g POWERLEVEL9K_VIRTUALENV_SUFFIX='%242F%f'
  # Always display just “venv” when any virtual environment is active
  function prompt_virtualenv() {
    [[ -n "$VIRTUAL_ENV" ]] && p10k segment -b $mauve -f $base -i '' -t 'venv'
  }
  typeset -g POWERLEVEL9K_VIRTUALENV_CONTENT_EXPANSION='venv'

  #################################[ Time ]##################################
  typeset -g POWERLEVEL9K_TIME_BACKGROUND=$pink
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=$base
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%R}'
  typeset -g POWERLEVEL9K_TIME_VISUAL_IDENTIFIER_EXPANSION='󰥔'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

  #################################[ Prompt Character ]##################################
  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_FOREGROUND=$green
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIINS_FOREGROUND=$peach
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VICMD_FOREGROUND=$teal  
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VICMD_FOREGROUND=$peach
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIVIS_FOREGROUND=$lavender
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIVIS_FOREGROUND=$peach
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIOWR_FOREGROUND=$mauve
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIOWR_FOREGROUND=$peach

  # Prompt character symbols (colored > arrow)
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIVIS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIVIS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIOWR_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIOWR_CONTENT_EXPANSION='❯'

  # Remove padding around prompt character
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_LEFT_WHITESPACE=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_RIGHT_WHITESPACE=

  #################################[ Transient Prompt ]##################################
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always

  #################################[ Instant Prompt ]##################################
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  #################################[ Hot Reload ]##################################
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  # Reload configuration if p10k is already loaded
  (( ! $+functions[p10k] )) || p10k reload
}

# Configuration file path
typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

# Restore options
(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
