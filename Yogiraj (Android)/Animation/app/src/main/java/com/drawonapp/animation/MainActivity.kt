package com.drawonapp.animation

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import com.drawonapp.animation.customview.FillAnimation
import kotlinx.coroutines.delay
import kotlinx.coroutines.runBlocking

class MainActivity : AppCompatActivity() {

    private lateinit var fillAnimation1: FillAnimation

    private lateinit var fillAnimation2: FillAnimation

    private lateinit var fillAnimation3: FillAnimation

    private lateinit var fillAnimation4: FillAnimation

    private lateinit var fillAnimation5: FillAnimation

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        fillAnimation1 = findViewById(R.id.fill_animation1)

        fillAnimation2 = findViewById(R.id.fill_animation2)

        fillAnimation3 = findViewById(R.id.fill_animation3)

        fillAnimation4 = findViewById(R.id.fill_animation4)

        fillAnimation5 = findViewById(R.id.fill_animation5)


        fillAnimation1.show_animation(showAnimation = true)

        fillAnimation2.show_animation(showAnimation = true)

        fillAnimation3.show_animation(showAnimation = true)

        fillAnimation4.show_animation(showAnimation = true)

        fillAnimation5.show_animation(showAnimation = true)
    }
}