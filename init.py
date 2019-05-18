from flask import Flask, flash, redirect, render_template, request, session, abort,json
import os
import mysql.connector

con=mysql.connector.connect(user='arindam',password='arindam2',database='hospital',host='localhost')
cursor=con.cursor()

def sql(a):
    cursor.execute(a)
    row=cursor.fetchall()
    return row
 
app = Flask(__name__)

@app.route('/')
def home():
		return render_template('home.html')

@app.route('/login')
def login():
		return render_template('login.html')

@app.route('/check_login', methods=['GET','POST'])
def check_login():
    psw=request.form['password']
    uname=request.form['username']
    a=sql("select * from employes where Username = '{}' and Password ='{}'".format(uname,psw))
    try:
        if (((psw == '123456789') and (uname=='admin')) or ((uname==str(a[0][5]) and psw==str(a[0][6])))):
            session['username']=uname.upper()
            session['logged_in'] = True
            return render_template('home.html')
        else:
            return render_template('login.html',msg="wrong password") 
    except IndexError:
        return render_template('login.html',msg="wrong password")

@app.route("/logout", methods=['GET','POST'])
def logout():
    session['logged_in'] = False
    return render_template('home.html')


@app.route('/medicine')
def medicine():
		return render_template('medicine.html')


@app.route('/patient')
def patient():
		return render_template('patient.html')

@app.route('/doctor')
def doctor():
		return render_template('doctor.html')

@app.route('/staff')
def staff():
		return render_template('staff.html')

@app.route('/profile')
def profile():
		return render_template('profile.html')

###########################################################
# information 
###########################################################
@app.route('/staff_info',methods=["POST" , "GET"])
def staff_info():
    if request.method == "POST":
        if(session['username'] == 'ADMIN'):
            b = request.form['damdam']
            a = sql("SELECT E_ID ,E_NAME , Username from employes where E_Name like '%{}%' ".format(b))
            return json.dumps({'data':a})
        else :
            b = request.form['damdam']
            a = sql("SELECT E_ID , E_NAME , Username from employes where ((E_ID like 'R%') or (E_ID like 'S%')) and E_Name like '%{}%' ".format(str(b)))
            return json.dumps({'data':a})

@app.route('/med_info',methods=["POST" , "GET"])
def med_info():
    if request.method == "POST":
        if(session['username'] == 'ADMIN'):
            b = request.form['damdam']
            a = sql("SELECT * from medicine where Med_Name like '%{}%' ".format(b))
            return json.dumps({'data':a})
        else :
            b = request.form['damdam']
            a = sql("SELECT * from medicine where Med_Name like '%{}%' ".format(b))
            return json.dumps({'data':a})


@app.route('/doc_info',methods=["POST" , "GET"])
def doc_info():
    if request.method == "POST":
        if(session['username'] == 'ADMIN'):
            b = request.form['damdam']
            if(b.isalpha()==True):
                a = sql("SELECT distinct d.E_ID , d.D_ID , d.Specialization , e.E_Name , e.Age , e.Contact , e.Salary from doctor as d , employes as e where (e.E_ID=d.E_ID) and e.E_Name like '%{}%' ".format(b))
            else:
                a = sql("SELECT distinct d.E_ID , d.D_ID , d.Specialization , e.E_Name , e.Age , e.Contact , e.Salary from doctor as d , employes as e where (e.E_ID=d.E_ID) and e.E_ID like '%{}%' ".format(b))
            return json.dumps({'data':a})
        else :
            b = request.form['damdam']
            if(b.isalpha()==True):
                a = sql("SELECT d.E_ID , d.D_ID , d.Specialization , e.E_Name , e.Age , e.Contact from doctor as d , employes as e where (e.E_ID=d.E_ID) and e.E_Name like '%{}%' ".format(b))
            else:
                a = sql("SELECT d.E_ID , d.D_ID , d.Specialization , e.E_Name , e.Age , e.Contact from doctor as d , employes as e where (e.E_ID=d.E_ID) and e.E_ID like '%{}%' ".format(b))
            return json.dumps({'data':a})


@app.route('/pat_info',methods=["POST" , "GET"])
def pat_info():
    if request.method == "POST":
        if(session['username'] == 'ADMIN'):
            b = request.form['damdam']
            if(b.isalpha()==True):
                a = sql("SELECT * from patient where P_Name like '%{}%' ".format(b))
            else:
                a = sql("SELECT * from patient where P_ID like '%{}%' ".format(b))
            return json.dumps({'data':a})
        else :
            b = request.form['damdam']
            if(b.isalpha()==True):
                a = sql("SELECT * from patient where P_Name like '%{}%' ".format(b))
            else:
                a = sql("SELECT * from patient where P_ID like '%{}%' ".format(b))
            return json.dumps({'data':a})

