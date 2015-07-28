(function () {

    (function () {
        UE = window.UE || {};
        var isIE = !!window.ActiveXObject;
        //定义utils工具
        var utils = {
            removeLastbs: function (url) {
                return url.replace(/\/$/, '')
            },
            extend: function (t, s) {
                var a = arguments,
                    notCover = this.isBoolean(a[a.length - 1]) ? a[a.length - 1] : false,
                    len = this.isBoolean(a[a.length - 1]) ? a.length - 1 : a.length;
                for (var i = 1; i < len; i++) {
                    var x = a[i];
                    for (var k in x) {
                        if (!notCover || !t.hasOwnProperty(k)) {
                            t[k] = x[k];
                        }
                    }
                }
                return t;
            },
            isIE: isIE,
            cssRule: isIE ? function (key, style, doc) {
                var indexList, index;
                doc = doc || document;
                if (doc.indexList) {
                    indexList = doc.indexList;
                } else {
                    indexList = doc.indexList = {};
                }
                var sheetStyle;
                if (!indexList[key]) {
                    if (style === undefined) {
                        return ''
                    }
                    sheetStyle = doc.createStyleSheet('', index = doc.styleSheets.length);
                    indexList[key] = index;
                } else {
                    sheetStyle = doc.styleSheets[indexList[key]];
                }
                if (style === undefined) {
                    return sheetStyle.cssText
                }
                sheetStyle.cssText = sheetStyle.cssText + '\n' + (style || '')
            } : function (key, style, doc) {
                doc = doc || document;
                var head = doc.getElementsByTagName('head')[0], node;
                if (!(node = doc.getElementById(key))) {
                    if (style === undefined) {
                        return ''
                    }
                    node = doc.createElement('style');
                    node.id = key;
                    head.appendChild(node)
                }
                if (style === undefined) {
                    return node.innerHTML
                }
                if (style !== '') {
                    node.innerHTML = node.innerHTML + '\n' + style;
                } else {
                    head.removeChild(node)
                }
            },
            domReady: function (onready) {
                var doc = window.document;
                if (doc.readyState === "complete") {
                    onready();
                } else {
                    if (isIE) {
                        (function () {
                            if (doc.isReady) return;
                            try {
                                doc.documentElement.doScroll("left");
                            } catch (error) {
                                setTimeout(arguments.callee, 0);
                                return;
                            }
                            onready();
                        })();
                        window.attachEvent('onload', function () {
                            onready()
                        });
                    } else {
                        doc.addEventListener("DOMContentLoaded", function () {
                            doc.removeEventListener("DOMContentLoaded", arguments.callee, false);
                            onready();
                        }, false);
                        window.addEventListener('load', function () {
                            onready()
                        }, false);
                    }
                }

            },
            each: function (obj, iterator, context) {
                if (obj == null) return;
                if (obj.length === +obj.length) {
                    for (var i = 0, l = obj.length; i < l; i++) {
                        if (iterator.call(context, obj[i], i, obj) === false)
                            return false;
                    }
                } else {
                    for (var key in obj) {
                        if (obj.hasOwnProperty(key)) {
                            if (iterator.call(context, obj[key], key, obj) === false)
                                return false;
                        }
                    }
                }
            },
            inArray: function (arr, item) {
                var index = -1;
                this.each(arr, function (v, i) {
                    if (v === item) {
                        index = i;
                        return false;
                    }
                });
                return index;
            },
            pushItem: function (arr, item) {
                if (this.inArray(arr, item) == -1) {
                    arr.push(item)
                }
            },
            trim: function (str) {
                return str.replace(/(^[ \t\n\r]+)|([ \t\n\r]+$)/g, '');
            },
            indexOf: function (array, item, start) {
                var index = -1;
                start = this.isNumber(start) ? start : 0;
                this.each(array, function (v, i) {
                    if (i >= start && v === item) {
                        index = i;
                        return false;
                    }
                });
                return index;
            },
            hasClass: function (element, className) {
                className = className.replace(/(^[ ]+)|([ ]+$)/g, '').replace(/[ ]{2,}/g, ' ').split(' ');
                for (var i = 0, ci, cls = element.className; ci = className[i++];) {
                    if (!new RegExp('\\b' + ci + '\\b', 'i').test(cls)) {
                        return false;
                    }
                }
                return i - 1 == className.length;
            },
            addClass: function (elm, classNames) {
                if (!elm)return;
                classNames = this.trim(classNames).replace(/[ ]{2,}/g, ' ').split(' ');
                for (var i = 0, ci, cls = elm.className; ci = classNames[i++];) {
                    if (!new RegExp('\\b' + ci + '\\b').test(cls)) {
                        cls += ' ' + ci;
                    }
                }
                elm.className = utils.trim(cls);
            },
            removeClass: function (elm, classNames) {
                classNames = this.isArray(classNames) ? classNames :
                    this.trim(classNames).replace(/[ ]{2,}/g, ' ').split(' ');
                for (var i = 0, ci, cls = elm.className; ci = classNames[i++];) {
                    cls = cls.replace(new RegExp('\\b' + ci + '\\b'), '')
                }
                cls = this.trim(cls).replace(/[ ]{2,}/g, ' ');
                elm.className = cls;
                !cls && elm.removeAttribute('className');
            },
            on: function (element, type, handler) {
                var types = this.isArray(type) ? type : type.split(/\s+/),
                    k = types.length;
                if (k) while (k--) {
                    type = types[k];
                    if (element.addEventListener) {
                        element.addEventListener(type, handler, false);
                    } else {
                        if (!handler._d) {
                            handler._d = {
                                els: []
                            };
                        }
                        var key = type + handler.toString(), index = utils.indexOf(handler._d.els, element);
                        if (!handler._d[key] || index == -1) {
                            if (index == -1) {
                                handler._d.els.push(element);
                            }
                            if (!handler._d[key]) {
                                handler._d[key] = function (evt) {
                                    return handler.call(evt.srcElement, evt || window.event);
                                };
                            }


                            element.attachEvent('on' + type, handler._d[key]);
                        }
                    }
                }
                element = null;
            },
            off: function (element, type, handler) {
                var types = this.isArray(type) ? type : type.split(/\s+/),
                    k = types.length;
                if (k) while (k--) {
                    type = types[k];
                    if (element.removeEventListener) {
                        element.removeEventListener(type, handler, false);
                    } else {
                        var key = type + handler.toString();
                        try {
                            element.detachEvent('on' + type, handler._d ? handler._d[key] : handler);
                        } catch (e) {
                        }
                        if (handler._d && handler._d[key]) {
                            var index = utils.indexOf(handler._d.els, element);
                            if (index != -1) {
                                handler._d.els.splice(index, 1);
                            }
                            handler._d.els.length == 0 && delete handler._d[key];
                        }
                    }
                }
            },
            loadFile: function () {
                var tmpList = [];

                function getItem(doc, obj) {
                    try {
                        for (var i = 0, ci; ci = tmpList[i++];) {
                            if (ci.doc === doc && ci.url == (obj.src || obj.href)) {
                                return ci;
                            }
                        }
                    } catch (e) {
                        return null;
                    }

                }

                return function (doc, obj, fn) {
                    var item = getItem(doc, obj);
                    if (item) {
                        if (item.ready) {
                            fn && fn();
                        } else {
                            item.funs.push(fn)
                        }
                        return;
                    }
                    tmpList.push({
                        doc: doc,
                        url: obj.src || obj.href,
                        funs: [fn]
                    });
                    if (!doc.body) {
                        var html = [];
                        for (var p in obj) {
                            if (p == 'tag')continue;
                            html.push(p + '="' + obj[p] + '"')
                        }
                        doc.write('<' + obj.tag + ' ' + html.join(' ') + ' ></' + obj.tag + '>');
                        return;
                    }
                    if (obj.id && doc.getElementById(obj.id)) {
                        return;
                    }
                    var element = doc.createElement(obj.tag);
                    delete obj.tag;
                    for (var p in obj) {
                        element.setAttribute(p, obj[p]);
                    }
                    element.onload = element.onreadystatechange = function () {
                        if (!this.readyState || /loaded|complete/.test(this.readyState)) {
                            item = getItem(doc, obj);
                            if (item.funs.length > 0) {
                                item.ready = 1;
                                for (var fi; fi = item.funs.pop();) {
                                    fi();
                                }
                            }
                            element.onload = element.onreadystatechange = null;
                        }
                    };
                    element.onerror = function () {
                        throw Error('The load ' + (obj.href || obj.src) + ' fails,check the url')
                    };
                    doc.getElementsByTagName("head")[0].appendChild(element);
                }
            }()
        };
        utils.each(['String', 'Function', 'Array', 'Number', 'RegExp', 'Object', 'Boolean'], function (v) {
            utils['is' + v] = function (obj) {
                return Object.prototype.toString.apply(obj) == '[object ' + v + ']';
            }
        });
        var parselist = {};
        UE.parse = {
            register: function (parseName, fn) {
                parselist[parseName] = fn;
            },
            load: function (opt) {
                utils.each(parselist, function (v) {
                    v.call(opt, utils);
                })
            }
        };
        uParse = function (selector, opt) {
            utils.domReady(function () {
                var contents;
                if (document.querySelectorAll) {
                    contents = document.querySelectorAll(selector)
                } else {
                    if (/^#/.test(selector)) {
                        contents = [document.getElementById(selector.replace(/^#/, ''))]
                    } else if (/^\./.test(selector)) {
                        var contents = [];
                        utils.each(document.getElementsByTagName('*'), function (node) {
                            if (node.className && new RegExp('\\b' + selector.replace(/^\./, '') + '\\b', 'i').test(node.className)) {
                                contents.push(node)
                            }
                        })
                    } else {
                        contents = document.getElementsByTagName(selector)
                    }
                }
                utils.each(contents, function (v) {
                    UE.parse.load(utils.extend({root: v, selector: selector}, opt))
                })
            })
        }
    })();

    UE.parse.register('vedio', function (utils) {
        var video = this.root.getElementsByTagName('video'),
            audio = this.root.getElementsByTagName('audio');

        document.createElement('video');
        document.createElement('audio');
        if (video.length || audio.length) {
            var sourcePath = utils.removeLastbs(this.rootPath),
                jsurl = sourcePath + '/third-party/video-js/video.js',
                cssurl = sourcePath + '/third-party/video-js/video-js.min.css',
                swfUrl = sourcePath + '/third-party/video-js/video-js.swf';

            utils.loadFile(document, {
                id: "video_css",
                tag: "link",
                rel: "stylesheet",
                type: "text/css",
                href: cssurl
            });
            utils.loadFile(document, {
                id: "video_js",
                src: jsurl,
                tag: "script",
                type: "text/javascript"
            }, function () {
                videojs.options.flash.swf = swfUrl;
            });

        }
    });
    UE.parse.register('table', function (utils) {
        var me = this,
            root = this.root,
            tables = root.getElementsByTagName('table');
        if (tables.length) {
            var selector = this.selector;
            //追加默认的表格样式
            utils.cssRule('table',
                selector + ' table.noBorderTable td,' +
                selector + ' table.noBorderTable th,' +
                selector + ' table.noBorderTable caption{border:1px dashed #ddd !important}' +
                selector + ' table.sortEnabled tr.firstRow th,' + selector + ' table.sortEnabled tr.firstRow td{padding-right:20px; background-repeat: no-repeat;' +
                'background-position: center right; background-image:url(' + this.rootPath + 'themes/default/images/sortable.png);}' +
                selector + ' table.sortEnabled tr.firstRow th:hover,' + selector + ' table.sortEnabled tr.firstRow td:hover{background-color: #EEE;}' +
                selector + ' table{margin-bottom:10px;border-collapse:collapse;display:table;}' +
                selector + ' td,' + selector + ' th{ background:white; padding: 5px 10px;border: 1px solid #DDD;}' +
                selector + ' caption{border:1px dashed #DDD;border-bottom:0;padding:3px;text-align:center;}' +
                selector + ' th{border-top:1px solid #BBB;background:#F7F7F7;}' +
                selector + ' table tr.firstRow th{border-top:2px solid #BBB;background:#F7F7F7;}' +
                selector + ' tr.ue-table-interlace-color-single td{ background: #fcfcfc; }' +
                selector + ' tr.ue-table-interlace-color-double td{ background: #f7faff; }' +
                selector + ' td p{margin:0;padding:0;}',
                document);
            //填充空的单元格

            utils.each('td th caption'.split(' '), function (tag) {
                var cells = root.getElementsByTagName(tag);
                cells.length && utils.each(cells, function (node) {
                    if (!node.firstChild) {
                        node.innerHTML = '&nbsp;';

                    }
                })
            });

            //表格可排序
            var tables = root.getElementsByTagName('table');
            utils.each(tables, function (table) {
                if (/\bsortEnabled\b/.test(table.className)) {
                    utils.on(table, 'click', function (e) {
                        var target = e.target || e.srcElement,
                            cell = findParentByTagName(target, ['td', 'th']);
                        var table = findParentByTagName(target, 'table'),
                            colIndex = utils.indexOf(table.rows[0].cells, cell),
                            sortType = table.getAttribute('data-sort-type');
                        if (colIndex != -1) {
                            sortTable(table, colIndex, me.tableSortCompareFn || sortType);
                            updateTable(table);
                        }
                    });
                }
            });

            //按照标签名查找父节点
            function findParentByTagName(target, tagNames) {
                var i, current = target;
                tagNames = utils.isArray(tagNames) ? tagNames : [tagNames];
                while (current) {
                    for (i = 0; i < tagNames.length; i++) {
                        if (current.tagName == tagNames[i].toUpperCase()) return current;
                    }
                    current = current.parentNode;
                }
                return null;
            }

            //表格排序
            function sortTable(table, sortByCellIndex, compareFn) {
                var rows = table.rows,
                    trArray = [],
                    flag = rows[0].cells[0].tagName === "TH",
                    lastRowIndex = 0;

                for (var i = 0, len = rows.length; i < len; i++) {
                    trArray[i] = rows[i];
                }

                var Fn = {
                    'reversecurrent': function (td1, td2) {
                        return 1;
                    },
                    'orderbyasc': function (td1, td2) {
                        var value1 = td1.innerText || td1.textContent,
                            value2 = td2.innerText || td2.textContent;
                        return value1.localeCompare(value2);
                    },
                    'reversebyasc': function (td1, td2) {
                        var value1 = td1.innerHTML,
                            value2 = td2.innerHTML;
                        return value2.localeCompare(value1);
                    },
                    'orderbynum': function (td1, td2) {
                        var value1 = td1[utils.isIE ? 'innerText' : 'textContent'].match(/\d+/),
                            value2 = td2[utils.isIE ? 'innerText' : 'textContent'].match(/\d+/);
                        if (value1) value1 = +value1[0];
                        if (value2) value2 = +value2[0];
                        return (value1 || 0) - (value2 || 0);
                    },
                    'reversebynum': function (td1, td2) {
                        var value1 = td1[utils.isIE ? 'innerText' : 'textContent'].match(/\d+/),
                            value2 = td2[utils.isIE ? 'innerText' : 'textContent'].match(/\d+/);
                        if (value1) value1 = +value1[0];
                        if (value2) value2 = +value2[0];
                        return (value2 || 0) - (value1 || 0);
                    }
                };

                //对表格设置排序的标记data-sort-type
                table.setAttribute('data-sort-type', compareFn && typeof compareFn === "string" && Fn[compareFn] ? compareFn : '');

                //th不参与排序
                flag && trArray.splice(0, 1);
                trArray = sort(trArray, function (tr1, tr2) {
                    var result;
                    if (compareFn && typeof compareFn === "function") {
                        result = compareFn.call(this, tr1.cells[sortByCellIndex], tr2.cells[sortByCellIndex]);
                    } else if (compareFn && typeof compareFn === "number") {
                        result = 1;
                    } else if (compareFn && typeof compareFn === "string" && Fn[compareFn]) {
                        result = Fn[compareFn].call(this, tr1.cells[sortByCellIndex], tr2.cells[sortByCellIndex]);
                    } else {
                        result = Fn['orderbyasc'].call(this, tr1.cells[sortByCellIndex], tr2.cells[sortByCellIndex]);
                    }
                    return result;
                });
                var fragment = table.ownerDocument.createDocumentFragment();
                for (var j = 0, len = trArray.length; j < len; j++) {
                    fragment.appendChild(trArray[j]);
                }
                var tbody = table.getElementsByTagName("tbody")[0];
                if (!lastRowIndex) {
                    tbody.appendChild(fragment);
                } else {
                    tbody.insertBefore(fragment, rows[lastRowIndex - range.endRowIndex + range.beginRowIndex - 1])
                }
            }

            //冒泡排序
            function sort(array, compareFn) {
                compareFn = compareFn || function (item1, item2) {
                        return item1.localeCompare(item2);
                    };
                for (var i = 0, len = array.length; i < len; i++) {
                    for (var j = i, length = array.length; j < length; j++) {
                        if (compareFn(array[i], array[j]) > 0) {
                            var t = array[i];
                            array[i] = array[j];
                            array[j] = t;
                        }
                    }
                }
                return array;
            }

            //更新表格
            function updateTable(table) {
                //给第一行设置firstRow的样式名称,在排序图标的样式上使用到
                if (!utils.hasClass(table.rows[0], "firstRow")) {
                    for (var i = 1; i < table.rows.length; i++) {
                        utils.removeClass(table.rows[i], "firstRow");
                    }
                    utils.addClass(table.rows[0], "firstRow");
                }
            }
        }
    });


})();