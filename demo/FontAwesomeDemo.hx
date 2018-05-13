package ;

import priori.fontawesome.FontAwesomeIconType;
import priori.fontawesome.FontAwesomeIcon;
import priori.app.PriApp;

class FontAwesomeDemo extends PriApp {

    private var icon:FontAwesomeIcon;


    public function new() {
        super();




    }

    override private function setup():Void {
        this.icon = new FontAwesomeIcon();
        this.icon.icon = FontAwesomeIconType.KEY;
        this.icon.color = 0xff0000;
        this.icon.size = 40;
        this.addChild(this.icon);

        haxe.Timer.delay(
            function():Void {
                this.icon.icon = FontAwesomeIconType.ANGLE_DOWN;
                this.icon.color = 0x000000;
                this.icon.size = 40;
            }, 6000
        );
    }

    override private function paint():Void {

        this.icon.x = 20;
        this.icon.y = 20;

    }


}
