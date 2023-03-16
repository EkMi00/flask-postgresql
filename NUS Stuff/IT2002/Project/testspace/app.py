from flask import Flask, render_template, request
import sqlalchemy
from sqlalchemy import create_engine, MetaData, Table, Column, Numeric, Integer, VARCHAR
from sqlalchemy.engine import result

app = Flask(__name__)

YOUR_POSTGRES_PASSWORD = "postgres"
connection_string = f"postgresql://postgres:{YOUR_POSTGRES_PASSWORD}@localhost/postgres"
engine = sqlalchemy.create_engine(
    "postgresql://postgres:postgres@localhost/postgres"
)

meta = MetaData()
meta.reflect(bind=engine)

students = Table(
    'students', meta,
    Column('id', Integer, primary_key=True),
    Column('fname', VARCHAR),
    Column('lname', VARCHAR),
    Column('pet', VARCHAR),
    extend_existing=True
)

meta.create_all(engine)

db = engine.connect()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/submit', methods=['POST'])
def submit():
    fname = request.form['fname']
    lname = request.form['lname']
    pet = request.form['pets']

    statement = sqlalchemy.text(f"INSERT INTO students (fname,lname,pet) VALUES ('{fname}','{lname}','{pet}')")
    db.execute(statement)
    db.commit()

    return render_template('success.html', data=fname)

if __name__ == '__main__':
    app.run(debug=True)