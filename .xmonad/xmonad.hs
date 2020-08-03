import XMonad
import XMonad.Layout.Spacing
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks
import XMonad.Layout.IndependentScreens
import Data.Monoid
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map as M

myTerminal = "kitty"
myDmenu = "dmenu_run -b -fn \"xft:FuraCodeNerdFont:size=18\""
myBrowser = "google-chrome-stable"
myEditor = "emacs"
myPassmanager = "bitwarden"
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True
myBorderWidth = 1
myModMask = mod4Mask
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#0000ff"

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, xK_Return), spawn $ XMonad.terminal conf)
    , ((modm, xK_p), spawn myDmenu)
    , ((modm, xK_g), spawn myBrowser)
    , ((modm, xK_e), spawn myEditor)
    , ((modm, xK_b), spawn myPassmanager)
    , ((modm, xK_d), kill)
    , ((modm, xK_f), sendMessage NextLayout)
    , ((modm .|. shiftMask, xK_f), withFocused $ windows . W.sink)
    , ((modm, xK_semicolon), setLayout $ XMonad.layoutHook conf)
    , ((modm .|. shiftMask, xK_semicolon), refresh)
    , ((modm, xK_h), sendMessage Shrink)
    , ((modm, xK_j), windows W.focusDown)
    , ((modm, xK_k), windows W.focusUp)
    , ((mod1Mask, xK_Tab), windows W.focusDown)
    , ((mod1Mask .|. shiftMask, xK_Tab), windows W.focusUp)
    , ((modm, xK_l), sendMessage Expand)
    , ((modm, xK_v), windows W.focusMaster)
    , ((modm, xK_space), windows W.swapMaster)
    , ((modm, xK_equal), decWindowSpacing 15)
    , ((modm, xK_minus), incWindowSpacing 15)
    , ((modm, xK_0), setWindowSpacing (Border 0 0 0 0))
    , ((modm .|. shiftMask, xK_h), sendMessage (IncMasterN 1))
    , ((modm .|. shiftMask, xK_j), windows W.swapDown)
    , ((modm .|. shiftMask, xK_k), windows W.swapUp)
    , ((modm .|. shiftMask, xK_l), sendMessage (IncMasterN (-1)))
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))
    , ((modm, xK_q), spawn "xmonad --recompile; xmonad --restart")
    ]
    ++
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_u, xK_i, xK_o] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
    ]

myLayout = avoidStruts $ mySpacing $ tiled ||| Full
  where
    mySpacing = spacingRaw False (Border 0 0 0 0) True (Border 0 0 0 0) True
    tiled   = Tall nmaster delta ratio
    nmaster = 1
    ratio   = 1/2
    delta   = 10/100

myPP = xmobarPP { ppOutput          = putStrLn
                , ppCurrent         = xmobarColor "#336433" "" . wrap "[" "]"
                , ppTitle           = xmobarColor "darkgreen"  "" . shorten 20
                , ppUrgent          = xmobarColor "red" "yellow"
                }

main = do 
    nScreens <- countScreens
    barHandles <- mapM (\screen -> spawnPipe $ "xmobar -x " ++ (show screen)) [0 .. (fromIntegral nScreens) - 1]
    putStrLn (show $ (withScreens nScreens myWorkspaces))
    putStrLn (show $ map (\screen -> head screen) (withScreens nScreens myWorkspaces))
    xmonad $ docks def {
            terminal           = myTerminal,
            focusFollowsMouse  = myFocusFollowsMouse,
            borderWidth        = myBorderWidth,
            modMask            = myModMask,
            workspaces         = myWorkspaces,
            normalBorderColor  = myNormalBorderColor,
            focusedBorderColor = myFocusedBorderColor,
            keys               = myKeys,
            mouseBindings      = myMouseBindings,
            layoutHook         = myLayout, 
	    logHook            = mapM_ (\handle -> dynamicLogWithPP $ defaultPP { ppOutput = hPutStrLn handle }) barHandles
    }
