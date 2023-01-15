# MEDHEALTH APP :
 this application was developed for the web/mobile project
 of this year year. this project called +medihealth helps patient to 
 follow their medication schedual time by adding  their prescripted drugs and setting  alarms and notofications.
 In order to launch this app correctly ,this configurations are needed :
# BACKEND

Django is an open source web framework in Python. It aims to make the development of web applications simple and based on code reuse. Developed in 2003 for Lawrence's local newspaper, Django was released under the BSD license from July 2005.

## Installation & getting the environnement ready

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install Django.
but first follow this commands:

you are at: "path/Pills-Reminder-App"

```bash
cd backend
pip install virtualenv
virtualenv myenv     
Set-ExecutionPolicy Unrestricted -Force  
Set-ExecutionPolicy Unrestricted -Scope Process
.\myenv\Scripts\activate
pip install django     
pip install djangorestframework
pip install django-cors-headers
pip install djangorestframework-simplejwt
```

## Usage

```python
python manage.py runserver
```

# FRONTEND

Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia and the web from a single code base.

## Installation & getting the environnement ready

first you must have flutter installed on your computer and set on your environnement variable.
second install the android studio .

make sure the sdk exist and the path is right.

flutter version must be >=2.18.1 : 
```bash
flutter --version
```
to see your version and to upgrade 
```bash
flutter --upgrade
```
finally to set up the environnement correctly 
```bash
flutter pub get
flutter run --web-port=3000
```
if you encounter any problems please do :
```bash
flutter doctor -v
```
else please don't hesitate to Contact us via email : bouraoui.gahbiche@supcom.tn


GOOD LUCK.