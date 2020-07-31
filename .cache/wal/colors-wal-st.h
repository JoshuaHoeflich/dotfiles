const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#ffffff", /* black   */
  [1] = "#CC342B", /* red     */
  [2] = "#198844", /* green   */
  [3] = "#FBA922", /* yellow  */
  [4] = "#3971ED", /* blue    */
  [5] = "#A36AC7", /* magenta */
  [6] = "#3971ED", /* cyan    */
  [7] = "#373b41", /* white   */

  /* 8 bright colors */
  [8]  = "#b4b7b4",  /* black   */
  [9]  = "#CC342B",  /* red     */
  [10] = "#198844", /* green   */
  [11] = "#FBA922", /* yellow  */
  [12] = "#3971ED", /* blue    */
  [13] = "#A36AC7", /* magenta */
  [14] = "#3971ED", /* cyan    */
  [15] = "#1d1f21", /* white   */

  /* special colors */
  [256] = "#ffffff", /* background */
  [257] = "#373b41", /* foreground */
  [258] = "#373b41",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
