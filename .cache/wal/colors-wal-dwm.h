static const char norm_fg[] = "#1d1f21";
static const char norm_bg[] = "#ffffff";
static const char norm_border[] = "#b4b7b4";

static const char sel_fg[] = "#1d1f21";
static const char sel_bg[] = "#198844";
static const char sel_border[] = "#1d1f21";

static const char urg_fg[] = "#1d1f21";
static const char urg_bg[] = "#CC342B";
static const char urg_border[] = "#CC342B";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
