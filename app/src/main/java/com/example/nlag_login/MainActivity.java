package com.example.nlag_login;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void openSignUp(View view) {
        startActivity(new Intent(this,SignUp.class));
    }

    public void openMain_Menu(View view) {
        startActivity(new Intent(this, Main_Menu.class));
    }
}