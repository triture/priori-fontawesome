package priori.fontawesome;

import priori.view.component.PriExtendable;

class PriFAIcon extends PriExtendable {

    @:isVar public var iconColor(default, set):Int;
    @:isVar public var iconSize(default, set):Int;
    @:isVar public var icon(default, set):String;

    public function new() {
        super();

        this.iconColor = 0x000000;
        this.iconSize = 20;
        this.clipping = false;
        this.icon = "fa-ship";
    }

    override private function getComponentCode():String {
        // http://fortawesome.github.io/Font-Awesome/examples/
        return "<i class=\"fa\" style=\"vertical-align:super;text-align:center;\"></i>";
    }

    @:noCompletion private function set_iconColor(value:Int) {
        this.iconColor = value;

        if (this._baseElement != null) {
            this._baseElement.css("color", "#" + StringTools.hex(value, 6));
        }

        return value;
    }

    @:noCompletion private function set_iconSize(value:Int) {
        this.iconSize = value;

        if (this._baseElement != null) {
            this._baseElement.css("font-size", value);
        }

        this.width = this.iconSize;
        this.height = this.iconSize;

        return value;
    }


    @:noCompletion private function set_icon(value:String) {
        this.icon = value;

        if (this._baseElement != null) {
            this._baseElement.removeClass();
            this._baseElement.addClass("fa");
            this._baseElement.addClass(value);
        }

        return value;
    }

}
