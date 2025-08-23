# This file contains functions to wrap common commands with grc (Generic Colouriser).
# To use this, you must have grc installed.

# Function to check for grc. This prevents errors if grc is not installed.
function grc_available
  command -s grc >/dev/null
end

# Check if grc is available and then define the functions.
if grc_available
  # Network and System Monitoring Tools
  function ping
    grc ping $argv
  end
  function traceroute
    grc traceroute $argv
  end
  function netstat
    grc netstat $argv
  end
  function ifconfig
    grc ifconfig $argv
  end
  function dig
    grc dig $argv
  end
  function host
    grc host $argv
  end
  function iptables
    grc iptables $argv
  end
  function ss
    grc ss $argv
  end
  function route
    grc route $argv
  end

  # File and Directory Commands
  function ls
    grc ls $argv
  end
  function cat
    grc cat $argv
  end
  function tail
    grc tail $argv
  end
  function mount
    grc mount $argv
  end

  # System Information Commands
  function ps
    grc ps $argv
  end
  function df
    grc df $argv
  end
  function du
    grc du $argv
  end
  function whoami
    grc whoami $argv
  end
  function date
    grc date $argv
  end
  function uname
    grc uname $argv
  end

  # Special case: Git. `grc` has a specific configuration for git.
  # We should let `grc` handle the git command directly for consistency.
  function git
    grc git $argv
  end

end
