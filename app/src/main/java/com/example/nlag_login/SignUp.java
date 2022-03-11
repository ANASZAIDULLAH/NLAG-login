package com.example.nlag_login;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class SignUp extends AppCompatActivity {

    EditText username, password, confirmp;
    Button signup, login;
    DBHelper DB;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_sign_up);

    username = (EditText) findViewById(R.id.username);
    password = (EditText) findViewById(R.id.password);
    confirmp = (EditText) findViewById(R.id.confirmp);
    signup = (Button) findViewById(R.id.sign);
    login = (Button) findViewById(R.id.log);
DB = new DBHelper(this);

    signup.setOnClickListener(new View.OnClickListener() {
        @Override
        public void onClick(View view) {

            String user = username.getText().toString();
            String pass = password.getText().toString();
            String confirm = confirmp.getText().toString();

            if(user.equals("") ||pass.equals("") || confirm.equals(""))
                Toast.makeText(SignUp.this,"Please Enter all the fields", Toast.LENGTH_SHORT).show();
            else {
                if (pass.equals(confirm)){
                    Boolean checkuser = DB.checkusername(user);
                    if(checkuser==false){
                        Boolean insert = DB.insertData(user, pass);
                        if (insert==true){
                            Toast.makeText(SignUp.this,"Registered Successfully",Toast.LENGTH_SHORT).show();
                            Intent intent = new Intent(getApplicationContext(),Main_Menu.class);
                            startActivity(intent);
                        }
                        else {
                            Toast.makeText(SignUp.this, "Registeration Failed", Toast.LENGTH_SHORT).show();
                        }

                    }
                }
            }
        }
    });
 login.setOnClickListener(new View.OnClickListener() {
     @Override
     public void onClick(View view) {
         Intent intent = new Intent(getApplicationContext(), MainActivity.class);
         startActivity(intent);
     }
 });






    }




}