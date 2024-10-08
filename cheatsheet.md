# Kickstart Neovim cheatsheet

## movement
| shortcut | description |
|----------|-------------|
| h | move cursor left |
| j | move cursor down |
| k | move cursor up |
| l | move cursor right |
| gg | move to start of the file |
| G | move to the end of the file |
| 2G | move to he line number 2 |
| Ctrl + G | display you current location in filesystem and file |
| Ctrl + w | open panels/windows menu |
| Ctrl + h | move focus to right panel/window |
| Ctrl + j | move focus to he panel/window below |
| Ctrl + k | move focus to the panel/window above |
| Ctrl + l | move focus to left panel/window |

## motion
| shortcut | description |
|----------|-------------|
| w | until the start of next word |
| e | to the of the current word |
| $ | to the end of the current line |
| 0 | to the start of the line |

>- ```de``` will delete from cursor to the end of the current word
>- ```2w``` move cursor 2 words forward
>- ```3e``` move cursor to the end of the third word from cursor
>- ```d2w``` delete from the cursor to the end of the second word from the cursor |
>- ```2dd``` delete two lines

## file actions
| shortcut | description |
|----------|-------------|
| :q! | close without save |
| :wq | close and save the changes |UPDATE assetDependencyTree adt
SET dependenciesFull = (
  SELECT CONCAT('[', GROUP_CONCAT(
    JSON_OBJECT(
      'id', a.id,
      'version', NULL
    )
  ), ']')
  FROM assets a
  WHERE JSON_CONTAINS(adt.dependencies, JSON_QUOTE(a.id), '$')
)
WHERE JSON_LENGTH(adt.dependencies) > 0;
UPDATE assetDependencyTree adt
SET dependenciesFull = (
  SELECT CONCAT('[', GROUP_CONCAT(
    JSON_OBJECT(
      'id', a.id,
      'version', NULL
    )
  ), ']')
  FROM assets a
  WHERE JSON_CONTAINS(adt.dependencies, JSON_QUOTE(a.id), '$')
)
WHERE JSON_LENGTH(adt.dependencies) > 0;

| :w $FILENAME | write current content into the file |
| :!rm $FILENAME | remove file by the name |
| :!ls | list you directory files |
| :r $FILENAME | retrieve content of the selected file |

## actions
| shortcut | description |
|----------|-------------|
| a | insert after cursor |
| i | insert before cursor |
| dw | delete from cursor to end of the word |
| d$ | delete from cursor to the end of the line |
| dd | delete line |
| x | remove char under cursor |
| u | undo change |
| U | undo all changes on the line |
| r | replace char under cursor |
| ce | replace to the end of the current word |
| / | type / followed by phrase to search FORWARD |
| ? | tyoe ? followed by phrase to search BACKWARDS |
| n | when searching press n to go to next search result in the selected direction |
| N | when searching press N to change direction the next result is found|
| % | when cursor is on any bracker, press % to highlight matching closing bracket |
| :s/old_word/new_word/ | replace the old word on the line with new_word |
| :%s/old_word/new_word/gc | replace all occurences of old_word in the whole file |
| :'<,'>s/old_word/new_word/ | replace all occurences of old word in the selected text |
| :10,20s/old_word/new_word/ | replace all occurences of old_word in lines 10-20 |
| :! | use :! to run any external bash command |
| :w FILE_ANAME | save changes into file |
| :!rm FILE_NAME | remove file by name |
| v | start selecting the lines |
| v]M | select whole statement |

## plugins
### search
| shortcut | description |
|----------|-------------|
| space + s + g | telescope - start search mode |
| Ctrl + n | telescope - go to next search result |
| Ctrl + p | telescope - go to previsou search result |

### treesitter
| shortcut | description |
|----------|-------------|
| gd | [G]o to [D]efinition |
| gr | [G]o to [R]eference |
| gI | [G]o to [I]mplementation |
| ctrl + D | ? |

### comments
| shortcut | description |
|----------|-------------|
| gcc | inline comment |
| gcb | block comment |
| Space + l + t | list TODO: comments |
| Space + l + b | list BUG: comments |
| Space + l + f | list FIXIT: comments |
| Space + l + o | list OPTIMIZE: / PERFORMANCE: comments |
| Space + l + i | list INFO: / HINT: comments |
| Space + l + w | list WARNING: comments |
| Space + l + s | list TESTING: / FAILED: / PASSED: comments |

### mason
| shortcut | description |
|----------|-------------|
| Ctrl + y | accept autocomplete suggestion |

### neo-tree
| shortcut | description |
|----------|-------------|
| Ctrl + n | toggle neo-tree vissibility |

### diagnostics
| shortcut | description |
|----------|-------------|
| [d | go to previous diagnostic message |
| ]d | go to next diagnostic message |
| space + e | show diagnostic Error messages |
| space + q | show diagnostic Quickfix list |

### search options
| options | description |
|---------|-------------|
| :set ic | set search to ignore casing |
| :set is | set search to show partial matches |
| :set hls | heightlight all matching phrases |
*use prefix no to disable the option, example :set noic
