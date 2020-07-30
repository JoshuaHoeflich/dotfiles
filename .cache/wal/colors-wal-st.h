const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#1d1f21", /* black   */
  [1] = "#CC342B", /* red     */
  [2] = "#198844", /* green   */
  [3] = "#FBA922", /* yellow  */
  [4] = "#3971ED", /* blue    */
  [5] = "#A36AC7", /* magenta */
  [6] = "#3971ED", /* cyan    */
  [7] = "#c5c8c6", /* white   */

  /* 8 bright colors */
  [8]  = "#969896",  /* black   */
  [9]  = "#CC342B",  /* red     */
  [10] = "#198844", /* green   */
  [11] = "#FBA922", /* yellow  */
  [12] = "#3971ED", /* blue    */
  [13] = "#A36AC7", /* magenta */
  [14] = "#3971ED", /* cyan    */
  [15] = "#ffffff", /* white   */

  /* special colors */
  [256] = "#1d1f21", /* background */
  [257] = "#c5c8c6", /* foreground */
  [258] = "#c5c8c6",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