'''
@app.route('/prof_info',methods=["POST" , "GET"])
def prof_info():
    if request.method == "POST":
        if(session['username'] == 'ADMIN'):




@app.route('/prof_info' , methods = ["POST" , "GET"])
def prof_info():
    if request.method == "POST":
        b = sql("select distinct P_Name from ipd,opd,patient,employes,doctor where opd.P_ID=patient.P_ID or ipd.P_ID=patient.P_ID and employes.E_ID like '%doctor.E_ID%' and employes.E_Name like '%John%';" )
        return json.dumps({'data':b}) 

this is a new change            
'''


#########################################################################################
#New
#########################################################################################


@app.route('/doc_edit',methods=["POST" , "GET"])
def doc_edit():
    if request.method == "POST":
        eid=request.form['eid']
        did=request.form['did']
        spec=request.form['spec']
        ename=request.form['ename']
        age=request.form['age']
        contact=request.form['contact']
        salary=request.form['salary']
        pass1=request.form['pass1']
        un=request.form['uname']
        a ="INSERT into doctor values('{}','{}','{}') ".format(eid,did,spec)
        cursor.execute(a)
        con.commit()
        c ="INSERT into employes values('{}','{}','{}','{}','{}','{}','{}') ".format(eid,ename,age,salary,contact,un,pass1)
        cursor.execute(c)
        con.commit()

        return render_template('doctor.html',msg='sss')


@app.route('/pat_edit',methods=["POST" , "GET"])
def pat_edit():
    if request.method == "POST":
        pid=request.form['pid']
        pname=request.form['pname']
        gender=request.form['gender']
        contact=request.form['contact']
        a ="INSERT into patient values('{}','{}','{}','{}') ".format(pid,pname,gender,contact)
        cursor.execute(a)
        con.commit()
        return render_template('patient.html',msg='sss')



@app.route('/staff_edit',methods=["POST" , "GET"])
def staff_edit():
    if request.method == "POST":
        eid=request.form['eid']
        ename=request.form['ename']
        age=request.form['age']
        contact=request.form['contact']
        salary=request.form['salary']
        pass1=request.form['pass1']
        un=request.form['uname']
        c ="INSERT into employes values('{}','{}','{}','{}','{}','{}','{}') ".format(eid,ename,age,salary,contact,un,pass1)
        cursor.execute(c)
        con.commit()
        return render_template('staff.html',msg='sss')

@app.route('/med_edit',methods=["POST" , "GET"])
def med_edit():
    if request.method == "POST":
        mid=request.form['mid']
        mname=request.form['mname']
        bn=request.form['bn']
        pd=request.form['pd']
        ed=request.form['ed']
        a ="INSERT into medicine values('{}','{}','{}','{}','{}') ".format(mid,mname,bn,pd,ed)
        cursor.execute(a)
        con.commit()
        return render_template('medicine.html',msg='sss')



#########################################################################################
#Delete
#########################################################################################


@app.route('/doc_del',methods=["POST" , "GET"])
def doc_del():
    if request.method == "POST":
        damdam=request.form['damdam']
        a="DELETE from doctor where E_ID='{}'".format(damdam)
        cursor.execute(a)
        con.commit()

        b="DELETE from employes where E_ID='{}'".format(damdam)
        cursor.execute(b)
        con.commit()

        return render_template('doctor.html',msg='sss')
@app.route('/pat_del',methods=["POST" , "GET"])
def pat_del():
    if request.method == "POST":
        damdam=request.form['damdam']
        a="DELETE from patient where P_ID='{}'".format(damdam)
        cursor.execute(a)
        con.commit()
        return render_template('patient.html',msg='sss')

@app.route('/staff_del',methods=["POST" , "GET"])
def staff_del():
    if request.method == "POST":
        damdam=request.form['damdam']
        b="DELETE from employes where E_ID='{}'".format(damdam)
        cursor.execute(b)
        con.commit()
        return render_template('staff.html',msg='sss')


@app.route('/med_del',methods=["POST" , "GET"])
def med_del():
    if request.method == "POST":
        damdam=request.form['damdam']
        a="DELETE from medicine where Med_ID='{}'".format(damdam)
        cursor.execute(a)
        con.commit()
        return render_template('medicine.html',msg='sss')



if __name__ == '__main__':
	app.secret_key = os.urandom(12)
	app.run(debug=True)
