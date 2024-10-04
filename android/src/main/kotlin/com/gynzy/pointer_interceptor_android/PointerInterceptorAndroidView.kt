package com.gynzy.pointer_interceptor_android

import android.content.Context
import android.graphics.Color
import android.view.MotionEvent
import android.view.View
import android.widget.FrameLayout
import io.flutter.plugin.platform.PlatformView

class PointerInterceptorAndroidView(
    context: Context,
    viewId: Int,
    creationParams: Map<String, Any?>?
) : PlatformView {
    private val containerView: FrameLayout

    private val nativeView: View

    init {
        // Initialize the container view
        containerView = FrameLayout(context).apply {
            // Set a transparent background if needed
            setBackgroundColor(Color.TRANSPARENT)
        }

        nativeView = View(context).apply {
            setBackgroundColor(Color.BLUE)
            setOnTouchListener { _, event ->
            // Consume all touch events to prevent them from passing through
                event.action != MotionEvent.ACTION_CANCEL
            }
        }
        containerView.addView(nativeView)
    }

    override fun getView(): View {
        return containerView
    }

    override fun dispose() {
        // Clean up any resources if necessary
    }
}
