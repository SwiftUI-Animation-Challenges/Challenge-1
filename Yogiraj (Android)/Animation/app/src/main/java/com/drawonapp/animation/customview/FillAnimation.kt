package com.drawonapp.animation.customview
import android.content.Context
import android.graphics.*
import android.util.AttributeSet
import android.view.View
import com.drawonapp.animation.Colors
import com.drawonapp.animation.R
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.delay
import kotlinx.coroutines.launch
import java.util.*


open class FillAnimation(context: Context, attrs: AttributeSet? = null) : View(context,attrs) {

    private val paint = Paint(Paint.ANTI_ALIAS_FLAG)

    var count : Float = 1.1F

    var inc_constant : Float = 0.9F

    var dec_const : Float = 0.9F

    var base_const : Float = count

    var state : Colors = Colors.FILL

    private var showAnimation : Boolean? = false;

    init {
        paint.apply {
            this.color = resources.getColor(R.color.green)
            this.style = Paint.Style.FILL
        }
    }



    override fun onDraw(canvas: Canvas?) {
        super.onDraw(canvas)


        if (showAnimation == true) {


            when (state) {

                Colors.EMPTY ->{
                    count = count - dec_const
                }
                Colors.FILL -> {
                    count = count + inc_constant
                }

            }

            GlobalScope.launch(Dispatchers.Main) {
                delay(400)
                if (count >= 8F) {
                    state = Colors.EMPTY
                } else if (count <= base_const) {
                    state = Colors.FILL
                }
                invalidate()
            }

            drawRectangle(canvas)
        }

    }

    private fun drawRectangle(canvas: Canvas?) {


            println("Count $count")

            canvas?.drawRect(
                0F,
                (height / (count)),
                (width).toFloat(),
                (height).toFloat(),
                paint
            )


    }

    fun show_animation(showAnimation : Boolean){
        if (showAnimation){
            var r = Random()

            var a = (r.nextInt(9)+1).toFloat()/10

            inc_constant = a
            dec_const = a

            count = 2-a
            base_const = count

            println("$a")

            this.showAnimation = true
            invalidate()
        }

    }


}