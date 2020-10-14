;;; `cnfonts--custom-set-fontsnames' 列表有3个子列表，第1个为英文字体列表，第2个为中文字体列表，
;;; 第3个列表中的字体用于显示不常用汉字，每一个字体列表中，*第一个* *有效并可用* 的字体将被使用。
;;; 将光标移动到上述列表中，按 `C-c C-c' 可以测试字体显示效果。另外，用户可以通过命令
;;; `cnfonts-insert-fontname’ 来选择一个 *可用* 字体，然后在当前光标处插入其字体名称。
(setq cnfonts--custom-set-fontnames
      '(
        ("Monego" "Monaco" "Consolas" "Apple Color Emoji" "DejaVu Sans Mono" "Droid Sans Mono" "PragmataPro" "Courier" "Courier New" "Liberation Mono" "Ubuntu Mono" "Droid Sans Mono Pro" "Inconsolata" "Source Code Pro" "Lucida Console" "Envy Code R" "Andale Mono" "Lucida Sans Typewriter" "monoOne" "Lucida Typewriter" "Panic Sans" "Hack" "Bitstream Vera Sans Mono" "HyperFont" "PT Mono" "Ti92Pluspc" "Excalibur Monospace" "Menlof" "Cousine" "Fira Mono" "Lekton" "M+ 1mn" "BPmono" "Free Mono" "Anonymous Pro" "ProFont" "ProFontWindows" "Latin Modern Mono" "Code 2002" "ProggyCleanTT" "ProggyTinyTT")
        ("微软雅黑" "Apple Color Emoji" "Arial Unicode MS" "Microsoft Yahei" "Microsoft_Yahei" "文泉驿等宽微米黑" "文泉驿等宽正黑" "黑体" "Hiragino Sans GB" "文泉驿正黑" "文泉驿点阵正黑" "SimHei" "SimSun" "NSimSun" "FangSong" "KaiTi" "FangSong_GB2312" "KaiTi_GB2312" "LiSu" "YouYuan" "新宋体" "宋体" "楷体_GB2312" "仿宋_GB2312" "幼圆" "隶书" "STXihei" "STKaiti" "STSong" "STZhongsong" "STFangsong" "FZShuTi" "FZYaoti" "STCaiyun" "STHupo" "STLiti" "STXingkai" "STXinwei" "方正姚体" "方正舒体" "方正粗圆_GBK" "华文仿宋" "华文中宋" "华文彩云" "华文新魏" "华文细黑" "华文行楷") 
        ("HanaMinB")))

;;; `cnfonts--custom-set-fontsizes' 中，所有元素的结构都类似：(英文字号 中文字号 EXT-B字体字号)
;;; 将光标移动到各个数字上，按 C-c C-c 查看光标处字号的对齐效果。
;;; 按 C-<up> 增大光标处字号，按 C-<down> 减小光标处字号。
(setq cnfonts--custom-set-fontsizes
      '(
        (9     8.5  8.5)
        (10    9.5  9.0)
        (11.5 10.0 10.0)
        (12.0 10.5 10.5) ;; 4, using
        (12.5 11.0 11.0)
        (14   13.0 13.0)
        (16   15.0 15.0)
        (18   17.5 17.5)
        (20   24.0 24.0)
        (22   26.0 26.0)
       ))
