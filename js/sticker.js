var STICKIES = (function () {
    var openStickies = function openStickies() {

            let ajax_arr = new Array();

            $.ajax({
                url: '/admin/index.cgi?get_index=notepad_show_sticker&header=2&ajax=1&get_stickers=1',
                success: function(result){
                    if(result) {
                        ajax_arr = JSON.parse(result);
                        for (let i=0; i<ajax_arr.length; i++){
                            console.log(ajax_arr[i]);
                            createSticky(ajax_arr[i]);
                        }
                    }
                }
            });
        },
        searchKey = function searchKey(array) {
            let sticky_array = new Array();
            for (let i=0; i<array.length; i++){
                if (array[i].match("sticky-")) sticky_array.push(array[i]) ;
            }
            for (let i=0; i<sticky_array.length; i++) return sticky_array;
            return -1;
        },
        createSticky = function createSticky(data) {
            console.log("CreateSticky");
            data = data || { id : data.id, top : "40px", left : "40px"   };
            let arr = new Array();
            let temp_arr = new Array();
            for (let i = 0; i < localStorage.length; i++) {
                arr.push(localStorage.key(i));
            }
            temp_arr = searchKey(arr);

            data.id = "sticky-"+data.id;
            console.log(data.id);
            for (let i=0; i<temp_arr.length; i++){
                if (data.id==temp_arr[i]){
                    let temp = JSON.parse(localStorage.getItem(data.id));
                    console.log(temp);
                    data.top = temp.top;
                    data.left = temp.left;
                }
            }
            console.log(data);
            return $("<div />", {
                "class" : "sticky",
                'id' : data.id
            })
                .prepend($("<div />", { "class" : "sticky-header"} )
                    .append($("<span />", {
                        "class" : "sticky-status",
                        click : saveSticky
                    }))
                    .append($("<span />", {
                        html : data.subject.substr(0,100),
                        "class" : "title",
                        keypress : markUnsaved
                    }))
                )
                .append($("<div />", {
                    html : data.text.substr(0,280),
                    "class" : "sticky-content",
                    keypress : markUnsaved
                })
                    .append($("<a />",{
                        html: "...",
                        href: '/admin/index.cgi?index=247&chg='+data.id.slice(7)+'&MODULE=Notepad'
                    })))
                .draggable({
                    handle : "div.sticky-header",
                    stack : ".sticky",
                    start : markUnsaved,
                    stop  : saveSticky
                })
                .css({
                    position: "absolute",
                    "top" : data.top,
                    "left": data.left
                })
                .focusout(saveSticky)
                .resizable({
                    maxHeight: 260,
                    maxWidth: 245,
                    minHeight: 170,
                    minWidth: 240
                })
                .appendTo(document.body);
        },
        saveSticky = function saveSticky() {
            console.log("SaveSticky");
            let that = $(this), sticky = (that.hasClass("sticky-status") || that.hasClass("sticky-content")) ? that.parents('div.sticky'): that,
                obj = {
                    id: sticky.attr("id"),
                    top: sticky.css("top"),
                    left: sticky.css("left")
            };
            localStorage.setItem(obj.id, JSON.stringify(obj));
            sticky.find(".sticky-status").text("Saved");
        },
        markUnsaved = function markUnsaved() {
            var that = $(this), sticky = that.hasClass("sticky-content") ? that.parents("div.sticky") : that;
            sticky.find(".sticky-status").text("Unsaved");
        };
    return {
        open   : openStickies,
        "new"  : createSticky
    };

}());