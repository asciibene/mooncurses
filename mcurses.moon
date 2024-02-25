-- TODO Make a dict of colors with their appropriate color codes
export ANSIColorCodes={ red: 31,
                        green: 32,
                        --
                      
                      }

export class MoonCurse

  new: =>
    -- Initialize terminal state here if necessary
    @rows = tonumber(io.popen("tput lines")\read("*a"))
    @cols = tonumber(io.popen("tput cols")\read("*a"))

  clearScreen: =>
    print "\027[2J"
  
  cls=clearScreen
  
  printAt: (y,x,str) =>
    print "\027[#{y};#{x}H"..str

  carriageReturn: =>
    print "\r"

  linefeed: =>
    print "\f"

  setBold: =>
    print "\027[1m"

  setUnderline: =>
    print "\027[4m"

  setBlink: =>
    print "\027[5m"

  setReverse: =>
    print "\027[7m"

  saveCurs: =>
    print "\027[s"

  restoreCurs: =>
    print "\027[u"
  
  setWindowTitle: (t) =>
    if not t then return false
    print "\027[0;#{t}\7"

  moveCursor: (x, y) =>
    -- TODO FIXME does not move cursor along x axis, only changes line
    -- XXX Use printAt for now cuz we need to append string immediately after sending below esc sequence
    -- to move the cursor, if you only move with no text the cursor goes back at start.
    print "\027[#{y};#{x}H"

  setColor: (colorCode) =>
    print "\027[#{colorCode}m"

  reset: =>
    print "\027[0m"
  
  get_terminal_size: =>
    @rows = tonumber(io.popen("tput lines")\read("*a"))
    @cols = tonumber(io.popen("tput cols")\read("*a"))
    return @rows, @cols

  read_key: =>
    if @rows==nil then @rows = tonumber(io.popen("tput lines")\read("*a"))
    @moveCursor(0,@rows-1)
    io.stdout\setvbuf("line",1)
    io.stdin\setvbuf("line",1)
    key = io.stdin\read(1)
    io.stdin\flush!
    return key



export Terminal,ANSIColorCodes 
Terminal
