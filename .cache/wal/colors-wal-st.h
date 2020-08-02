const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#282936", /* black   */
  [1] = "#ea51b2", /* red     */
  [2] = "#00f769", /* green   */
  [3] = "#ebff87", /* yellow  */
  [4] = "#62d6e8", /* blue    */
  [5] = "#b45bcf", /* magenta */
  [6] = "#a1efe4", /* cyan    */
  [7] = "#e9e9f4", /* white   */

  /* 8 bright colors */
  [8]  = "#4d4f68",  /* black   */
  [9]  = "#ea51b2",  /* red     */
  [10] = "#00f769", /* green   */
  [11] = "#ebff87", /* yellow  */
  [12] = "#62d6e8", /* blue    */
  [13] = "#b45bcf", /* magenta */
  [14] = "#a1efe4", /* cyan    */
  [15] = "#f7f7fb", /* white   */

  /* special colors */
  [256] = "#282936", /* background */
  [257] = "#e9e9f4", /* foreground */
  [258] = "#e9e9f4",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
