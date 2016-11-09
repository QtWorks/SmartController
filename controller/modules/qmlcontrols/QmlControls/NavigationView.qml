/*
 NavigationView provides views management like UINavigationController in iOS

 Author: Ben Lau (benlau)

 */

import QtQuick 2.2
import "./priv"

Item {
    id : navigationView

    // The tint color to apply to the navigation bar background. It is equivalent to color. It apply the naming convenient of UIKit
    property string tintColor : "#007aff"

    property alias navigationBar : navBar

    /* The first view that should be shown when the NavigationView is created.
       It should be an object. Component and string source is not allowed. It is
       just a convenience for writing Component.onCompleted: push()

       Moreover, don't change the value after created or your have pushed any view already.
     */
    property alias initialView : stack.initialView

    property alias views : stack.views

    property bool navigationBarHidden: false

    function push(source,options) {
        stack.push(source,options);
    }

    function pop() {
        stack.pop();
    }

    function popToRootView() {
        stack.popToRoot();
    }

    NavigationBar {
        id : navBar
        views: stack.views
        tintColor: navigationView.tintColor
        onLeftClicked: stack.pop(true);
        visible: !navigationBarHidden
    }

    NavigationStack {
        id : stack
        anchors.top: navigationBarHidden ? parent.top : navBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        onPushed: {
            // Attach navigationView to a newly created view
            if (view.hasOwnProperty("navigationView"))
                view.navigationView = navigationView;
        }
    }

}
