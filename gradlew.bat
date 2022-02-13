/*
 * Copyright (C) 2014 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package androidx.core.graphics.drawable;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.util.DisplayMetrics;
import android.view.Gravity;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

/**
 * A Drawable that wraps a bitmap and can be drawn with rounded corners. You can create a
 * RoundedBitmapDrawable from a file path, an input stream, or from a
 * {@link android.graphics.Bitmap} object.
 * <p>
 * Also see the {@link android.graphics.Bitmap} class, which handles the management and
 * transformation of raw bitmap graphics, and should be used when drawing to a
 * {@link android.graphics.Canvas}.
 * </p>
 */
public abstract class RoundedBitmapDrawable extends Drawable {
    private static final int DEFAULT_PAINT_FLAGS =
            Paint.FILTER_BITMAP_FLAG | Paint.ANTI_ALIAS_FLAG;
    final Bitmap mBitmap;
    private int mTargetDensity = DisplayMetrics.DENSITY_DEFAULT;
    private int mGravity = Gravity.FILL;
    private final Paint mPaint = new Paint(DEFAULT_PAINT_FLAGS);
    private final BitmapShader mBitmapShader;
    private final Matrix mShaderMatrix = new Matrix();
    private float mCornerRadius;

    final Rect mDstRect = new Rect();   // Gravity.apply() sets this
    private final RectF mDstRectF = new RectF();

    private boolean mApplyGravity = true;
    private boolean mIsCircular;

    // These are scaled to match the target density.
    private int mBitmapWidth;
    private int mBitmapHeight;

    /**
     * Returns the paint used to render this drawable.
     */
    @NonNull
    public final Paint getPaint() {
        return mPaint;
    }

    /**
     * Returns the bitmap used by this drawable to render. May be null.
     */
    @Nullable
    public final Bitmap getBitmap() {
        ret