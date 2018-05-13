package priori.fontawesome;

import js.html.Element;
import priori.event.PriEvent;
import priori.geom.PriColor;
import priori.view.PriDisplay;

class FontAwesomeIcon extends PriDisplay {

    @:isVar public var icon(default, set):FontAwesomeIconType = FontAwesomeIconType.USER;
    @:isVar public var color(default, set):PriColor = 0x000000;
    @:isVar public var size(default, set):Float = 20;

    public function new(?icon:FontAwesomeIconType, ?color:PriColor) {
        super();

        if (icon != null) this.icon = icon;
        if (color != null) this.color = color;

        this.width = this.size;
        this.height = this.size;

        this.addEventListener(PriEvent.ADDED_TO_APP, this.onAddedToApp);
    }

    private function getFontAwesome():Dynamic return untyped __js__("window.FontAwesome");

    private function onAddedToApp(e:PriEvent):Void {
        this.updateIcon();
        this.removeEventListener(PriEvent.ADDED_TO_APP, this.onAddedToApp);
        this.addEventListener(PriEvent.REMOVED_FROM_APP, this.onRemovedFromApp);
    }

    private function onRemovedFromApp(e:PriEvent):Void {
        this.removeEventListener(PriEvent.REMOVED_FROM_APP, this.onRemovedFromApp);
        this.addEventListener(PriEvent.ADDED_TO_APP, this.onAddedToApp);
    }

    private function set_color(value:PriColor):PriColor {

        if (this.color != value && value != null) {
            this.color = value;
            this.dh.jselement.style.color = value.toString();
        }

        return value;
    }

    private function set_size(value:Float):Float {
        this.size = value;

        this.width = value;
        this.height = value;

        return value;
    }

    private function set_icon(value:FontAwesomeIconType):FontAwesomeIconType {
        if (value != this.icon && value != null) {
            this.icon = value;
            this.updateIcon();
        }

        return value;
    }

    private function updateIcon():Void {
        this.dh.jselement.innerHTML = '<span class="${this.icon}"></i>';
        this.getFontAwesome().dom.i2svg(
            {
                node:this.dh.jselement,

                callback:function():Void {

                    var svg:Element = this.dh.jselement.getElementsByTagName("svg").item(0);

                    if (svg != null) {
                        svg.style.width = "100%";
                        svg.style.height = "100%";
                    }
                }
            }
        );
    }
}
