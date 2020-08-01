static const char norm_fg[] = "#f7f7fb";
static const char norm_bg[] = "#282936";
static const char norm_border[] = "#4d4f68";

static const char sel_fg[] = "#f7f7fb";
static const char sel_bg[] = "#00f769";
static const char sel_border[] = "#f7f7fb";

static const char urg_fg[] = "#f7f7fb";
static const char urg_bg[] = "#ea51b2";
static const char urg_border[] = "#ea51b2";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
