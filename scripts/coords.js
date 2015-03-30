var Castanaut = Castanaut || {};

Castanaut.Coords = Castanaut.Coords || {
  documentPos: function (obj) {
    var rect = obj.getBoundingClientRect(),
        doc = document.documentElement,
        top = Math.round(rect.top + window.pageYOffset - doc.clientTop),
        left = Math.round(rect.left + window.pageXOffset - doc.clientLeft);

    return [left, top, obj.offsetWidth, obj.offsetHeight];
  },

  windowPos: function (obj) {
    var pos = Castanaut.Coords.documentPos(obj);
    pos[0] -= window.scrollX;
    pos[1] -= window.scrollY;

    if (pos[0] > window.innerWidth || pos[0] < 0) {
      pos[0] = -1;
    }
    if (pos[1] > window.innerHeight || pos[1] < 0) {
      pos[1] = -1;
    }
    return pos;
  },

  forElement: function (selector, index) {
    var obj = Castanaut.DomQuery.select(selector)[index];
    var pos = Castanaut.Coords.windowPos(obj);
    // if (pos[0] < 0 || pos[1] < 0) {
    //   obj.scrollIntoView();
    //   pos = Castanaut.Coords.windowPos(obj);
    //   if (pos[0] < 0 || pos[1] < 0) {
    //     return pos.join(' ');
    //   }
    // }

    pos[0] += window.screenX + (window.outerWidth - window.innerWidth);

    pos[1] += window.screenY + (window.outerHeight - window.innerHeight);
    if (window.statusbar.visible) {
      pos[1] -= 14;
    }
    return pos.join(' ');
  }
}
