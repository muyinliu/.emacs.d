;;; `cnfonts--custom-set-fontsnames' 列表有3个子列表，第1个为英文字体列表，第2个为中文字体列表，
;;; 第3个列表中的字体用于显示不常用汉字，每一个字体列表中，*第一个* *有效并可用* 的字体将被使用。
;;; 将光标移动到上述列表中，按 `C-c C-c' 可以测试字体显示效果。另外，用户可以通过命令
;;; `cnfonts-insert-fontname’ 来选择一个 *可用* 字体，然后在当前光标处插入其字体名称。
(setq cnfonts--custom-set-fontnames
      '(;; 英文字体列表，Monaco 是 Mac OS X 下默认的英文字体，缺点是没有粗体
        ("Monego" "Monaco" "Consolas" "Apple Color Emoji" "DejaVu Sans Mono" "Droid Sans Mono" "PragmataPro" "Courier" "Courier New" "Liberation Mono" "Ubuntu Mono" "Droid Sans Mono Pro" "Inconsolata" "Source Code Pro" "Lucida Console" "Envy Code R" "Andale Mono" "Lucida Sans Typewriter" "monoOne" "Lucida Typewriter" "Panic Sans" "Hack" "Bitstream Vera Sans Mono" "HyperFont" "PT Mono" "Ti92Pluspc" "Excalibur Monospace" "Menlof" "Cousine" "Fira Mono" "Lekton" "M+ 1mn" "BPmono" "Free Mono" "Anonymous Pro" "ProFont" "ProFontWindows" "Latin Modern Mono" "Code 2002" "ProggyCleanTT" "ProggyTinyTT")
        ;; 中文字体列表，Heiti SC 是 Mac OS X 10.6+ 的默认字体，缺点是没有加粗字体，Mac OS X 10.11+ 使用「苹方-简」作为默认字体
        ("Heiti SC" "微软雅黑" "Apple Color Emoji" "Microsoft Yahei" "Microsoft_Yahei" "文泉驿等宽微米黑" "文泉驿等宽正黑" "黑体" "Hiragino Sans GB" "文泉驿正黑" "文泉驿点阵正黑" "SimHei" "SimSun" "NSimSun" "FangSong" "KaiTi" "FangSong_GB2312" "KaiTi_GB2312" "LiSu" "YouYuan" "新宋体" "宋体" "楷体_GB2312" "仿宋_GB2312" "幼圆" "隶书" "STXihei" "STKaiti" "STSong" "STZhongsong" "STFangsong" "FZShuTi" "FZYaoti" "STCaiyun" "STHupo" "STLiti" "STXingkai" "STXinwei" "方正姚体" "方正舒体" "方正粗圆_GBK" "华文仿宋" "华文中宋" "华文彩云" "华文新魏" "华文细黑" "华文行楷")
        ;; 不常用汉字的字体（需要下载）
        ("HanaMinB")))

;;; `cnfonts--custom-set-fontsizes' 中，所有元素的结构都类似：(英文字号 中文字号 EXT-B字体字号)
;;; 将光标移动到各个数字上，按 C-c C-c 查看光标处字号的对齐效果。
;;; 按 C-<up> 增大光标处字号，按 C-<down> 减小光标处字号。
(setq cnfonts--custom-set-fontsizes
      '(;; Mac OS X 下这个字号 list 算是接近完美的了
        (9    10.5 10.5)
        (10   12.5 12.5)
        (11.5 14.0 14.0)
        (12.0 14.0 14.0) ;; 4, 使用中
        (12.5 14.5 14.5)
        (13   16.0 16.0)
        (14   16.5 16.5)
        (16   20.0 20.0)
        (18   22.0 22.0)))

;; face-font-rescale-alist
